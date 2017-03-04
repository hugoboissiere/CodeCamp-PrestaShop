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
*
* Don't forget to prefix your containers with your own identifier
* to avoid any conflicts with others containers.
*/

function show() {
	var a = document.querySelectorAll(".active > input:nth-child(1)");
	for (i = 0;a[i];i++) {
		console.log(i);
		document.querySelectorAll(".active > input:nth-child(1)")[i].addEventListener("click",function () {
			var c = this.parentElement.parentElement.parentElement.querySelectorAll("input,button,select");
			for (b = 1;c[b];b++) {
				if (!c[b].hasAttribute("disabled"))
					c[b].setAttribute("disabled","disabled");
				else
					c[b].removeAttribute("disabled");
			}
		});
		document.querySelectorAll(".active > input:nth-child(1)")[i].click();
	}
}

$(document).ready(function() {
	$('#group-select').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#language-select').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#money-select').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#country-select').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#gender-select').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#abort-category-select').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#abort-brand-select').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#abort-product-select').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#purchase-category-select').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#purchase-brand-select').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#purchase-product-select').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#payment').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	$('#delivery').multiselect({
		maxHeight: 200,
		buttonWidth: '153px'
	});
	if ( $('#no_command_date')[0].type != 'date' ) $('#no_command_date').datepicker();
});

$(window).load(function(){show();});
