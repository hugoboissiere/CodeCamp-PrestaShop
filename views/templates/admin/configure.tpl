{*
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
*}

<link rel="stylesheet" type="text/css" href="{$module_dir}/views/css/back.css">
<link rel="stylesheet" type="text/css" href="{$module_dir}/views/css/bootstrap-multiselect.css">
<script type="text/javascript" src="{$module_dir}/views/js/bootstrap-multiselect.js"></script>

<div class="panel">
	<h3><i class="icon icon-cogs"></i> Settings</h3>
	<form method="POST" action="" id="csvform">
		<div class="panel">
			<h3>Profil</h3>
			<table>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Newsletter</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="NEWSLETTER_MODE" id="NEWSLETTER_MODE_on" value="1" type="radio">
							<label for="NEWSLETTER_MODE_on">Yes</label>
							<input name="NEWSLETTER_MODE" id="NEWSLETTER_MODE_off" value="" checked="checked" type="radio">
							<label for="NEWSLETTER_MODE_off">No</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Opt-in</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="OPT_MODE" id="OPT_MODE_on" value="1" type="radio">
							<label for="OPT_MODE_on">Yes</label>
							<input name="OPT_MODE" id="OPT_MODE_off" value="" checked="checked" type="radio">
							<label for="OPT_MODE_off">No</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Groupe Client</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="GRPCLIENT_MODE" id="GRPCLIENT_MODE_on" value="1" type="radio">
							<label for="GRPCLIENT_MODE_on">Inclure</label>
							<input name="GRPCLIENT_MODE" id="GRPCLIENT_MODE_off" value="" checked="checked" type="radio">
							<label for="GRPCLIENT_MODE_off">Exclure</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="group[]" id="group-select">
								{foreach from=$groups item=group}
								<option value="{$group.name}">{$group.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Langue</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="LANGUE_MODE" id="LANGUE_MODE_on" value="1" type="radio">
							<label for="LANGUE_MODE_on">Inclure</label>
							<input name="LANGUE_MODE" id="LANGUE_MODE_off" value="" checked="checked" type="radio">
							<label for="LANGUE_MODE_off">Exclure</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="lang[]" id="language-select">
								{foreach from=$lang item=l}
								<option value="{$l.name}">{$l.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Devise</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="DEVISE_MODE" id="DEVISE_MODE_on" value="1" type="radio">
							<label for="DEVISE_MODE_on">Inclure</label>
							<input name="DEVISE_MODE" id="DEVISE_MODE_off" value="" checked="checked" type="radio">
							<label for="DEVISE_MODE_off">Exclure</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="currency[]" id="money-select">
								{foreach from=$curr item=c}
								<option value="{$c.name}">{$c.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Pays De Livraison</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="PDL_MODE" id="PDL_MODE_on" value="1" type="radio">
							<label for="PDL_MODE_on">Inclure</label>
							<input name="PDL_MODE" id="PDL_MODE_off" value="" checked="checked" type="radio">
							<label for="PDL_MODE_off">Exclure</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="country[]" id="country-select">
								{foreach from=$countries item=country}
								<option value="{$country.name}">{$country.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Age</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="AGE_MODE" id="AGE_MODE_on" value="1" type="radio">
							<label for="AGE_MODE_on">Inclure</label>
							<input name="AGE_MODE" id="AGE_MODE_off" value="" checked="checked" type="radio">
							<label for="AGE_MODE_off">Exclure</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<input type="number" name="ageMin" min="1" max="99" class="bday">
							<input type="number" name="ageMax" min="1" max="99" class="bday">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Sexe</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="SEXE_MODE" id="SEXE_MODE_on" value="1" type="radio">
							<label for="SEXE_MODE_on">Inclure</label>
							<input name="SEXE_MODE" id="SEXE_MODE_off" value="" checked="checked" type="radio">
							<label for="SEXE_MODE_off">Exclure</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="gender[]" id="gender-select">
								{foreach from=$gender item=g}
								<option value="{$g.name}">{$g.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="panel">
			<h3>Abandons de paniers</h3>
			<table>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Abandon - Catégorie</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="ABORT_CATEGORY_MODE" id="ABORT_CATEGORY_MODE_on" value="1" type="radio">
							<label for="ABORT_CATEGORY_MODE_on">Yes</label>
							<input name="ABORT_CATEGORY_MODE" id="ABORT_CATEGORY_MODE_off" value="" checked="checked" type="radio">
							<label for="ABORT_CATEGORY_MODE_off">No</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="category[]" id="abort-category-select">
								{foreach from=$categories item=category}
								<option value="{$category.name}">{$category.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Abandon - Marque</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="ABORT_BRAND_MODE" id="ABORT_BRAND_MODE_on" value="1" type="radio">
							<label for="ABORT_BRAND_MODE_on">Yes</label>
							<input name="ABORT_BRAND_MODE" id="ABORT_BRAND_MODE_off" value="" checked="checked" type="radio">
							<label for="ABORT_BRAND_MODE_off">No</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="manufacturer[]" id="abort-brand-select">
								{foreach from=$manufacturer item=man}
								<option value="{$man.name}">{$man.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Abandon - Produit</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="ABORT_PRODUCT_MODE" id="ABORT_PRODUCT_MODE_on" value="1" type="radio">
							<label for="ABORT_PRODUCT_MODE_on">Yes</label>
							<input name="ABORT_PRODUCT_MODE" id="ABORT_PRODUCT_MODE_off" value="" checked="checked" type="radio">
							<label for="ABORT_PRODUCT_MODE_off">No</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="products[]" id="abort-product-select">
								{foreach from=$products item=product}
								<option value="{$product.name}">{$product.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Abandon - Montant</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="ABORT_AMOUNT_MODE" id="ABORT_AMOUNT_MODE_on" value="1" type="radio">
							<label for="ABORT_AMOUNT_MODE_on">Inclure</label>
							<input name="ABORT_AMOUNT_MODE" id="ABORT_AMOUNT_MODE_off" value="" checked="checked" type="radio">
							<label for="ABORT_AMOUNT_MODE_off">Exclure</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<input type="number" name="abortAmountMin" min="0" class="bday">
							<input type="number" name="abortAmountMax" min="0" class="bday">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="panel">
			<h3>Activité</h3>
			<table>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>N'ayant pas passé commande</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="NO_COMMAND" id="NO_COMMAND_before" value="1" type="radio">
							<label for="NO_COMMAND_before">Avant</label>
							<input name="NO_COMMAND" id="NO_COMMAND_after" value="" checked="checked" type="radio">
							<label for="NO_COMMAND_after">Après</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<input type="date" name="amountMin" id="no_command_date" class="bday">
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Nombre de commandes passées</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="NUMBER_OF_COMMANDS" id="NUMBER_OF_COMMANDS_on" value="1" type="radio">
							<label for="NUMBER_OF_COMMANDS_on">Inclure</label>
							<input name="NUMBER_OF_COMMANDS" id="NUMBER_OF_COMMANDS_off" value="" checked="checked" type="radio">
							<label for="NUMBER_OF_COMMANDS_off">Exclure</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<input type="number" name="numberOfCommandsMin" min="0" class="bday">
							<input type="number" name="numberOfCommandsMax" min="0" class="bday">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="panel">
			<h3>Achats spécifiques et montants</h3>
			<table>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Achat - Catégorie</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="PURCHASE_CATEGORY_MODE" id="PURCHASE_CATEGORY_MODE_on" value="1" type="radio">
							<label for="PURCHASE_CATEGORY_MODE_on">Yes</label>
							<input name="PURCHASE_CATEGORY_MODE" id="PURCHASE_CATEGORY_MODE_off" value="" checked="checked" type="radio">
							<label for="PURCHASE_CATEGORY_MODE_off">No</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="purchase_cat[]" id="purchase-category-select">
								{foreach from=$categories item=category}
								<option value="{$category.name}">{$category.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Achat - Marque</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="PURCHASE_BRAND_MODE" id="PURCHASE_BRAND_MODE_on" value="1" type="radio">
							<label for="PURCHASE_BRAND_MODE_on">Yes</label>
							<input name="PURCHASE_BRAND_MODE" id="PURCHASE_BRAND_MODE_off" value="" checked="checked" type="radio">
							<label for="PURCHASE_BRAND_MODE_off">No</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="purchase_man[]" id="purchase-brand-select">
								{foreach from=$manufacturer item=man}
								<option value="{$man.name}">{$man.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Achat - Produit</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="PURCHASE_PRODUCT_MODE" id="PURCHASE_PRODUCT_MODE_on" value="1" type="radio">
							<label for="PURCHASE_PRODUCT_MODE_on">Yes</label>
							<input name="PURCHASE_PRODUCT_MODE" id="PURCHASE_PRODUCT_MODE_off" value="" checked="checked" type="radio">
							<label for="PURCHASE_PRODUCT_MODE_off">No</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="purchase_product[]" id="purchase-product-select">
								{foreach from=$products item=product}
								<option value="{$product.name}">{$product.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Achat - Montant</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="PURCHASE_AMOUNT_MODE" id="PURCHASE_AMOUNT_MODE_on" value="1" type="radio">
							<label for="PURCHASE_AMOUNT_MODE_on">Inclure</label>
							<input name="PURCHASE_AMOUNT_MODE" id="PURCHASE_AMOUNT_MODE_off" value="" checked="checked" type="radio">
							<label for="PURCHASE_AMOUNT_MODE_off">Exclure</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<input type="number" name="purchaseAmountMin" min="0" class="bday">
							<input type="number" name="purchaseAmountMax" min="0" class="bday">
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="panel">
			<h3>Habitudes</h3>
			<table>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Moyen de paiement utilisé</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="PAYMENT" id="PAYMENT_on" value="1" type="radio">
							<label for="PAYMENT_on">Inclure</label>
							<input name="PAYMENT" id="PAYMENT_on" value="" checked="checked" type="radio">
							<label for="PAYMENT_on">Exclure</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="payment[]" id="payment">
								{foreach from=$payment item=p}
								<option value="{$p.name}">{$p.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="active"><input type="checkbox" checked></div>
					</td>
					<td>
						<p>Moyen de livraison utilisé</p>
					</td>
					<td>
						<span class="switch prestashop-switch fixed-width-lg">
							<input name="DELIVERY" id="DELIVERY_on" value="1" type="radio">
							<label for="DELIVERY_on">Inclure</label>
							<input name="DELIVERY" id="DELIVERY_off" value="" checked="checked" type="radio">
							<label for="DELIVERY_off">Exclure</label>
							<a class="slide-button btn"></a>
						</span>
					</td>
					<td>
						<div>
							<select multiple="multiple" name="carrier[]" id="delivery">
								{foreach from=$carriers item=carrier}
								<option value="{$carrier.name}">{$carrier.name}</option>
								{/foreach}
							</select>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div class="panel-footer">
			<button type="submit" value="1" id="results" name="submit" class="btn btn-default">
				<i class="icon icon-arrow-down"></i> Show results
			</button>
			<button type="submit" value="2" id="exportcsv" name="submit" class="btn btn-default">
				<i class="icon icon-arrow-down"></i> Export in CSV
			</button>
		</div>
	</form>
</div>

<div class="panel">
	<h3><i class="icon icon-code"></i> SQL request</h3>
	{$sql}
</div>

<div class="panel">
	<h3><i class="icon icon-th"></i> CSV results</h3>
	<p>
		<table id="preprint">
			<tr>
				{foreach from=$keys item=key}
				<th>{$key.key}</th>
				{/foreach}
			</tr>
			{foreach from=$results item=row}
			<tr>
				{foreach from=$row item=i}
				<td>{$i}</td>
				{/foreach}
			</tr>
			{/foreach}
		</table>
	</p>
</div>
