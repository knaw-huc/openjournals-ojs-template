{**
 * plugins/generic/browseBySection/templates/frontend/pages/section.tpl
 *
 * Copyright (c) 2017 Simon Fraser University
 * Copyright (c) 2017 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Display the reader-facing section page.
 *
 * @uses $section Section
 * @uses $sectionPath string The URL path for this section
 * @uses $sectionDescription string
 * @uses $articles array List of Submission objects
 * @uses $issues array List of Issue objects the $articles are published in
 * @uses $currentlyShowingStart int 20 in `20-30 of 100 results`
 * @uses $currentlyShowingEnd int 30 in `20-30 of 100 results`
 * @uses $countMax int 100 in `20-30 of 100 results`
 * @uses $currentlyShowingPage int 2 in `2 of 10 pages`
 * @uses $countMaxPage int 10 in `2 of 10 pages`.
 *}


 {include file="frontend/components/htmlHeader.tpl"}
 {include file="frontend/components/header.tpl"}



{**  breadcrumb  *}
 <div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">
   <a href="{$baseUrl}">Openjournals.nl</a>
   <span class="slash">/</span>
   <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$currentJournal->getLocalizedName()}</a>
   <span class="slash">/</span>
   Latest articles
 </div>





 <div class="ojLayout3col-basic hcMarginTop3">
   {**  Col 1  *}
   <div class="hcBasicSideMargin ojCoverAside hcMarginBottom2"> </div>


   {**  Col 2  *}
   <div class="hcBasicSideMargin ojBasicWidth">
		 <h1 class="page_title">
	 		{$section->getLocalizedTitle()|escape}
	 	</h1>

	 	<div class="section_description">
	 		{$sectionDescription|strip_unsafe_html}
	 	</div>

	 	{if $articles|@count}


	 		<div class="search_results ojList ojListArticles hcMarginTop1">
	 			{foreach from=$articles item=article}

	 					{include file="frontend/objects/article_summary.tpl" section=null showDatePublished=true hideGalleys=true}

	 			{/foreach}
	 		</div>

	 		{* Pagination *}
	 		{if $prevPage > 1}
	 			{capture assign="prevUrl"}{url|escape router=$smarty.const.ROUTE_PAGE page="section" op="view" path=$sectionPath|to_array:$prevPage}{/capture}
	 		{elseif $prevPage === 1}
	 			{capture assign="prevUrl"}{url|escape router=$smarty.const.ROUTE_PAGE page="section" op="view" path=$sectionPath}{/capture}
	 		{/if}
	 		{if $nextPage}
	 			{capture assign="nextUrl"}{url|escape router=$smarty.const.ROUTE_PAGE page="section" op="view" path=$sectionPath|to_array:$nextPage}{/capture}
	 		{/if}
	 		{include
	 			file="frontend/components/pagination.tpl"
	 			prevUrl=$prevUrl
	 			nextUrl=$nextUrl
	 			showingStart=$showingStart
	 			showingEnd=$showingEnd
	 			total=$total
	 		}

	 	{else}
	 		<p class="section_empty">
	 			{translate key="plugins.generic.browseBySection.emptySection"}
	 		</p>
	 	{/if}
	</div>


	{**  Col 3  *}
	<div class="hcBasicSideMargin"> </div>
</div>

</div>


{**  powered by  *}
{include file="frontend/components/htmlFooter.tpl"}
{**  footer  *}
{include file="frontend/components/poweredBy.tpl"}
