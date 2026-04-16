<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("loginTitle", realm.displayName)}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">Altered Re:Union</div>
      <div class="login-subtitle">${msg("loginSubtitle")}</div>
    </div>
  </div>

  <#if message?has_content>
    <div class="alert alert-${message.type}">
      ${kcSanitize(message.summary)?no_esc}
    </div>
  </#if>

  <form action="${url.loginAction}" method="post">
    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

    <div class="form-group">
      <label class="form-label" for="username">
        <#if !realm.loginWithEmailAllowed>${msg("username")}
        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
        <#else>${msg("email")}</#if>
      </label>
      <input
        class="form-control"
        type="text"
        id="username"
        name="username"
        value="${(login.username!'')}"
        autocomplete="username"
        autofocus
        <#if usernameEditDisabled??>disabled</#if>
      >
    </div>

    <div class="form-group">
      <div class="password-header">
        <label class="form-label" for="password">${msg("password")}</label>
        <#if realm.resetPasswordAllowed>
          <a class="forgot-link" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
        </#if>
      </div>
      <input
        class="form-control"
        type="password"
        id="password"
        name="password"
        autocomplete="current-password"
      >
    </div>

    <#if realm.rememberMe && !usernameEditDisabled??>
      <label class="remember-me">
        <input type="checkbox" name="rememberMe" <#if login.rememberMe??>checked</#if>>
        <span>${msg("rememberMe")}</span>
      </label>
    </#if>

    <button class="btn-primary" type="submit">${msg("doLogIn")}</button>
  </form>

  <#if realm.password && social?? && social.providers?has_content>
    <div class="divider">${msg("identity-provider-login-label")}</div>
    <div class="social-providers">
      <#list social.providers as p>
        <a class="btn-social" href="${p.loginUrl}">
          <#if p.iconClasses?has_content>
            <i class="${p.iconClasses}"></i>
          </#if>
          ${p.displayName}
        </a>
      </#list>
    </div>
  </#if>

  <#if realm.registrationAllowed && !registrationDisabled??>
    <div class="divider"></div>
    <div class="register-row">
      ${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a>
    </div>
  </#if>

  <#if realm.internationalizationEnabled && locale.supported?size gt 1>
    <div class="locale-switcher">
      <select onchange="window.location.href=this.value">
        <#list locale.supported as l>
          <option value="${l.url}" <#if locale.currentLanguageTag == l.languageTag>selected</#if>>${l.label}</option>
        </#list>
      </select>
    </div>
  </#if>

</div>

</body>
</html>
