{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2020 Bas Doppen- KNAW-HuC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a list of recent issues.
 *
 * @uses $issues Array Collection of issues to display
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published monographs
 *}


 {include file="frontend/components/htmlHeader.tpl"}
 {include file="frontend/components/header.tpl"}

 {**  breadcrumb  *}
 <div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">
   <a href="{$baseUrl}">Openjournals.nl</a>
   <span class="slash">/</span>
   <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$currentJournal->getLocalizedName()}</a>
   <span class="slash">/</span>
   Archive
 </div>




 <div class="ojLayout3col-basic hcMarginTop3">
   {**  col1  *}
   <div class="hcBasicSideMargin hcMarginBottom2"></div>


   {**  col2 *}
   <div class="hcBasicSideMargin">
     <h1 class="hcMarginBottom2">{translate key="archivepage.title"}</h1>
     <div class="cardsIssue">




 		{* No issues have been published *}
 		{if empty($issues)}

 		<p>{translate key="current.noCurrentIssueDesc"}</p>


 		{* List issues *}
 		{else}
 			{foreach from=$issues item="issue"}

      {if $issue->getShowTitle()}
      {assign var=issueTitle value=$issue->getLocalizedTitle()}
      {/if}
      {assign var=issueSeries value=$issue->getIssueSeries()}
      {assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}



          <a class="cover" href="{url op="view" path=$issue->getBestIssueId()}">



          <article class="col2">
            <div class="cardImageWrapper">
              {if $issueCover}<img src="{$issueCover|escape}"{if $issue->getLocalizedCoverImageAltText() != ''} alt="{$issue->getLocalizedCoverImageAltText()|escape}"{/if}>
              {else}
                {if $activeTheme->getOption('customThumbnail')}
                  <img src="{$baseUrl}/plugins/themes/ojnl/templates/images/thumbnails/{$currentJournal->getLocalizedData('abbreviation')|escape|lower}-issue.png">
                {else}
                  <div class="ojnNoCoverDiv">
                    <img src="{$baseUrl}/plugins/themes/ojnl/templates/images/ojnllogo.png" alt="logo">
                  </div>
                {/if}
              {/if}
            </div>

            <div class="infoCol">
              {if $issue->getLocalizedTitle()}<strong>{$issue->getLocalizedTitle()}</strong><br>{/if}
              {if $issue->getVolume()}Volume: <strong>{$issue->getVolume()}</strong><br>{/if}
              {if $issue->getNumber()}Issue: <strong>{$issue->getNumber()}</strong> <br>{/if}
              {if $issue->getYear()}Year: <strong>{$issue->getYear()}</strong><br>{/if}
            </div>
          </article>
          </a>


 			{/foreach}
      </div>

 			{* Pagination *}
 			<div class="issue__pagination col-12">
 				{if $prevPage > 1}
 					{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$prevPage}{/capture}
 				{elseif $prevPage === 1}
 					{capture assign=prevUrl}{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive"}{/capture}
 				{/if}
 				{if $nextPage}
 					{capture assign=nextUrl}{url router=$smarty.const.ROUTE_PAGE page="issue" op="archive" path=$nextPage}{/capture}
 				{/if}
 				{include
 					file="frontend/components/pagination.tpl"
 					prevUrl=$prevUrl
 					nextUrl=$nextUrl
 					showingStart=$showingStart
 					showingEnd=$showingEnd
 					total=$total
 				}
 			</div>
 		{/if}






  </div>


  {**  col3  *}
  <div class="hcBasicSideMargin"></div>
  </div>




  {**  powered by  *}
  {include file="frontend/components/poweredBy.tpl"}
  {**  footer  *}
  {include file="frontend/components/htmlFooter.tpl"}
