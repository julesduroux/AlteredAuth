<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("loginChooseAuthenticator")}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">${msg("loginChooseAuthenticator")}</div>
    </div>
  </div>

  <#if message?has_content>
    <div class="alert alert-${message.type}">
      ${kcSanitize(message.summary)?no_esc}
    </div>
  </#if>

  <form action="${url.loginAction}" method="POST" class="authenticator-list">
    <#list auth.authenticationSelections as authenticationSelection>
      <button class="authenticator-item" type="submit" name="authenticationExecution" value="${authenticationSelection.authExecId}">
        <i class="authenticator-icon ${authenticationSelection.iconCssClass}" aria-hidden="true"></i>
        <span class="authenticator-text">
          <span class="authenticator-name">${msg('${authenticationSelection.displayName}')}</span>
          <span class="authenticator-help">${msg('${authenticationSelection.helpText}')}</span>
        </span>
      </button>
    </#list>
  </form>

</div>

</body>
</html>
