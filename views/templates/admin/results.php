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

global $cookie;

require_once(dirname(__FILE__).'/../../../../../config/config.inc.php');
include_once(dirname(__FILE__).'/../../../codecamp.php');

$db = Db::getInstance(_PS_USE_SQL_SLAVE_);

$select = 'SELECT a.firstname, a.lastname, c.email, a.phone, a.address1, a.address2, a.postcode, a.city, p.name as country, l.name as lang, d.name as currency, g.name as gender' . (isset($_POST["NEWSLETTER_MODE"]) ? ', c.newsletter' : '') . (isset($_POST["OPT_MODE"]) ? ', c.optin' : '') . (isset($_POST["GRPCLIENT_MODE"]) ? ', grl.name as grp' : '') . (isset($_POST["AGE_MODE"]) ? ', TRUNCATE(DATEDIFF(NOW(), c.birthday) / 365.25, 0) as age' : '') . (isset($_POST["NO_COMMAND"]) ? ', MIN(o.date_add) as date_add' : '');

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
            ON grl.id_group = cg.id_group AND grl.id_lang = ' . (int)$cookie->id_lang .
        (isset($_POST["NO_COMMAND"])
            ? ' LEFT JOIN ' . _DB_PREFIX_ . 'orders as o
                    ON o.id_customer = c.id_customer'
            : '') . '
        WHERE true ' . (isset($_POST["NEWSLETTER_MODE"])
                            ? 'AND c.newsletter = ' . (int)$_POST["NEWSLETTER_MODE"]
                            : '')
                     . (isset($_POST["OPT_MODE"])
                            ? 'AND c.optin = ' . (int)$_POST["OPT_MODE"]
                            : '')
                     . (isset($_POST["AGE_MODE"]) && $_POST["AGE_MODE"]
                            ? 'AND (DATEDIFF(NOW(), c.birthday) / 365.25) > ' . (int)$_POST["ageMin"] . '
                               AND (DATEDIFF(NOW(), c.birthday) / 365.25) < ' . (int)$_POST["ageMax"]
                            : (isset($_POST["AGE_MODE"])
                                ? 'AND ((DATEDIFF(NOW(), c.birthday) / 365.25) < ' . (int)$_POST["ageMin"] . '
                                   OR   (DATEDIFF(NOW(), c.birthday) / 365.25) > ' . (int)$_POST["ageMax"] . ')'
                                : ''))
                     . (isset($_POST["NO_COMMAND"])
                            ? 'AND o.date_add '
                            : '');

if (isset($_POST["group"]) && is_array($_POST["group"]))
{
    if ($_POST["GRPCLIENT_MODE"])
        $from .= ' AND (false';
    foreach ($_POST["group"] as $value)
    {
        if ($_POST["GRPCLIENT_MODE"])
            $from .= ' OR grl.name = "' . pSQL($value) . '"';
        else
            $from .= ' AND grl.name <> "' . pSQL($value) . '"';
    }
    if ($_POST["GRPCLIENT_MODE"])
        $from .= ')';
}

if (isset($_POST["lang"]) && is_array($_POST["lang"]))
{
    if ($_POST["LANGUE_MODE"])
        $from .= ' AND (false';
    foreach ($_POST["lang"] as $value)
    {
        if ($_POST["LANGUE_MODE"])
            $from .= ' OR l.name = "' . pSQL($value) . '"';
        else
            $from .= ' AND l.name <> "' . pSQL($value) . '"';
    }
    if ($_POST["LANGUE_MODE"])
        $from .= ')';
}

if (isset($_POST["currency"]) && is_array($_POST["currency"]))
{
    if ($_POST["DEVISE_MODE"])
        $from .= ' AND (false';
    foreach ($_POST["currency"] as $value)
    {
        if ($_POST["DEVISE_MODE"])
            $from .= ' OR d.name = "' . pSQL($value) . '"';
        else
            $from .= ' AND d.name <> "' . pSQL($value) . '"';
    }
    if ($_POST["DEVISE_MODE"])
        $from .= ')';
}

if (isset($_POST["country"]) && is_array($_POST["country"]))
{
    if ($_POST["PDL_MODE"])
        $from .= ' AND (false';
    foreach ($_POST["country"] as $value)
    {
        if ($_POST["PDL_MODE"])
            $from .= ' OR p.name = "' . pSQL($value) . '"';
        else
            $from .= ' AND p.name <> "' . pSQL($value) . '"';
    }
    if ($_POST["PDL_MODE"])
        $from .= ')';
}

if (isset($_POST["gender"]) && is_array($_POST["gender"]))
{
    if ($_POST["SEXE_MODE"])
        $from .= ' AND (false';
    foreach ($_POST["gender"] as $value)
    {
        if ($_POST["SEXE_MODE"])
            $from .= ' OR g.name = "' . pSQL($value) . '"';
        else
            $from .= ' AND g.name <> "' . pSQL($value) . '"';
    }
    if ($_POST["SEXE_MODE"])
        $from .= ')';
}

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

header('Content-type: text/csv');
header('Content-Disposition: attachment; filename="results.csv"');

foreach ($keys as $key)
{
	echo $key["key"] . ";";
}
echo "\n";
foreach ($results as $row)
{
	foreach ($row as $cell)
	{
		echo $cell . ";";
	}
	echo "\n";
}
