<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("termsTitle")}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card login-card-wide">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">${msg("termsTitle")}</div>
      <div class="login-subtitle">${msg("termsSubtitle")}</div>
    </div>
  </div>

  <#if message?has_content>
    <div class="alert alert-${message.type}">
      ${kcSanitize(message.summary)?no_esc}
    </div>
  </#if>

  <div class="terms-body">
    ${kcSanitize(msg("termsText"))?no_esc}
  </div>

  <form action="${url.loginAction}" method="POST">
    <div class="form-actions">
      <button class="btn-secondary" type="submit" name="cancel" value="true">${msg("doDecline")}</button>
      <button class="btn-primary" type="submit" name="accept" value="true">${msg("doAccept")}</button>
    </div>
  </form>

</div>

</body>
</html>
