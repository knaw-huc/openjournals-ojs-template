{**
 * templates/frontend/pages/article.tpl
 *
 * Copyright (c) 2020 Bas Doppen- KNAW-HuC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view an article with all of it's details.
 *
 * @uses $article Article This article
 * @uses $issue Issue The issue this article is assigned to
 * @uses $section Section The journal section this article is assigned to
 * @uses $journal Journal The journal currently being viewed.
 * @uses $primaryGalleys array List of article galleys that are not supplementary or dependent
 * @uses $supplementaryGalleys array List of article galleys that are supplementary
 *}

 {include file="frontend/components/htmlHeader.tpl"}
 {include file="frontend/components/header.tpl"}

 {**  breadcrumb  *}
 <div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">
   <a href="{$baseUrl}">Openjournals.nl</a>
   <span class="slash">/</span>
   <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$currentJournal->getLocalizedName()}</a>
   <span class="slash">/</span>
  <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}/issue/view/{$issue->getBestIssueId()}">Volume {$issue->getVolume()} - {$issue->getNumber()} - {$issue->getYear()}</a>
</div>



<div class="ojLayout3col-2Top hcMarginTop3">


  {**  col1  *}
  <div class="hcBasicSideMargin">
    <div class="textBgContainer">
      <main class="wrapperText textLong textBg">
        <div class="textTools"><button type="button" name="button" onclick="decreaseTextSize();">a</button><button type="button" name="button" onclick="increaseTextSize();">A</button></div>

        <h1 class="sizeH1">{$publication->getLocalizedFullTitle()|escape}</h1>
        <div class="textNormal hcMarginTop3 hcMarginBottom3 sizeContentNormal">

						{foreach from=$publication->getData('authors') item=author key=authorNumber}
						<strong>{$author->getFullName()|escape}</strong> |
						{/foreach}

					 {$publication->getData('datePublished')}
				 </div>

        <h2 class="sizeH2">Abstract</h2>
        <div  class="sizeContent">
          {$publication->getLocalizedData('abstract')|strip_unsafe_html}
        </div>
        <div class="sizeContent">

        </div>


      </main>
    </div>
  </div>



  {**  col2  *}
  <div class="hcBasicSideMargin columnContent  hcMarginBottom1">
    <div class="ojFaderBlock"></div>
    <strong>Article content</strong>

    <a href="">Abstract</a>


  </div>



  {**  col3  *}
  <div class="hcBasicSideMargin hcMarginBottom1">
    <div class="ojFaderBlock"></div>
    <div class="columnContent hcMarginBottom2">
      <strong>Issue</strong>
      <span>{$issue->getIssueIdentification()}</span>
    </div>

    <div class="columnContent hcMarginBottom2">
      <strong>Section</strong>
      <span>{$section->getLocalizedTitle()|escape}</span>
    </div>

    <div class="columnContent hcMarginBottom2">
      <strong>How to cite </strong>

      {include file="frontend/objects/article_citation.tpl"}


  </div>

    <div class="columnContent hcMarginBottom2">

      {if !$hideGalleys}
      <strong>Download</strong>
        <div class="galleys_links">
          {foreach from=$article->getGalleys() item=galley}
            {if $primaryGenreIds}
              {assign var="file" value=$galley->getFile()}
              {if !$galley->getRemoteUrl() && !($file && in_array($file->getGenreId(), $primaryGenreIds))}
                {continue}
              {/if}
            {/if}
            {assign var="hasArticleAccess" value=$hasAccess}
            {if $currentContext->getSetting('publishingMode') == $smarty.const.PUBLISHING_MODE_OPEN || $article->getCurrentPublication()->getData('accessStatus') == $smarty.const.ARTICLE_ACCESS_OPEN}
              {assign var="hasArticleAccess" value=1}
            {/if}
            {include file="frontend/objects/galley_link.tpl" parent=$article hasAccess=$hasArticleAccess purchaseFee=$currentJournal->getSetting('purchaseArticleFee') purchaseCurrency=$currentJournal->getSetting('currency')}<br>
          {/foreach}
        </div>
      {/if}
    </div>

    {* <div class="columnContent hcMarginBottom2 smIconsTemp">
      <strong><img src="images/covers/sm-temp.png" alt=""></strong>
    </div> *}
  </div>
</div>




{**  powered by  *}
{include file="frontend/components/htmlFooter.tpl"}
{**  footer  *}
{include file="frontend/components/poweredBy.tpl"}
