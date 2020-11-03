{**
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Site-wide header; includes journal logo, user menu, and primary menu
 *
 *}







 {capture assign="journalLogo"}
 	{if $displayPageHeaderLogo && is_array($displayPageHeaderLogo)}
 		<img class="journal-logo" src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}"
 		     {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"
 		     {else}alt="{translate key="common.pageHeaderLogo.altText"}"{/if}>
 	{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_string($displayPageHeaderTitle)}
 		<div class="journal-logo-text">{$displayPageHeaderTitle|escape}</div>
 	{elseif $displayPageHeaderTitle && !$displayPageHeaderLogo && is_array($displayPageHeaderTitle)}
 		<img class="journal-logo" src="{$publicFilesDir}/{$displayPageHeaderTitle.uploadName|escape:"url"}"
 		     alt="{$displayPageHeaderTitle.altText|escape}">
 	{else}
 		<img class="journal-logo" src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}">
 	{/if}
 {/capture}






 <div class="topBar hcBasicSideMargin" style="background-color:{$activeTheme->getOption('baseColour')}">

     <div id="journalBranding" class="journalBranding"><a href="-journal-landing.html">{$journalLogo}</a>
     </div>


     {* <nav id="journalNav" class="journalNav">

       <a href="-journal-landing.html">Home</a>
       <a href="">About</a>
       <a href="">Contact</a>
       <a href="">Content</a>
       <a href="">Research&nbsp;Integrity</a>
     </nav> *}
     <nav id="journalNav" class="journalNav">
       {load_menu name="primary"}
     </nav>



   <div id="ojsFuction" class="ojsFuction">
     <div class="topBarSearch">
       <input type="text"  placeholder="Search this journal"> <input type="image" role="button" src="images/Icon-search.png">
     </div>
     <div class="">



       Login | Register
     </div>
     <div class="">
       NL | ENG
       {include file="frontend/components/languageSwitcher.tpl" id="languageNav"}
     </div>
   </div>

 </div>
