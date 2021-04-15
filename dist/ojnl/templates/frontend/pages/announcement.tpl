{**
 * templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2020 Bas Doppen- KNAW-HuC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page which represents a single announcement
 *
 * @uses $announcement Announcement The announcement to display
 *}


 {include file="frontend/components/htmlHeader.tpl"}
 {include file="frontend/components/header.tpl"}



{**  breadcrumb  *}
 <div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">
   <a href="{$baseUrl}">Openjournals.nl</a>
   <span class="slash">/</span>
   <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$currentJournal->getLocalizedName()}</a>
   <span class="slash">/</span>
   <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}/announcement">Announcements</a>
   <span class="slash">/</span>
 </div>





 <div class="ojLayout3col-basic hcMarginTop3">
   {**  Col 1  *}
   <div class="hcBasicSideMargin ojCoverAside hcMarginBottom2"> </div>


   {**  Col 2  *}
   <div class="hcBasicSideMargin ojBasicWidth">
		{* Display book details *}
		{include file="frontend/objects/announcement_full.tpl"}
	</div>


	{**  Col 3  *}
	<div class="hcBasicSideMargin"> </div>
</div>

</div>


{**  powered by  *}
{include file="frontend/components/htmlFooter.tpl"}
{**  footer  *}
{include file="frontend/components/poweredBy.tpl"}
