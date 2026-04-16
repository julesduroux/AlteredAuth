<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("logoutConfirmTitle")}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">${msg("logoutConfirmHeader")}</div>
    </div>
  </div>

  <#if message?has_content>
    <div class="alert alert-${message.type}">
      ${kcSanitize(message.summary)?no_esc}
    </div>
  </#if>

  <form action="${url.logoutConfirmAction}" method="POST">
    <input type="hidden" name="session_code" value="${logoutConfirm.code}">
    <div class="form-actions">
      <#if client?? && client.baseUrl?has_content>
        <a class="btn-secondary" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a>
      </#if>
      <button class="btn-primary" type="submit" name="confirmLogout">${msg("doLogout")}</button>
    </div>
  </form>

</div>

</body>
</html>
