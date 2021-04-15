{**
 * templates/frontend/pages/information.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Information page.
 *
 *}


 {include file="frontend/components/htmlHeader.tpl"}
 {include file="frontend/components/header.tpl"}



{**  breadcrumb  *}
 <div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">
   <a href="{$baseUrl}">Openjournals.nl</a>
   <span class="slash">/</span>
   <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$currentJournal->getLocalizedName()}</a>
   <span class="slash">/</span>
   Information
 </div>





 <div class="ojLayout3col-basic hcMarginTop3">
   {**  Col 1  *}
   <div class="hcBasicSideMargin ojCoverAside hcMarginBottom2"> </div>


   {**  Col 2  *}
   <div class="hcBasicSideMargin ojBasicWidth">
		{$content}
	</div>


	{**  Col 3  *}
	<div class="hcBasicSideMargin"> </div>
</div>

</div>


{**  powered by  *}
{include file="frontend/components/htmlFooter.tpl"}
{**  footer  *}
{include file="frontend/components/poweredBy.tpl"}
