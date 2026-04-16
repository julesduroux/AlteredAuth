<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("emailVerifyTitle")}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">${msg("emailVerifyTitle")}</div>
      <div class="login-subtitle">${msg("emailVerifyInstruction1", user.email)}</div>
    </div>
  </div>

  <#if message?has_content>
    <div class="alert alert-${message.type}">
      ${kcSanitize(message.summary)?no_esc}
    </div>
  </#if>

  <p style="font-size:0.9rem; color:var(--text-muted); line-height:1.6; margin-bottom:1.25rem;">
    ${msg("emailVerifyInstruction2")}
    <a href="${url.loginAction}" style="color:var(--teal);">${msg("doClickHere")}</a>
    ${msg("emailVerifyInstruction3")}
  </p>

</div>

</body>
</html>
