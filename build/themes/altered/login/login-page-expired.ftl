<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("pageExpiredTitle")}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">${msg("pageExpiredTitle")}</div>
      <div class="login-subtitle">${msg("pageExpiredMsg1")}</div>
    </div>
  </div>

  <div class="form-actions" style="flex-direction:column; gap:0.6rem;">
    <a class="btn-primary" href="${url.loginRestartFlowUrl}" style="text-decoration:none; text-align:center; width:100%;">
      ${msg("doClickHere")} ${msg("pageExpiredMsg2")}
    </a>
    <a class="btn-secondary" href="${url.loginAction}" style="width:100%;">
      ${msg("doClickHere")} ${msg("pageExpiredMsg3")}
    </a>
  </div>

</div>

</body>
</html>
