{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2020 Bas Doppen - KNAW HUC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
 <!DOCTYPE html>
 <html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
   <head>
     <meta charset="{$defaultCharset|escape}">
     <title>

         {$displayPageHeaderTitle} - {$siteTitle}

     </title>
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <meta name="description" content="OpenJournals provides a professional OpenAccess publishing platform for scholarly, peer-reviewed journals. This platform is made possible by a collaboration between the KNAW, NWO and the OPUS Foundation.">
     <meta name="keywords" content="Open Access, Open journal Systems, peer-reviewed journals, science">
     <link rel="icon" type="image/png" href="{$baseUrl}/plugins/themes/ojnl/templates/images/favicon.png">

     {load_stylesheet context="frontend" stylesheets=$stylesheets}
     {load_header context="frontend"}
   </head>
   <body>



{include file="frontend/components/headerHome.tpl"}

<div class="layoutBasic hcBasicSideMargin topMargin2">
 <div class="block hcMarginBottom3 textLong">
   <h2>{translate key="indexSite.welcome"}</h2>
	 {$about|nl2br}


 </div>
</div>


<div class="ojLayout3col-basic hcMarginTop3">
  {**  col1  *}
  <div class="hcBasicSideMargin">
    <h2>{translate key="indexSite.ourjournals"}</h2>
    <p class="textLong">{translate key="indexSite.ourjournals.intro"}</p>


    <div class="journalCards">


      {*  join us  *}
      <div class="journalCard hcMarginBottom2">
        <div class="cardLogoBg hcMarginBottom1" style="background-color: hsl(10, 86%, 68%)">
          <h2 style="color:#fff"><script type="text/javascript">var emailAddress = ('info@' + 'openjournals.nl');document.write('<a href="mailto:' + emailAddress + ' "  style="color:#fff">Join Us</a>');</script></h2>
        </div>
        <div>
          <strong>Join us!</strong><br>
          <script type="text/javascript">var emailAddress = ('info@' + 'openjournals.nl');document.write('<a href="mailto:' + emailAddress + '">Join Us</a>');</script>

        </div>
      </div>
      {*  / join us  *}



      {*   journal cards *}
      {if $journals->wasEmpty()}
       {translate key="site.noJournals"}
       {else}

       {iterate from=journals item=journal}


       {capture assign="url"}{url journal=$journal->getPath()}{/capture}
       {assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
       {assign var="description" value=$journal->getLocalizedDescription()}


       <div class="journalCard hcMarginBottom2" onclick="location.href='{$url|escape}'">
         <div class="cardLogoBg hcMarginBottom1" style="background-color: hsl(0, 0%, 50%){*$journal->$activeTheme->getOption('baseColour')*}">
           {if $thumb}<img src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"{if $thumb.altText} alt="{$thumb.altText|escape|default:''}"{/if}>{/if}
         </div>
         <div>
           <strong>{$journal->getLocalizedName()}</strong><br>
           {*if $description}{$description|nl2br*}{*/if*}
           <a href="{$url|escape}">
             {translate key="site.journalView"}
           </a>
         </div>
        </div>
        {/iterate}
       {/if}
       {* /  journal cards *}




  </div>
  </div>

  {**  col 2  *}
  <div class="hcBasicSideMargin ojBasicWidth">
    <h2>{translate key="indexSite.aboutoj"}</h2>
    {translate key="indexSite.text"}
  </div>



  {**  Col 3  *}
  <div class="hcBasicSideMargin hcMarginBottom3">

  </div>
</div>







{**  video modal  *}
<div class="ojModal" id="modvid">
  <div class="ojModalInner" id="player1">
    <div class="ojModalClose" onclick="closeModal()"><img src="/plugins/themes/ojnl/templates/images/icon-x-white.png" alt=""></div>
    <iframe src="https://www.youtube.com/embed/zZp6KVCA4FY" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  </div>
</div>















		{**  footer  *}
		{include file="frontend/components/htmlFooter.tpl"}
