{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2003-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
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
 *}


 <!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Journal landing page</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://{$smarty.server.HTTP_HOST}/{if $smarty.server.HTTP_HOST|strstr:"localhost"}openjournals/{/if}templates/csss/style.css">
</head>

<body>
  ****

<div class="topBar hcBasicSideMargin" style="background-color:#CD362F">

    <div id="journalBranding" class="journalBranding"><a href="-journal-landing.html">
      <img src="images/covers/brand-logo-BMGN.png" alt="BMGN – Low Countries Historical Review"></a>
    </div>


    <nav id="journalNav" class="journalNav">
      
      <a href="-journal-landing.html">Home</a>
      <a href="">About</a>
      <a href="">Contact</a>
      <a href="">Content</a>
      <a href="">Research&nbsp;Integrity</a>
    </nav>

  <div id="ojsFuction" class="ojsFuction">
    <div class="topBarSearch">
      <input type="text"  placeholder="Search this journal"> <input type="image" role="button" src="images/Icon-search.png">
    </div>
    <div class="">
      Login | Register
    </div>
    <div class="">
      NL | ENG
    </div>
  </div>

</div>

<div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">

  <a href="index.html">Openjournals.nl</a>

  <span class="slash">/</span>
  <a href="-journal-landing.html">BMGN</a>


</div>

<div class="ojLayout3col-basic hcMarginTop3">
  <!-- col 1 -->
  <div class="hcBasicSideMargin"><div class=" hcMarginBottom1">
  <button type="button" name="button" class="ojSubscriptionButton" style="background-color:#CD362F">Start submission</button>
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
  <h1>BMGN – Low Countries Historical Review</h1>
  {$currentJournal->getLocalizedDescription()}
</div>


<div class="hcMarginBottom3 bgExtent"  onclick="location.href='--journal-issue.html'">

  <div class="col2">
    <div class="issueCoverBig">
      <img src="images/covers/bmgn-cover-latest.png" alt="">
    </div>

    <div>
      <h3>Latest issue</h3>
      <h2>BMGN – Low Countries Historical Review</h2>
      Volume: <strong>135</strong> <br>
      Issue: <strong>2</strong> <br>
      Year:<strong>2020</strong><br>
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
<div class="list  hcMarginBottom3">

  <div class="hcMarginTop2"><em>Chair</em></div>





  <div class="hcMarginBottom1">
    <strong>Prof. dr. Dirk Jan Wolffram</strong><br>
    University of Groningen
  </div>


  <div class="hcMarginTop2"><em>Editorial Board</em></div>





  <div class="hcMarginBottom1">
    <strong>Prof. dr. Frederik Buylaert</strong><br>
    Ghent University
  </div>





  <div class="hcMarginBottom1">
    <strong>Dr. Alicia Schrikker</strong><br>
    Leiden University
  </div>





  <div class="hcMarginBottom1">
    <strong>Dr. Danielle van den Heuvel</strong><br>
    University of Amsterdam
  </div>





  <div class="hcMarginBottom1">
    <strong>Prof. dr. Idesbald Goddeeris </strong><br>
    KU Leuven, Belgium
  </div>





  <div class="hcMarginBottom1">
    <strong>Prof. dr. Marnix Beyen</strong><br>
    Universiteit Antwerpen
  </div>





  <div class="hcMarginBottom1">
    <strong>Dr. Maïka De Keyzer</strong><br>
    Belgium
  </div>





  <div class="hcMarginBottom1">
    <strong>Dr. Pim Huijnen</strong><br>
    Universiteit Utrecht, Netherlands
  </div>

</div>
</div>
  </div>


  <!-- col 1 -->
  <div class="hcBasicSideMargin hcMarginBottom3">
    <h2>Archive</h2>
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
