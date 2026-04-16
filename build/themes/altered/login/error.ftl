<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("errorTitle")}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">${msg("errorTitle")}</div>
    </div>
  </div>

  <#if message?has_content>
    <div class="alert alert-error">
      ${kcSanitize(message.summary)?no_esc}
    </div>
  </#if>

  <#if !skipLink??>
    <div class="form-actions">
      <#if client?? && client.baseUrl?has_content>
        <a class="btn-secondary" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a>
      <#elseif url.loginRestartFlowUrl?has_content>
        <a class="btn-secondary" href="${url.loginRestartFlowUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
      </#if>
    </div>
  </#if>

</div>

</body>
</html>
