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
 *}
 {assign var=articlePath value=$article->getBestId()}

 {if (!$section.hideAuthor && $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_DEFAULT) || $article->getHideAuthor() == $smarty.const.AUTHOR_TOC_SHOW}
 	{assign var="showAuthor" value=true}
 {/if}




 <article class="hcMarginBottom2"  onclick="location.href='--journal-article.html'">
	 <div><img src="images/covers/10823.jpg" alt=""></div>
	 <div class="textSmall">{if $article->getPages()} {$article->getPages()|escape} {/if}</div>
	 <div>


		 <a class="summary_title" {if $journal}href="{url journal=$journal->getPath() page="article" op="view" path=$articlePath}"{else}href="{url page="article" op="view" path=$articlePath}"{/if}>
			<strong> {$article->getLocalizedFullTitle()|escape}</strong>
		 </a>

		 {if $showAuthor}
		 <div>
			 {$article->getAuthorString()|escape}
		 </div>
		 {/if}

		 <div><button type="button" name="button">pdf</button></div>
	 </div>

<div class="textSmall">
	 {if $showDatePublished && $article->getDatePublished()}
	 		{$article->getDatePublished()|date_format:$dateFormatShort}
	 {/if}</div>
 </article>
