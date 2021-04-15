{**
 * templates/frontend/pages/announcements.tpl
 *
 * Copyright (c) 2020 Bas Doppen- KNAW-HuC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view the latest announcements
 *
 * @uses $announcements array List of announcements
 *}

 {include file="frontend/components/htmlHeader.tpl"}
 {include file="frontend/components/header.tpl"}



{**  breadcrumb  *}
 <div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">
   <a href="{$baseUrl}">Openjournals.nl</a>
   <span class="slash">/</span>
   <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$currentJournal->getLocalizedName()}</a>
   <span class="slash">/</span>
   Announcement
 </div>




 <div class="ojLayout3col-basic hcMarginTop3">
 	{**  Col 1  *}
 	<div class="hcBasicSideMargin ojCoverAside hcMarginBottom2"></div>


 	{**  Col 2  *}
 	<div class="hcBasicSideMargin">
    <h1>Announcements</h1>
		{foreach from=$announcements item=announcement}
  		{if !$heading}
  			{assign var="heading" value="h2"}
  		{/if}

  		<article >
  			<{$heading} class="announcement-summary-heading">
  				<a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
  					{$announcement->getLocalizedTitle()|escape}
  				</a>
  			</{$heading}>
  			<div class="textSmall">
  				Published on {$announcement->getDatePosted()|date_format:$dateFormatShort}
  			</div>
  			<p>{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}</p>

    		<a class="btn btn-secondary" href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()}">
    				{translate key="common.readMore"}
    		</a>

  		</article><br><br><br>
		{/foreach}
	</div>


	{**  Col 3  *}
	<div class="hcBasicSideMargin"> </div>
	</div>

</div>


  {**  powered by  *}
  {include file="frontend/components/htmlFooter.tpl"}
  {**  footer  *}
  {include file="frontend/components/poweredBy.tpl"}
