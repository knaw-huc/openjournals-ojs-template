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

   <a class="cover" href="{$baseUrl}/index.php/{$currentJournal->getPath()}/issue/view/{$issue->getBestIssueId()}">
   {if $issue->getLocalizedTitle()}{$issue->getLocalizedTitle()}
   {else}
   {if $issue->getVolume()}{translate key="general.volume"} {$issue->getVolume()}{/if}
   {if $issue->getNumber()} - {$issue->getNumber()}{/if}
   {if $issue->getYear()} - {$issue->getYear()}{/if}
   {/if}
  </a>
   <span class="slash">/</span>
   Article
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
            {if $author->getOrcid()}
              <a class="orcid-image-url" href="{$author->getOrcid()}" >
                <strong>
                  <span class="orchid">{$author->getFullName()|escape}
                    <img src="{$baseUrl}/plugins/themes/ojnl/templates/images/orcid.png">
                  </span>
                </strong>
              </a>

            {else}
              <strong>{$author->getFullName()|escape}</strong>
            {/if}
            {if $author->getLocalizedData('email')}
						<span class="ojMail"><a href="mailto:{$author->getLocalizedData('email')|escape}"><img src="{$baseUrl}/plugins/themes/ojnl/templates/images//icon-mail.png" alt=""></a></span>
						{/if}|
						{/foreach}


				 </div>

        <h2 class="sizeH2">{translate key="general.abstract"}</h2>
        <div  class="sizeContent">
          {$publication->getLocalizedData('abstract')|strip_unsafe_html}
        </div>



        {call_hook name="Templates::Article::Main"}








      </main>
      <div class="ojBasicWidth hcMarginTop3">
        {**  Author  *}
        {include file="frontend/objects/article_author.tpl"}
      </div>



    </div>
  </div>



  {**  col2  *}
  <div class="hcBasicSideMargin columnContent  hcMarginBottom1">
    <div class="ojFaderBlock"></div>




  </div>



  {**  col3  *}
  <div class="hcBasicSideMargin hcMarginBottom1">
    <div class="ojFaderBlock"></div>


    {**  published  *}
    <div class="columnContent hcMarginBottom2">
      <strong>{translate key="general.datePublished"}</strong>
      {$publication->getData('datePublished')}
    </div>


    {**  Issue  *}
    <div class="columnContent hcMarginBottom2">
      <strong>{translate key="general.issueFull"}</strong>
      <span>{$issue->getIssueIdentification()}</span>
    </div>


    {**  Section  *}
    <div class="columnContent hcMarginBottom2">
      <strong>{translate key="general.section"}</strong>
      <span>{$section->getLocalizedTitle()|escape}</span>
    </div>


    {**  download  *}
    <div class="columnContent hcMarginBottom2">
      {if !$hideGalleys}
      <strong>{translate key="general.download"}</strong>
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







    {**  cite  *}
    <div class="columnContent hcMarginBottom2">
      <strong>{translate key="general.how.cite"}</strong>
      {include file="frontend/objects/article_citation.tpl"}
    </div>




    {**  Keywords  *}
      {if !empty($keywords[$currentLocale])}
      <div class="columnContent hcMarginBottom2">
        <strong>{translate key="general.keywords"}</strong>

          {foreach from=$keywords item=keywordArray}
            {foreach from=$keywordArray item=keyword key=k}

                {$keyword|escape}</span>{if $k+1 < $keywordArray|@count},{/if}

            {/foreach}
          {/foreach}
        </ul>
      </div>
      {/if}







      {* Licensing info *}
      {if $copyright || $licenseUrl}
      <strong>{translate key="general.licensing"}</strong>

        <div class="columnContent hcMarginBottom2">
          {if $licenseUrl}
            {if $ccLicenseBadge}
              {if $copyrightHolder}
                <p>{translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder|escape copyrightYear=$copyrightYear|escape}</p>
              {/if}
              {$ccLicenseBadge}
            {else}
              <a href="{$licenseUrl|escape}" class="copyright">
                {if $copyrightHolder}
                  {translate key="submission.copyrightStatement" copyrightHolder=$copyrightHolder|escape copyrightYear=$copyrightYear|escape}
                {else}
                  {translate key="submission.license"}
                {/if}
              </a>
            {/if}
          {/if}
          {* Copyright modal. Show only if license is absent *}
          {if $copyright && !$licenseUrl}
            <a class="more_button" data-toggle="modal" data-target="#copyrightModal">
              {translate key="about.copyrightNotice"}
            </a>
            <div class="modal fade" id="copyrightModal" tabindex="-1" role="dialog" aria-labelledby="copyrightModalTitle" aria-hidden="true">
              <div class="modal-dialog" role="document">
                <div class="modal-content">
                  <div class="modal-header">
                    <h5 class="modal-title" id="copyrightModalTitle">{translate key="about.copyrightNotice"}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                  </div>
                  <div class="modal-body">
                    {$copyright|strip_unsafe_html}
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">{translate key="plugins.themes.classic.close"}</button>
                  </div>
                </div>
              </div>
            </div>
          {/if}
        </div>
      {/if}



















    {* <div class="columnContent hcMarginBottom2 smIconsTemp">
      <strong><img src="images/covers/sm-temp.png" alt=""></strong>
    </div> *}
  </div>
</div>




{**  powered by  *}
{include file="frontend/components/htmlFooter.tpl"}
{**  footer  *}
{include file="frontend/components/poweredBy.tpl"}
