{**
 * templates/frontend/objects/article_summary.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief View of an Article summary which is shown within a list of articles.
 *
 * @uses $article Article The article
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showDatePublished bool Show the date this article was published?
 * @uses $hideGalleys bool Hide the article galleys for this article?
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 * @uses $article Article The article
 * @uses $hasAccess bool Can this user access galleys for this context? The
 *       context may be an issue or an article
 * @uses $showDatePublished bool Show the date this article was published?
 * @uses $hideGalleys bool Hide the article galleys for this article?
 * @uses $primaryGenreIds array List of file genre ids for primary file types
 * @uses $heading string HTML heading element, default: h2
 * @uses $primaryGalleys array List of article galleys that are not supplementary or dependent
 * @uses $supplementaryGalleys array List of article galleys that are supplementary


 *}
 {assign var=articlePath value=$article->getBestId()}

 {if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
 	{assign var="showAuthor" value=true}
 {/if}







 <article class="hcMarginBottom2">
	 <div>


   {if $article->getLocalizedData('coverImage')}
      <img src="{$article->getLocalizedCoverImageUrl()}" alt="">
   {else}
      {if $activeTheme->getOption('customThumbnail')}
        <img src="{$baseUrl}/plugins/themes/ojnl/templates/images/thumbnails/{$currentJournal->getLocalizedData('abbreviation')|escape|lower}-{$article->_data.publications[0]->_data.sectionId}.png">
      {else}
          <img src="{$baseUrl}/plugins/themes/ojnl/templates/images/noThumb.png">
      {/if}



   {/if}
  </div>
	 <div class="textSmall">{if $article->getPages()}{if $article->getPages()} {$article->getPages()|escape} {/if}{/if}</div>
	 <div>


		 <a class="summary_title" {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if}>
			<strong> {$article->getLocalizedFullTitle()|escape}</strong>
    </a>

		 {if $showAuthor}
		 <div>
			 {$article->getAuthorString()|escape}
		 </div>
		 {/if}

		 <div>
       {* <button type="button" name="button">pdf</button> *}


       {if !$hideGalleys}
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
             {include file="frontend/objects/galley_link.tpl" parent=$article hasAccess=$hasArticleAccess purchaseFee=$currentJournal->getSetting('purchaseArticleFee') purchaseCurrency=$currentJournal->getSetting('currency')}
           {/foreach}
         </div>
       {/if}





     </div>
	 </div>

<div class="textSmall">

	 		{$article->getDatePublished()}
	 </div>
 </article>
