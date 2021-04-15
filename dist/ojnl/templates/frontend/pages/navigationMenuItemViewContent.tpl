{**
 * frontend/pages/navigationMenuItemViewContent.tpl
 *
 * Copyright (c) 2020 Bas Doppen- KNAW-HuC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Display NavigationMenuItem content
 *}


 {include file="frontend/components/htmlHeader.tpl"}

 {if !$currentJournal}
 {include file="frontend/components/headerHome.tpl"}

 {else}
  {include file="frontend/components/header.tpl"}
  {**  breadcrumb  *}
  <div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">
    <a href="{$baseUrl}">Openjournals.nl</a>
    <span class="slash">/</span>
    <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$currentJournal->getLocalizedName()}</a>
  </div>
 {/if}





<div class="ojLayout3col-basic hcMarginTop3">
 {**  Col 1  *}
 <div class="hcBasicSideMargin ojCoverAside hcMarginBottom2"></div>


 {**  Col 2  *}
 <main class="hcBasicSideMargin ojBasicWidth">
   <h1 class="hcMarginBottom2">{$title|escape}</h1>
    {$content}
</main>


	{**  Col 3  *}
	<div class="hcBasicSideMargin"></div>
	</div>



{**  powered by  *}
{include file="frontend/components/poweredBy.tpl"}
{**  footer  *}
{include file="frontend/components/htmlFooter.tpl"}
