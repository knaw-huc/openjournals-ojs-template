{**
 * templates/frontend/pages/indexJournal.tpl
 *
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 * @uses $issueIdentificationString string issue identification that relies on user's settings
 * @uses $issues Array Collection of issues to display
 * @uses $prevPage int The previous page number
 * @uses $nextPage int The next page number
 * @uses $showingStart int The number of the first item on this page
 * @uses $showingEnd int The number of the last item on this page
 * @uses $total int Count of all published monographs
 *}


 <!DOCTYPE html>
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



{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">

  <a href="index.html">Openjournals.nl</a>

  <span class="slash">/</span>
  <a href="-journal-landing.html">BMGN</a>


</div>

<div class="ojLayout3col-basic hcMarginTop3">
  <!-- col 1 -->
  <div class="hcBasicSideMargin"><div class=" hcMarginBottom1">
  <button type="button" name="button" class="ojSubscriptionButton" style="background-color:{$activeTheme->getOption('baseColour')}">Start submission</button>
</div>
<div>
<a href=""><img src="images/icon-twitter.svg" alt="twitter icon" class="ojIcon">Follow on Twitter</a><br>
<a href=""><img src="images/icon-facebook.svg" alt="Facebook icon" class="ojIcon">Like on Facebook</a><br>
<a href=""><img src="images/icon-rss.svg" alt="RSS icon" class="ojIcon">Follow Via RSS</a><br>
<a href=""><img src="images/icon-linkedin.svg" alt="Linkedin icon" class="ojIcon">Follow on Linkedin</a>
</div>
</div>


  <!-- col 2 -->
  <div class="hcBasicSideMargin">
    <div class="ojBasicWidth"><div class="hcMarginBottom3 textLong">
  <h1>{$siteTitle}</h1>
  {$currentJournal->getLocalizedDescription()}
</div>


<div class="hcMarginBottom3 bgExtent"  onclick="location.href='issue/view/{$issue->getBestIssueId()}'">
  <div class="col2">

    <div class="issueCoverBig">
      <img src="{$issue->getLocalizedCoverImageUrl()}" alt="">
    </div>

    <div>
      <h3>Latest issue</h3>
      <h2>{$currentJournal->getLocalizedPageHeaderTitle()}</h2>

      Volume: <strong>{$issue->getVolume()}</strong> <br>
      Issue: <strong>{$issue->getNumber()}</strong> <br>
      Year:<strong>{$issue->getYear()}</strong><br>
    </div>

  </div>


</div>


{if $announcements}
    <h2 class="hcMarginTop3">{translate key="announcement.announcements"}</h2>
      {foreach from=$announcements item=announcement}
        <article class="ojAnnounTeaser hcMarginBottom2">

            <a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()|escape}">
              <strong>{$announcement->getLocalizedTitle()|escape}</strong>
            </a>
        </article>
      {/foreach}
{/if}




<h2 class="hcMarginTop3">Editorial board</h2>
{$currentContext->getLocalizedSetting('editorialTeam')}

</div>
  </div>


  <!-- col 1 -->
  <div class="hcBasicSideMargin hcMarginBottom3">
    <h2>Archive</h2>





		{* List issues *}

			<div class="flex_container issues_list">
				{foreach from=$issues item=issue}
					<div class="issue_item">
						{$issue->getVolume()}
					</div>
				{/foreach}


    <div class="archiveList">
      <a href="#">-----------</a>
    </div>






    <div class="archiveList">
      <a href="#">Volume 135 - Issue 2 - 2020</a>
    </div>
    <div class="archiveList">
      <a href="#">Volume 135 - Issue 1 - 2020</a>
    </div>
    <div class="archiveList">
      <a href="#">Book Reviews - Volume 135 - 2020</a>
    </div>
    <div class="archiveList">
      <a href="#">Volume 134 - Issue 4 - 2019</a>
    </div>
    <div class="archiveList">
      <a href="#">Volume 134 - Issue 3 - 2019</a>
    </div>
    <div class="archiveList">
      <a href="#">Volume 134 - Issue 2 - 2019</a>
    </div>
    <div class="archiveList">
      <a href="#">Volume 134 - Issue 1 - 2019</a>
    </div>
    <div class="archiveList">
      <a href="#">Book Reviews - Volume 134 - 2019</a>
    </div>
    <div class="archiveList">
      <a href="#">Volume 133 - Issue 4 - 2018</a>
    </div>
    <button type="button" name="button" class="hcMarginTop2">See the complete archive</button>
    <div class="twitterFeed hcMarginTop3">Twitterfeed</div>

  </div>
</div>




<div class="openjournalsInfo" onclick="location.href='index.html'">
  <div>This journal is powered by &nbsp;</div>
  <div><img src="images/logo-ojnl.png" alt="Openjournals.nl"></div>
</div>




<footer></footer>
</body>
</html>
