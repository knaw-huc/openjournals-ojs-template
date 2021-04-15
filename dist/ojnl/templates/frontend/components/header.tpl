{**
 * templates/frontend/components/header.tpl
 *
 * Copyright (c) 2020 Bas Doppen- KNAW-HuC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
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



 <div class="topBar hcBasicSideMargin {if $activeTheme->getOption('headerTextColor') == 'black'} topbarInvert{/if}" style="background-color:{$activeTheme->getOption('baseColour')}; {*background-image: url({$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}*})">

   <div id="journalBranding" class="journalBranding"><a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$journalLogo}</a></div>

   <nav id="journalNav" class="journalNav dropdown"> {load_menu name="primary"}</nav>

   <div id="ojsFuction" class="ojsFuction">

       {include file="frontend/components/searchForm_simple.tpl"}

     <div class="userNav dropdown">

       {load_menu name="user"}
     </div>
     <div class="jsCaps ojLangs">
       {include file="frontend/components/languageSwitcher.tpl"}
     </div>
   </div>

 </div>
