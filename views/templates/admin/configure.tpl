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
<script type="text/javascript" src="{$module_dir}/views/js/back.js"></script>

<div class="panel">
	<h3><i class="icon icon-cogs"></i> Settings</h3>
	<form method="POST" action="" id="csvform">
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
						<div>
							<input type="date" name="date" class ="bday" placeholder="jj/mm/AAAA">
							<input type="date" name="date" class ="bday" placeholder="jj/mm/AAAA">
						</div>
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
			<div class="panel-footer">
				<button type="submit" value="1" id="exportcsv" name="exportcsv" class="btn btn-default">
					<i class="icon icon-arrow-down"></i> Export in CSV
				</button>
				<a class="btn btn-default" id="download" href="../modules/codecamp/e.txt" download="e.txt"><i class="icon icon-arrow-down"></i> TEST DOWNLOAD</a>
			</div>
		</form>
		<div class="panel">
			{$sql}
		</div>
	</form>
	<div class="panel">
		{$sql}
	</div>
</div>

<div class="panel">
	<h3><i class="icon icon-th"></i> CSV results</h3>
	<p>
		{foreach from=$keys item=key}{$key.key};{/foreach}{"\n"}{foreach from=$results item=row}{foreach from=$row item=i}{$i};{/foreach}{"\n"}{/foreach}
	</p>
</div>
