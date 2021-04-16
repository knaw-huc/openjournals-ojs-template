{**
 * templates/frontend/pages/issue.tpl
 *
 * Copyright (c) 2020 Bas Doppen- KNAW-HuC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display a landing page for a single issue. It will show the table of contents
 *  (toc) or a cover image, with a click through to the toc.
 *
 * @uses $issue Issue The issue
 * @uses $issueIdentification string Label for this issue, consisting of one or
 *       more of the volume, number, year and title, depending on settings
 * @uses $issueIdentificationString string custom label for the issue, developed for the Traditional theme
 * @uses $issueGalleys array Galleys for the entire issue
 * @uses $primaryGenreIds array List of file genre IDs for primary types
 *}


 {include file="frontend/components/htmlHeader.tpl"}
 {include file="frontend/components/header.tpl"}

 {**  breadcrumb  *}
 <div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">
   <a href="{$baseUrl}">Openjournals.nl</a>
   <span class="slash">/</span>
   <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$currentJournal->getLocalizedName()}</a>
   <span class="slash">/</span>
   Volume {$issue->getVolume()} - {$issue->getNumber()} - {$issue->getYear()}
</div>




<div class="ojLayout3col-basic hcMarginTop3">
  {**  col1  *}
  <div class="hcBasicSideMargin ojCoverAside hcMarginBottom2">
    {assign var=issueCover value=$issue->getLocalizedCoverImageUrl()}
		{if $issueCover} <img class="cover_image" src="{$issueCover|escape}" {if $issue->getLocalizedCoverImageAltText() != ''}alt="{$issue->getLocalizedCoverImageAltText()|escape}"{else}alt=""{/if}> {/if}
  </div>




  {**  col2   *}
  <div class="hcBasicSideMargin">
    <div class="ojBasicWidth">
      <h1 class="hcMarginBottom1">Volume {$issue->getVolume()} - {$issue->getNumber()} - {$issue->getYear()}</h1>
      {assign var=issueDescription value=$issue->getLocalizedDescription()|strip_unsafe_html}
      {$issueDescription}
      <div class="ojList ojListArticles hcMarginTop1">


        {foreach name=sections from=$publishedSubmissions item=section}

        		{if $section.articles}
        			{if $section.title}
        				<div class="hcMarginBottom1"><em>{$section.title|escape}</em><span></span></div>
        			{/if}
        				{foreach from=$section.articles item=article}
        					{include file="frontend/objects/article_summary.tpl" headingLevel="5"}
        				{/foreach}
        		{/if}
        {/foreach}

      </div>
    </div>
  </div>


  {**  col3  *}
  <div class="hcBasicSideMargin"></div>
</div>



{**  powered by  *}
{include file="frontend/components/poweredBy.tpl"}
{**  footer  *}
{include file="frontend/components/htmlFooter.tpl"}
