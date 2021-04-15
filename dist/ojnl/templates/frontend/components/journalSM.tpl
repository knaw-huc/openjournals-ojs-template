<div>
  {if $activeTheme->getOption('twitter')}
  <a href="https://twitter.com/{$activeTheme->getOption('twitter')}"><img src="{$baseUrl}/plugins/themes/ojnl/templates/images/icon-twitter.svg" alt="twitter icon" class="ojIcon">Twitter</a><br>
  {/if}

  {if $activeTheme->getOption('facebook')}
  <a href="{$activeTheme->getOption('facebook')}"><img src="{$baseUrl}/plugins/themes/ojnl/templates/images/icon-facebook.svg" alt="Facebook icon" class="ojIcon">Facebook</a><br>
  {/if}

  {if $activeTheme->getOption('linkedin')}
  <a href="{$activeTheme->getOption('linkedin')}"><img src="{$baseUrl}/plugins/themes/ojnl/templates/images/icon-linkedin.svg" alt="Linkedin icon" class="ojIcon">Linkedin</a>
  {/if}

</div>
