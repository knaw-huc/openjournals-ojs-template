{**
 * templates/frontend/pages/userLogin.tpl
 *
 * Copyright (c) 2014-2019 Simon Fraser University
 * Copyright (c) 2000-2019 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * User login form.
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



 <div class="ojLayout3col-basic hcMarginTop3">
 	{**  Col 1  *}
 	<div class="hcBasicSideMargin ojCoverAside hcMarginBottom2"></div>


 	{**  Col 2  *}
 	<div class="hcBasicSideMargin">
 		<h1 class="hcMarginBottom1">Login</h1>




		{if $loginMessage}
			<p>
				{translate key=$loginMessage}
			</p>
		{/if}

		<form class="cmp_form login" id="login" method="post" action="{$loginUrl}">
			{csrf}

			{if $error}
				<div class="row">
					<div class="pkp_form_error col-md-6 offset-md-3">
						<div class="alert alert-danger" role="alert">{translate key=$error reason=$reason}</div>
					</div>
				</div>
			{/if}

			<input type="hidden" name="source" value="{$source|strip_unsafe_html|escape}" />

			<fieldset class="fields">
				<div class="row">
					<div class="form-group col-md-6 offset-md-3">
						<label for="username" class="sr-only">
							{translate key="user.username"}
						</label>
						<input type="text" class="form-control" name="username" id="username" value="{$username|escape}" maxlength="32" placeholder="{translate key="user.username"}" required>
						<small class="form-text text-muted"><span class="required">*</span>{translate key="common.required"}</small>
					</div>

					<div class="form-group col-md-6 offset-md-3">
						<label for="password" class="sr-only">
							{translate key="user.password"}
						</label>
						<input type="password" class="form-control" name="password" id="password" value="{$password|escape}" password="true" maxlength="32" placeholder="{translate key="user.password"}" required>
						<small class="form-text text-muted"><span class="required">*</span>{translate key="common.required"}</small>
						<p>
							<small>
								<a href="{url page="login" op="lostPassword"}">
									{translate key="user.login.forgotPassword"}
								</a>
							</small>
						</p>
					</div>

					<div class="col-md-6 offset-md-3 custom-control custom-checkbox checkbox-remember">
						<input type="checkbox" class="custom-control-input" name="remember" id="remember" value="1" checked>
						<label class="custom-control-label" for="remember">{translate key="user.login.rememberUsernameAndPassword"}</label>
					</div>

					<div class="col-md-6 offset-md-3 buttons">
						<button class="submit btn btn-primary" type="submit">
							{translate key="user.login"}
						</button>

						{if !$disableUserReg}
							{capture assign="registerUrl"}{url page="user" op="register" source=$source}{/capture}
							<a href="{$registerUrl}" class="register btn">
								{translate key="user.login.registerNewAccount"}
							</a>
						{/if}
					</div>

			</fieldset>
		</form>



	</div>


	{**  Col 3  *}
	<div class="hcBasicSideMargin"></div>
	</div>



  {**  powered by  *}
  {include file="frontend/components/poweredBy.tpl"}
  {**  footer  *}

	{include file="frontend/components/htmlFooter.tpl"}
