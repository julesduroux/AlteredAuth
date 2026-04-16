<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("consentTitle")}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">
        <#if client.name?has_content>
          ${msg("consentHeader", advancedMsg(client.name))}
        <#else>
          ${msg("consentHeader", client.clientId)}
        </#if>
      </div>
      <div class="login-subtitle">${msg("consentSubtitle")}</div>
    </div>
  </div>

  <#if message?has_content>
    <div class="alert alert-${message.type}">
      ${kcSanitize(message.summary)?no_esc}
    </div>
  </#if>

  <ul class="consent-list">
    <#if oauth.clientScopesRequested?has_content>
      <#list oauth.clientScopesRequested as clientScope>
        <li>
          <svg class="consent-icon" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"><polyline points="20 6 9 17 4 12"></polyline></svg>
          <span>${advancedMsg(clientScope.consentScreenText)}</span>
        </li>
      </#list>
    </#if>
  </ul>

  <form action="${url.oauthAction}" method="POST">
    <input type="hidden" name="code" value="${oauth.code}">
    <div class="form-actions">
      <button class="btn-secondary" type="submit" name="cancel">${msg("doDecline")}</button>
      <button class="btn-primary" type="submit" name="accept">${msg("doGrantAccess")}</button>
    </div>
  </form>

</div>

</body>
</html>
