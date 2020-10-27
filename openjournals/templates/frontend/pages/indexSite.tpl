{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2014-2020 Bas Doppen
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}




<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <title>test home</title>
  </head>
  <body>


{include file="frontend/components/header.tpl"}

    {if $journals->wasEmpty()}
      {translate key="site.noJournals"}
    {else}

        {iterate from=journals item=journal}
          {capture assign="url"}{url journal=$journal->getPath()}{/capture}
          {assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
          {assign var="description" value=$journal->getLocalizedDescription()}




          <div style="background-color:rgb(237, 200, 152)">
                  {$journal->getLocalizedName()}

              {if $description} {$description|nl2br} {/if}

                  <a href="{$url|escape}"> {translate key="site.journalView"} </a>


                  <a href="{url|escape journal=$journal->getPath() page="issue" op="current"}">
                    {translate key="site.journalCurrent"}
                  </a>

            </div>

        {/iterate}

    {/if}

  </body>
</html>
