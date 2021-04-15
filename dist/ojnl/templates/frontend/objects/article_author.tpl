{if $publication->getData('authors')}

	<div class="columnContent hcMarginBottom2">
		<strong>{translate key="article.authors"}</strong>




			{strip}
				{foreach from=$publication->getData('authors') item=author key=authorNumber}
				<div class="hcMarginBottom2">




					<span>
						{* OrcId *}
						{if $author->getOrcid()}
							<a class="orcid-image-url" href="{$author->getOrcid()}"><img src="{$baseUrl}/plugins/themes/ojnl/templates/images/orcid.png"></a>
						{/if}

						{* author's name  *}
						{$author->getFullName()|escape}

						{* email
						{if $author->getLocalizedData('email')}
						<a href="mailto:{$author->getLocalizedData('email')|escape}">{$author->getLocalizedData('email')|escape}</a>
						{/if}
						*}

						{* Affiliation *}
						{if $author->getLocalizedAffiliation()}, {$author->getLocalizedAffiliation()|escape}{/if}
					</span>

						{* bio *}
						{if $author->getLocalizedBiography()}
						<br><em>Biography</em><br>
						{$author->getLocalizedBiography()|strip_unsafe_html}
						{/if}



						</div>
				{/foreach}

			{/strip}
		</div>
{/if}
