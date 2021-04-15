{**
 * templates/frontend/components/languageSwitcher.tpl
 *
 * Copyright (c) 2014-2016 Simon Fraser University
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief A re-usable template for displaying a language switcher dropdown.
 *
 * @uses $currentLocale string Locale key for the locale being displayed
 * @uses $languageToggleLocales array All supported locales
 * @uses $id string A unique ID for this language toggle
 *}
{if $languageToggleLocales && $languageToggleLocales|@count > 1}

			<a class="nav-link dropdown-toggle ojCurrLoc" id="languageToggleMenu{$id|escape}" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">

				{$languageToggleLocales[$currentLocale]|substr:0:2|replace:"Ne":"NL"|escape}
			</a>


				{foreach from=$languageToggleLocales item="localeName" key="localeKey"}
					{if $localeKey !== $currentLocale}
						<a class="dropdown-item" href="{url router=$smarty.const.ROUTE_PAGE page="user" op="setLocale" path=$localeKey source=$smarty.server.REQUEST_URI}">
							{$localeKey|substr:0:2|escape}
						</a>
					{/if}
				{/foreach}


{/if}
