{**
 * templates/frontend/components/searchForm_simple.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Simple display of a search form with just text input and search button
 *
 * @uses $searchQuery string Previously input search query
 *}
{if !$currentJournal || $currentJournal->getData('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
	{capture name="searchFormUrl"}{url page="search" op="search" escape=false}{/capture}
	{assign var=formUrlParameters value=[]}{* Prevent Smarty warning *}
	{$smarty.capture.searchFormUrl|parse_url:$smarty.const.PHP_URL_QUERY|parse_str:$formUrlParameters}
	<form class="topBarSearch pkp_search {$className|escape}" action="{$smarty.capture.searchFormUrl|strtok:"?"|escape}" method="get" role="search" aria-label="{translate|escape key="submission.search"}">
		{csrf}
		{foreach from=$formUrlParameters key=paramKey item=paramValue}
			<input type="hidden" name="{$paramKey|escape}" value="{$paramValue|escape}" />
		{/foreach}
		{block name=searchQuerySimple}
			<input name="query" value="{$searchQuery|escape}" type="text" aria-label="{translate|escape key="common.searchQuery"}"  placeholder="{translate key="general.search.this.journal"}">
		{/block}
		<input type="image" role="button" src="{$baseUrl}/plugins/themes/ojnl/templates/images/Icon-search.png" onclick="this.form.submit()">
	</form>
{/if}
