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

// header('Expires: Mon, 26 Jul 1997 05:00:00 GMT');
// header('Last-Modified: '.gmdate('D, d M Y H:i:s').' GMT');

// header('Cache-Control: no-store, no-cache, must-revalidate');
// header('Cache-Control: post-check=0, pre-check=0', false);
// header('Pragma: no-cache');

// header('Location: ../');
// exit;

if (isset($_POST["submit"])) {
	$db = Db::getInstance(_PS_USE_SQL_SLAVE_);

	$sql = 'SELECT a.firstname, a.lastname, c.email, a.phone, a.address1, a.address2, a.postcode, a.city, p.name as country, l.iso_code as lang, d.name as currency, g.type as gender, c.newsletter, c.optin
			FROM ' . _DB_PREFIX_ . 'address as a
			LEFT JOIN ' . _DB_PREFIX_ . 'customer as c
				ON a.id_customer = c.id_customer
			LEFT JOIN ' . _DB_PREFIX_ . 'country_lang as p
				ON a.id_country = p.id_country AND p.id_lang = 1
			LEFT JOIN ' . _DB_PREFIX_ . 'lang as l
				ON l.id_lang = c.id_lang
			LEFT JOIN ' . _DB_PREFIX_ . 'currency_shop as cs
				ON cs.id_shop = c.id_shop
			LEFT JOIN ' . _DB_PREFIX_ . 'currency as d
				ON d.id_currency = cs.id_currency
			LEFT JOIN ' . _DB_PREFIX_ . 'gender as g
				ON g.id_gender = c.id_gender';

	if ($results = $db->ExecuteS($sql))
	{
		foreach ($results as $row)
		{
			echo $results . ";";
		}
	}
}
else {
?>
<form method="POST" action="">
	<input type="checkbox" name="Newsletter" /><span>Newsletter</span><br />
	<input type="checkbox" name="Opt-in" /><span>Opt-in</span><br />
	<input type="checkbox" name="Groupe client" /><span>Groupe client</span><br />
	<input type="checkbox" name="Langue" /><span>Langue</span><br />
	<input type="checkbox" name="Devise" /><span>Devise</span><br />
	<input type="checkbox" name="Pays" /><span>Pays</span><br />
	<input type="checkbox" name="Âge" /><span>Âge</span><br />
	<input type="checkbox" name="Sexe" /><span>Sexe</span><br />
	<input type="submit" name="submit" value="Submit" />
</form>
<?php }
