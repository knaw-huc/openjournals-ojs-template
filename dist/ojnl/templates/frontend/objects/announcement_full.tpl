{**
 * templates/frontend/objects/announcement_full.tpl
 *
 * Copyright (c) 2014-2020 Simon Fraser University
 * Copyright (c) 2003-2020 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the full view of an announcement, when the announcement is
 *  the primary element on the page.
 *
 * @uses $announcement Announcement The announcement to display
 *}


	<h1 class="hcMarginBottom1">
		{$announcement->getLocalizedTitle()|escape}
	</h1>
	<div class="hcMarginBottom1">
		{$announcement->getDatePosted()|date_format:$dateFormatShort}
	</div>
	<div class="description">
		{if $announcement->getLocalizedDescription()}
			{$announcement->getLocalizedDescription()|strip_unsafe_html}
		{else}
			{$announcement->getLocalizedDescriptionShort()|strip_unsafe_html}
		{/if}
