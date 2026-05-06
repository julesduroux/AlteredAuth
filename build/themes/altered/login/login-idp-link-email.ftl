<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("emailLinkIdpTitle", idpDisplayName)}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">${msg("emailLinkIdpTitle", idpDisplayName)}</div>
    </div>
  </div>

  <#if message?has_content>
    <div class="alert alert-${message.type}">
      ${kcSanitize(message.summary)?no_esc}
    </div>
  </#if>

  <p class="login-subtitle" style="text-align:left; margin-bottom:1rem;">
    ${msg("emailLinkIdp1", idpDisplayName, brokerContext.username, realm.displayName)}
  </p>
  <p class="login-subtitle" style="text-align:left; margin-bottom:1rem;">
    ${msg("emailLinkIdp2")} <a class="forgot-link" href="${url.loginAction}">${msg("doClickHere")}</a> ${msg("emailLinkIdp3")}
  </p>
  <p class="login-subtitle" style="text-align:left;">
    ${msg("emailLinkIdp4")} <a class="forgot-link" href="${url.loginRestartFlowUrl}">${msg("doClickHere")}</a> ${msg("emailLinkIdp5")}
  </p>

</div>

</body>
</html>
