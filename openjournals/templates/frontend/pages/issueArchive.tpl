{**
 * templates/frontend/pages/issueArchive.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
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
 <html lang="en" dir="ltr">

 <head>
   <meta charset="utf-8">
   <title>
     {$displayPageHeaderTitle} - {$siteTitle}
   </title>
   <meta name="viewport" content="width=device-width, initial-scale=1">
   {load_stylesheet context="frontend" stylesheets=$stylesheets}
 </head>

 <body>

 *{$issues}*

 {include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

{include file="frontend/components/header.tpl" pageTitleTranslated=$pageTitle}

<main class="page page_issue_archive">
	<div class="container-fluid container-page">

		{include file="frontend/components/headings.tpl" currentTitle=$pageTitle}

		{* No issues have been published *}
		{if empty($issues)}
			<div class="no_issues">
				<p>{translate key="current.noCurrentIssueDesc"}</p>
			</div>

		{* List issues *}
		{else}
			<div class="flex_container issues_list">
				{foreach from=$issues item=issue}
					<div class="issue_item">
						{include file="frontend/objects/issue_summary.tpl"}
					</div>
				{/foreach}
			</div>


	</div> <!-- end of a container -->
</main>

</body>
</html>
