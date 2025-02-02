{**
 * templates/frontend/pages/userLostPassword.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2000-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Password reset form.
 *
 *}

 {include file="frontend/components/htmlHeader.tpl"}

 {if !$currentJournal}
 {include file="frontend/components/headerHome.tpl"}

 {else}
  {include file="frontend/components/header.tpl"}
  {**  breadcrumb  *}
  <div class="ojLayout3col-OneDiv breadCrump textSmall hcBasicSideMargin hcMarginTop3">
    <a href="{$baseUrl}">Openjournals.nl</a>
    <span class="slash">/</span>
    <a href="{$baseUrl}/index.php/{$currentJournal->getPath()}">{$currentJournal->getLocalizedName()}</a>
  </div>
 {/if}

 <main class="page page_lost_password">
 	<div class="container-fluid container-page">

 		

 		<div class="row">
 			<p class="col-md-6 offset-md-3">{translate key="user.login.resetPasswordInstructions"}</p>
 		</div>

 		<form class="cmp_form lost_password" id="lostPasswordForm" action="{url page="login" op="requestResetPassword"}" method="post">
 			{csrf}
 			{if $error}
 				<div class="row">
 					<div class="pkp_form_error col-md-6 offset-md-3">
 						<div class="alert alert-danger" role="alert">{translate key=$error}</div>
 					</div>
 				</div>
 			{/if}


 			<fieldset class="fields">

 				<div class="row">
 					<div class="form-group col-md-6 offset-md-3">
 						<label for="email" class="sr-only">{translate key="user.login.registeredEmail"}</label>
 						<input type="text" class="form-control" name="email" id="email" value="{$email|escape}" placeholder="{translate key="user.login.registeredEmail"}" required>
 						<small class="form-text text-muted"><span class="required">*</span>{translate key="common.required"}</small>
 					</div>
 				</div>

 				<div class="row buttons">
 					<div class="col-md-6 offset-md-3">
 						<button class="submit btn btn-primary" type="submit">
 							{translate key="user.login.resetPassword"}
 						</button>

 						{if !$disableUserReg}
 							{capture name="registerUrl"}{url page="user" op="register" source=$source}{/capture}
 							<a href="{$registerUrl}" class="register btn">
 								{translate key="user.login.registerNewAccount"}
 							</a>
 						{/if}
 					</div>
 				</div>
 			</fieldset>

 		</form>

 	</div>
 </main><!-- .page -->

 {include file="frontend/components/footer.tpl"}
