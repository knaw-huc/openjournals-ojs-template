{**  latest issue  *}

<div class="hcMarginBottom3 bgExtent ojCursor"  onclick="location.href='{$baseUrl}/index.php/{$currentJournal->getPath()}/issue/view/{$issue->getBestIssueId()}'">
  <div class="col2">
    <div class="issueCoverBig">
      <img src="{$issue->getLocalizedCoverImageUrl()}" alt="">
    </div>
    <div>
      <strong>Latest issue</strong><br>
      {$currentJournal->getLocalizedPageHeaderTitle()}
      <h2>{$issue->getLocalizedTitle()}</h2>
      Volume: <strong>{$issue->getVolume()}</strong> <br>
      Issue: <strong>{$issue->getNumber()}</strong> <br>
      Year:<strong>{$issue->getYear()}</strong><br><br>

      <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}/issue/view/{$issue->getBestIssueId()}">View this issue</a>
    </div>

  </div>
</div>
