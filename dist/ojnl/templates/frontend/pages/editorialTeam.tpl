{**
 * templates/frontend/pages/editorialTeam.tpl
 *
 * Copyright (c) 2020 Bas Doppen- KNAW-HuC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the editorial team.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}
 {include file="frontend/components/htmlHeader.tpl"}
 {include file="frontend/components/header.tpl"}

 {**  breadcrumb  *}
 <div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">
   <a href="{$baseUrl}">Openjournals.nl</a>
   <span class="slash">/</span>
   <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$currentJournal->getLocalizedName()}</a>
   <span class="slash">/</span>
   Editorial team
 </div>





 <div class="ojLayout3col-basic hcMarginTop3">
    {**  col 1 *}
   <div class="hcBasicSideMargin ojCoverAside hcMarginBottom2"></div>


   {**  col 2 *}
   <div class="hcBasicSideMargin">
		 <h1 class="hcMarginBottom1">{translate key="editorialpage.title"}</h1>
		 {$currentContext->getLocalizedSetting('editorialTeam')}
	</div>

	{**  col 3 *}
	<div class="hcBasicSideMargin"> </div>
</div>






{**  powered by  *}
{include file="frontend/components/htmlFooter.tpl"}
{**  footer  *}
{include file="frontend/components/poweredBy.tpl"}
