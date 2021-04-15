{**  latest issue  *}
{**  onclick="location.href='{$baseUrl}/index.php/{$currentJournal->getPath()}/issue/view/{$issue->getBestIssueId()}'"  *}
{if $issue}
<div class="hcMarginBottom3 bgExtent ojCursor" onclick="location.href='{$baseUrl}/index.php/{$currentJournal->getPath()}/issue/view/{$issue->getBestIssueId()}'">
  <div class="col2">
    <div class="issueCoverBig">
      {if $issue->getLocalizedCoverImageUrl()}
      <img src="{$issue->getLocalizedCoverImageUrl()}" alt="">
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
    <div>
      <strong>{translate key="general.latest.issue"}</strong><br>
      {if $issue->getLocalizedTitle()}<h2>{$issue->getLocalizedTitle()}</h2>{/if}
      {if $issue->getVolume()}{translate key="general.volume"}: <strong>{$issue->getVolume()}</strong><br>{/if}
      {if $issue->getNumber()}{translate key="general.issue"}: <strong>{$issue->getNumber()}</strong> <br>{/if}
      {if $issue->getYear()}{translate key="general.year"}: <strong>{$issue->getYear()}</strong><br>{/if} <br>

      <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}/issue/view/{$issue->getBestIssueId()}">{translate key="general.view.issue"}</a>
    </div>

  </div>
</div>
{else}

{/if}
