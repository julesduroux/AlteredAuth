<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("updatePasswordTitle")}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">${msg("updatePasswordTitle")}</div>
      <div class="login-subtitle">${msg("updatePasswordSubtitle")}</div>
    </div>
  </div>

  <#if message?has_content>
    <div class="alert alert-${message.type}">
      ${kcSanitize(message.summary)?no_esc}
    </div>
  </#if>

  <form action="${url.loginAction}" method="post">
    <input type="text" name="username" value="${(username!'')}" autocomplete="username" readonly hidden>

    <div class="form-group">
      <label class="form-label" for="password-new">${msg("passwordNew")}</label>
      <input
        class="form-control"
        type="password"
        id="password-new"
        name="password-new"
        autocomplete="new-password"
        autofocus
      >
    </div>

    <div class="form-group">
      <label class="form-label" for="password-confirm">${msg("passwordConfirm")}</label>
      <input
        class="form-control"
        type="password"
        id="password-confirm"
        name="password-confirm"
        autocomplete="new-password"
      >
    </div>

    <#if isAppInitiatedAction??>
      <label class="remember-me" style="margin-bottom:1.25rem;">
        <input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked>
        <span>${msg("logoutOtherSessions")}</span>
      </label>
    </#if>

    <div class="form-actions">
      <#if isAppInitiatedAction??>
        <button class="btn-secondary" type="submit" name="cancel-aia" value="true">${msg("doCancel")}</button>
      </#if>
      <button class="btn-primary" type="submit">${msg("doSubmit")}</button>
    </div>
  </form>

</div>

</body>
</html>
