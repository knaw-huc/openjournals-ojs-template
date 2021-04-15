{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2020 Bas Doppen- KNAW-HuC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
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
</div>




{**  3coll  *}
<div class="ojLayout3col-basic hcMarginTop3">
  {**  col1  *}
  <div class="hcBasicSideMargin"><div class=" hcMarginBottom1">
    <button type="button" name="button" class="ojSubscriptionButton {if $activeTheme->getOption('headerTextColor') == 'black'} ojSubscriptionButtonInvert{/if}" style="background-color:{$activeTheme->getOption('baseColour')}" onclick="location.href='{$baseUrl}/index.php/{$currentJournal->getPath()}/submission/wizard'">{translate key="indexjournal.start.submission"}</button>
  </div>
{if $activeTheme->getOption('becomeReviewer')}
<div class=" hcMarginBottom1">
  <button type="button" name="button" class="ojSubscriptionButton {if $activeTheme->getOption('headerTextColor') == 'black'} ojSubscriptionButtonInvert{/if}" style="background-color:{$activeTheme->getOption('baseColour')}" onclick="location.href='{$baseUrl}/index.php/{$currentJournal->getPath()}/reviewer'">{translate key="indexjournal.becomeReviewer"}</button>
</div>
{/if}


  {include file="frontend/components/journalSM.tpl"}
</div>


  {**  col 2  *}
  <div class="hcBasicSideMargin">
    <div class="ojBasicWidth">
      <div class="hcMarginBottom3 textLong">
        {**  journal name and intro  *}
        <h1>{$siteTitle}</h1>
        {$currentJournal->getLocalizedDescription()}
      </div>



      {**  latest issue  *}
      {include file="frontend/components/journal-blockLatestIssue.tpl"}


      {**  announcements  *}
      {if $announcements}
          <h2 class="hcMarginTop3">{translate key="announcement.announcements"}</h2>
            {foreach from=$announcements item=announcement}
              <article class="ojAnnounTeaser hcMarginBottom2">

                  <a href="{url router=$smarty.const.ROUTE_PAGE page="announcement" op="view" path=$announcement->getId()|escape}">
                    <strong>{$announcement->getLocalizedTitle()|escape}</strong>

                  </a><div class="textSmall"><em>{$announcement->getDatePosted()|date_format:$dateFormatShort}</em></div>
                  {$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}

              </article>
            {/foreach}
      {/if}



      {**  Editorial board
      <h2 class="hcMarginTop3">Editorial board</h2>
      {$currentContext->getLocalizedSetting('editorialTeam')}
      *}

    </div>
  </div>


  {**  Col 3  *}
  <div class="hcBasicSideMargin hcMarginBottom3">

    {* <button type="button" name="button" class="hcMarginTop2" onclick="location.href='{$currentJournal->getPath()}/issue/archive'">See the complete archive</button> *}
    <div class="hcMarginTop3">
      {**  side bar  *}
      {if empty($isFullWidth)}
        {capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
        {if $sidebarCode}
          <div class="pkp_structure_sidebar left" role="complementary" aria-label="{translate|escape key="common.navigation.sidebar"}">
            {$sidebarCode}
          </div><!-- pkp_sidebar.left -->
        {/if}
      {/if}
    </div>

  </div>
</div>




{**  powered by  *}
{include file="frontend/components/poweredBy.tpl"}
{**  footer  *}
{include file="frontend/components/htmlFooter.tpl"}
