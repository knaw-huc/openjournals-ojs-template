{if $citation}

<select id="citationSelect" onchange="handleCitation()">
  <option value="">Select a citation</option>
  {foreach from=$citationStyles item="citationStyle"}
    <option value="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}">
      {* <a
        aria-controls="citationOutput"
        href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgs}"
        data-load-citation
        data-json-href="{url page="citationstylelanguage" op="get" path=$citationStyle.id params=$citationArgsJson}"
      > *}
        {$citationStyle.title|escape}
      {* </a> *}
    </option>
  {/foreach}
</select>
<br>


<div id="citationFormat">
  {$citation}
</div>

{if count($citationDownloads)}
  <div class="dropdown-divider"></div>
  <em>
    {translate key="submission.howToCite.downloadCitation"}<br>
  </em>
  {foreach from=$citationDownloads item="citationDownload"}
    <a class="dropdown-item"
       href="{url page="citationstylelanguage" op="download" path=$citationDownload.id params=$citationArgs}">
      <span class="fa fa-download"></span>
      {$citationDownload.title|escape}
    </a>
  {/foreach}
{/if}



{/if}
