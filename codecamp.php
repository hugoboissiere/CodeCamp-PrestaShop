<?php
/**
* 2007-2015 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2015 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_PS_VERSION_')) {
    exit;
}

class Codecamp extends Module
{
    protected $config_form = false;

    public function __construct()
    {
        $this->name = 'codecamp';
        $this->tab = 'administration';
        $this->version = '0.0.1';
        $this->author = 'Hugo BOISSIERE';
        $this->need_instance = 0;

        /**
         * Set $this->bootstrap to true if your module is compliant with bootstrap (PrestaShop 1.6)
         */
        $this->bootstrap = true;

        parent::__construct();

        $this->displayName = $this->l('Segmentation Retargeting Clients');
        $this->description = $this->l('Outil permettant de récupérer les informations des clients en fonction de différents paramètres.');

        $this->confirmUninstall = $this->l('');

        $this->ps_versions_compliancy = array('min' => '1.6', 'max' => _PS_VERSION_);
    }

    /**
     * Don't forget to create update methods if needed:
     * http://doc.prestashop.com/display/PS16/Enabling+the+Auto-Update
     */
    public function install()
    {
        Configuration::updateValue('CODECAMP_LIVE_MODE', false);

        return parent::install() &&
            $this->registerHook('header') &&
            $this->registerHook('backOfficeHeader');
    }

    public function uninstall()
    {
        Configuration::deleteByName('CODECAMP_LIVE_MODE');

        return parent::uninstall();
    }

    /**
     * Load the configuration form
     */
    public function getContent()
    {
        /**
         * If values have been submitted in the form, process.
         */
        if (((bool)Tools::isSubmit('submitCodecampModule')) == true) {
            $this->postProcess();
        }

        $this->context->smarty->assign('module_dir', $this->_path);

        global $cookie;

        $db = Db::getInstance(_PS_USE_SQL_SLAVE_);

        $select = 'SELECT a.firstname, a.lastname, c.email, a.phone, a.address1, a.address2, a.postcode, a.city, p.name as country, l.name as lang, d.name as currency, g.name as gender' . (isset(Tools::getValue("NEWSLETTER_MODE")) ? ', c.newsletter' : '') . (isset(Tools::getValue("OPT_MODE")) ? ', c.optin' : '') . (isset(Tools::getValue("GRPCLIENT_MODE")) ? ', grl.name as grp' : '') . (isset(Tools::getValue("AGE_MODE")) ? ', TRUNCATE(DATEDIFF(NOW(), c.birthday) / 365.25, 0) as age' : '');

        $from = 'FROM ' . _DB_PREFIX_ . 'address as a
                LEFT JOIN ' . _DB_PREFIX_ . 'customer as c
                    ON a.id_customer = c.id_customer
                LEFT JOIN ' . _DB_PREFIX_ . 'country_lang as p
                    ON a.id_country = p.id_country AND p.id_lang = ' . (int)$cookie->id_lang . '
                LEFT JOIN ' . _DB_PREFIX_ . 'lang as l
                    ON l.id_lang = c.id_lang
                LEFT JOIN ' . _DB_PREFIX_ . 'currency_shop as cs
                    ON cs.id_shop = c.id_shop
                LEFT JOIN ' . _DB_PREFIX_ . 'currency as d
                    ON d.id_currency = cs.id_currency
                LEFT JOIN ' . _DB_PREFIX_ . 'gender_lang as g
                    ON g.id_gender = c.id_gender AND g.id_lang = ' . (int)$cookie->id_lang . '
                LEFT JOIN ' . _DB_PREFIX_ . 'customer_group as cg
                    ON cg.id_customer = c.id_customer
                LEFT JOIN ' . _DB_PREFIX_ . 'group_lang as grl
                    ON grl.id_group = cg.id_group AND grl.id_lang = ' . (int)$cookie->id_lang . '
                WHERE true ' . (isset(Tools::getValue("NEWSLETTER_MODE"))
                                    ? 'AND c.newsletter = ' . (int)Tools::getValue("NEWSLETTER_MODE")
                                    : '')
                             . (isset(Tools::getValue("OPT_MODE"))
                                    ? ' AND c.optin = ' . (int)Tools::getValue("OPT_MODE")
                                    : '')
                             . (isset(Tools::getValue("AGE_MODE")) && Tools::getValue("AGE_MODE")
                                    ? ' AND (DATEDIFF(NOW(), c.birthday) / 365.25) > ' . (int)Tools::getValue("ageMin") . '
                                        AND (DATEDIFF(NOW(), c.birthday) / 365.25) < ' . (int)Tools::getValue("ageMax")
                                    : (isset(Tools::getValue("AGE_MODE"))
                                        ? ' AND ((DATEDIFF(NOW(), c.birthday) / 365.25) < ' . (int)Tools::getValue("ageMin") . '
                                            OR   (DATEDIFF(NOW(), c.birthday) / 365.25) > ' . (int)Tools::getValue("ageMax") . ')'
                                        : ''));

        if (isset(Tools::getValue("group")) && is_array(Tools::getValue("group")))
        {
            if (Tools::getValue("GRPCLIENT_MODE"))
                $from .= ' AND (false';
            foreach (Tools::getValue("group") as $value)
            {
                if (Tools::getValue("GRPCLIENT_MODE"))
                    $from .= ' OR grl.name = "' . pSQL($value) . '"';
                else
                    $from .= ' AND grl.name <> "' . pSQL($value) . '"';
            }
            if (Tools::getValue("GRPCLIENT_MODE"))
                $from .= ')';
        }

        if (isset(Tools::getValue("lang")) && is_array(Tools::getValue("lang")))
        {
            if (Tools::getValue("LANGUE_MODE"))
                $from .= ' AND (false';
            foreach (Tools::getValue("lang") as $value)
            {
                if (Tools::getValue("LANGUE_MODE"))
                    $from .= ' OR l.name = "' . pSQL($value) . '"';
                else
                    $from .= ' AND l.name <> "' . pSQL($value) . '"';
            }
            if (Tools::getValue("LANGUE_MODE"))
                $from .= ')';
        }

        if (isset(Tools::getValue("currency")) && is_array(Tools::getValue("currency")))
        {
            if (Tools::getValue("DEVISE_MODE"))
                $from .= ' AND (false';
            foreach (Tools::getValue("currency") as $value)
            {
                if (Tools::getValue("DEVISE_MODE"))
                    $from .= ' OR d.name = "' . pSQL($value) . '"';
                else
                    $from .= ' AND d.name <> "' . pSQL($value) . '"';
            }
            if (Tools::getValue("DEVISE_MODE"))
                $from .= ')';
        }

        if (isset(Tools::getValue("country")) && is_array(Tools::getValue("country")))
        {
            if (Tools::getValue("PDL_MODE"))
                $from .= ' AND (false';
            foreach (Tools::getValue("country") as $value)
            {
                if (Tools::getValue("PDL_MODE"))
                    $from .= ' OR p.name = "' . pSQL($value) . '"';
                else
                    $from .= ' AND p.name <> "' . pSQL($value) . '"';
            }
            if (Tools::getValue("PDL_MODE"))
                $from .= ')';
        }

        if (isset(Tools::getValue("gender")) && is_array(Tools::getValue("gender")))
        {
            if (Tools::getValue("SEXE_MODE"))
                $from .= ' AND (false';
            foreach (Tools::getValue("gender") as $value)
            {
                if (Tools::getValue("SEXE_MODE"))
                    $from .= ' OR g.name = "' . pSQL($value) . '"';
                else
                    $from .= ' AND g.name <> "' . pSQL($value) . '"';
            }
            if (Tools::getValue("SEXE_MODE"))
                $from .= ')';
        }

        $this->context->smarty->assign("sql", $select . ' ' . $from);

        $arr = [];
        $keys = [];
        if ($results = $db->ExecuteS($select . ' ' . $from))
        {
            $i = 0;
            foreach ($results as $row)
            {
                $arr[$i] = $row;
                $i++;
            }
            if ($i > 0)
            {
                $i = 0;
                $base = array("firstname", "lastname", "email", "phone", "gender", "address1", "address2", "postcode", "city", "country", "lang", "currency");
                foreach ($arr[0] as $key => $cell)
                {
                    $keys[$i]["key"] = $key;
                    $keys[$i]["optionnal"] = !in_array($key, $base);
                    $i++;
                }
            }
        }

        $sql_grp = 'SELECT name FROM ' . _DB_PREFIX_ . 'group_lang WHERE id_lang = ' . (int)$cookie->id_lang . ' ORDER BY name';
        if (!($grp = $db->ExecuteS($sql_grp)))
            $grp = "Error";

        $sql_lang = 'SELECT name FROM ' . _DB_PREFIX_ . 'lang ORDER BY name';
        if (!($lang = $db->ExecuteS($sql_lang)))
            $lang = "Error";

        $sql_curr = 'SELECT name FROM ' . _DB_PREFIX_ . 'currency ORDER BY name';
        if (!($curr = $db->ExecuteS($sql_curr)))
            $curr = "Error";

        $sql_country = 'SELECT name FROM ' . _DB_PREFIX_ . 'country_lang WHERE id_lang = ' . (int)$cookie->id_lang . ' ORDER BY name';
        if (!($country = $db->ExecuteS($sql_country)))
            $country = "Error";

        $sql_gender = 'SELECT name FROM ' . _DB_PREFIX_ . 'gender_lang WHERE id_lang = ' . (int)$cookie->id_lang . ' ORDER BY name';
        if (!($gender = $db->ExecuteS($sql_gender)))
            $gender = "Error";

        $sql_categories = 'SELECT name FROM ' . _DB_PREFIX_ . 'category_lang WHERE id_lang = ' . (int)$cookie->id_lang . ' AND id_category > 1 ORDER BY name';
        if (!($categories = $db->ExecuteS($sql_categories)))
            $categories = "Error";

        $sql_manufacturer = 'SELECT name FROM ' . _DB_PREFIX_ . 'manufacturer ORDER BY name';
        if (!($manufacturer = $db->ExecuteS($sql_manufacturer)))
            $manufacturer = "Error";

        $sql_products = 'SELECT name FROM ' . _DB_PREFIX_ . 'product_lang ORDER BY name';
        if (!($products = $db->ExecuteS($sql_products)))
            $products = "Error";

        $this->context->smarty->assign('results', $arr);
        $this->context->smarty->assign('keys', $keys);
        $this->context->smarty->assign('groups', $grp);
        $this->context->smarty->assign('lang', $lang);
        $this->context->smarty->assign('curr', $curr);
        $this->context->smarty->assign('countries', $country);
        $this->context->smarty->assign('gender', $gender);
        $this->context->smarty->assign('categories', $categories);
        $this->context->smarty->assign('manufacturer', $manufacturer);
        $this->context->smarty->assign('products', $products);

        $output = $this->context->smarty->fetch($this->local_path.'views/templates/admin/configure.tpl');

        return $output.$this->renderForm();
    }

    /**
     * Create the form that will be displayed in the configuration of your module.
     */
    protected function renderForm()
    {
        $helper = new HelperForm();

        $helper->show_toolbar = false;
        $helper->table = $this->table;
        $helper->module = $this;
        $helper->default_form_language = $this->context->language->id;
        $helper->allow_employee_form_lang = Configuration::get('PS_BO_ALLOW_EMPLOYEE_FORM_LANG', 0);

        $helper->identifier = $this->identifier;
        $helper->submit_action = 'submitCodecampModule';
        $helper->currentIndex = $this->context->link->getAdminLink('AdminModules', false)
            .'&configure='.$this->name.'&tab_module='.$this->tab.'&module_name='.$this->name;
        $helper->token = Tools::getAdminTokenLite('AdminModules');

        $helper->tpl_vars = array(
            'fields_value' => $this->getConfigFormValues(), /* Add values for your inputs */
            'languages' => $this->context->controller->getLanguages(),
            'id_language' => $this->context->language->id,
        );

        return $helper->generateForm(array($this->getConfigForm()));
    }

    /**
     * Create the structure of your form.
     */
    protected function getConfigForm()
    {
        return array(
            'form' => array(
                'legend' => array(
                'title' => $this->l('Settings'),
                'icon' => 'icon-cogs',
                ),
                'input' => array(
                    array(
                        'type' => 'switch',
                        'label' => $this->l('Live mode'),
                        'name' => 'CODECAMP_LIVE_MODE',
                        'is_bool' => true,
                        'desc' => $this->l('Use this module in live mode'),
                        'values' => array(
                            array(
                                'id' => 'active_on',
                                'value' => true,
                                'label' => $this->l('Enabled')
                            ),
                            array(
                                'id' => 'active_off',
                                'value' => false,
                                'label' => $this->l('Disabled')
                            )
                        ),
                    ),
                    array(
                        'col' => 3,
                        'type' => 'text',
                        'prefix' => '<i class="icon icon-envelope"></i>',
                        'desc' => $this->l('Enter a valid email address'),
                        'name' => 'CODECAMP_ACCOUNT_EMAIL',
                        'label' => $this->l('Email'),
                    ),
                    array(
                        'type' => 'password',
                        'name' => 'CODECAMP_ACCOUNT_PASSWORD',
                        'label' => $this->l('Password'),
                    ),
                ),
                'submit' => array(
                    'title' => $this->l('Save'),
                ),
            ),
        );
    }

    /**
     * Set values for the inputs.
     */
    protected function getConfigFormValues()
    {
        return array(
            'CODECAMP_LIVE_MODE' => Configuration::get('CODECAMP_LIVE_MODE', true),
            'CODECAMP_ACCOUNT_EMAIL' => Configuration::get('CODECAMP_ACCOUNT_EMAIL', 'contact@prestashop.com'),
            'CODECAMP_ACCOUNT_PASSWORD' => Configuration::get('CODECAMP_ACCOUNT_PASSWORD', null),
        );
    }

    /**
     * Save form data.
     */
    protected function postProcess()
    {
        $form_values = $this->getConfigFormValues();

        foreach (array_keys($form_values) as $key) {
            Configuration::updateValue($key, Tools::getValue($key));
        }
    }

    /**
    * Add the CSS & JavaScript files you want to be loaded in the BO.
    */
    public function hookBackOfficeHeader()
    {
        if (Tools::getValue('module_name') == $this->name) {
            $this->context->controller->addJS($this->_path.'views/js/back.js');
            $this->context->controller->addCSS($this->_path.'views/css/back.css');
        }
    }

    /**
     * Add the CSS & JavaScript files you want to be added on the FO.
     */
    public function hookHeader()
    {
        $this->context->controller->addJS($this->_path.'/views/js/front.js');
        $this->context->controller->addCSS($this->_path.'/views/css/front.css');
    }
}
