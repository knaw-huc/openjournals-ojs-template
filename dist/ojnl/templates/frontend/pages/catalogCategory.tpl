{**
 * templates/frontend/pages/catalogCategory.tpl
 *
 * Copyright (c) 2020 Bas Doppen- KNAW-HuC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a category of the catalog.
 *
 * @uses $category Category Current category being viewed
 * @uses $publishedSubmissions array List of published submissions in this category
 * @uses $parentCategory Category Parent category if one exists
 * @uses $subcategories array List of subcategories if they exist
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published submissions in this category
 *}


 {include file="frontend/components/htmlHeader.tpl"}
 {include file="frontend/components/header.tpl"}


 {**  breadcrumb  *}
  <div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">
    <a href="{$baseUrl}">Openjournals.nl</a>
    <span class="slash">/</span>
    <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$currentJournal->getLocalizedName()}</a>

  </div>




	<div class="ojLayout3col-basic hcMarginTop3">
    {**  Col 1  *}
    <div class="hcBasicSideMargin ojCoverAside hcMarginBottom2">
			{* Image and description *}
			{assign var="image" value=$category->getImage()}
			{assign var="description" value=$category->getLocalizedDescription()|strip_unsafe_html}

				{if $image}

						<img src="{url router=$smarty.const.ROUTE_PAGE page="catalog" op="thumbnail" type="category" id=$category->getId()}" alt="null" />

				{/if} </div>


    {**  Col 2  *}
    <main class="hcBasicSideMargin ojBasicWidth">



		<h1>
			Category: <em>{$category->getLocalizedTitle()|escape}</em>
		</h1>


		{* Count of articles in this category *}

			{translate key="catalog.browseTitles" numTitles=$total}




				{$description|strip_unsafe_html}


		{if !$subcategories->wasEmpty()}
		<nav class="subcategories" role="navigation">
			<h2>
				{translate key="catalog.category.subcategories"}
			</h2>
			<ul>
				{iterate from=subcategories item=subcategory}
					<li>
						<a href="{url op="category" path=$subcategory->getPath()}">
							{$subcategory->getLocalizedTitle()|escape}
						</a>
					</li>
				{/iterate}
			</ul>
		</nav>
		{/if}

		<h2 class="title">
			{translate key="catalog.category.heading"}
		</h2>

		{* No published titles in this category *}
		{if empty($publishedSubmissions)}
			<p><em>{translate key="catalog.category.noItems"}</em></p>
		{else}
		<div class="ojList ojListArticles hcMarginTop1">

				{foreach from=$publishedSubmissions item=article}

						{include file="frontend/objects/article_summary.tpl" article=$article hideGalleys=true}

				{/foreach}
	</div>

			{* Pagination *}
			{if $prevPage > 1}
				{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()|to_array:$prevPage}{/capture}
			{elseif $prevPage === 1}
				{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()}{/capture}
			{/if}
			{if $nextPage}
				{capture assign=nextUrl}{url router=$smarty.const.ROUTE_PAGE page="catalog" op="category" path=$category->getPath()|to_array:$nextPage}{/capture}
			{/if}
			{include
				file="frontend/components/pagination.tpl"
				prevUrl=$prevUrl
				nextUrl=$nextUrl
				showingStart=$showingStart
				showingEnd=$showingEnd
				total=$total
			}
		{/if}
	</main>





		{**  Col 3  *}
		<div class="hcBasicSideMargin"> </div>
	</div>

	</div>


	{**  powered by  *}
	{include file="frontend/components/htmlFooter.tpl"}
	{**  footer  *}
	{include file="frontend/components/poweredBy.tpl"}
