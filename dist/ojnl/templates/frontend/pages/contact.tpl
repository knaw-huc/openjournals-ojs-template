{**
 * templates/frontend/pages/contact.tpl
 *
 * Copyright (c) 2020 Bas Doppen- KNAW-HuC
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the page to view a journal's or press's description, contact
 *  details, policies and more.
 *
 * @uses $currentContext Journal|Press The current journal or press
 *}

 {include file="frontend/components/htmlHeader.tpl"}








 <div class="ojLayout3col-basic hcMarginTop3">
 	{**  Col 1  *}
 	<div class="hcBasicSideMargin ojCoverAside hcMarginBottom2"></div>


 	{**  Col 2  *}
 	<div class="hcBasicSideMargin">
 		<h1 class="hcMarginBottom1">Contact</h1>
		{$content}
	</div>


	{**  Col 3  *}
	<div class="hcBasicSideMargin"></div>
	</div>



  {**  powered by  *}
  {include file="frontend/components/htmlFooter.tpl"}
  {**  footer  *}
  {include file="frontend/components/poweredBy.tpl"}
