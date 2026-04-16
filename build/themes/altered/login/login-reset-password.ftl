<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("emailForgotTitle")}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">${msg("emailForgotTitle")}</div>
      <div class="login-subtitle">${msg("emailInstruction")}</div>
    </div>
  </div>

  <#if message?has_content>
    <div class="alert alert-${message.type}">
      ${kcSanitize(message.summary)?no_esc}
    </div>
  </#if>

  <form action="${url.loginAction}" method="post">
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
        value="${(auth.attemptedUsername!'')}"
        autocomplete="username"
        autofocus
      >
    </div>

    <div class="form-actions">
      <a class="btn-secondary" href="${url.loginUrl}">${msg("backToLogin")}</a>
      <button class="btn-primary" type="submit">${msg("doSubmit")}</button>
    </div>
  </form>

</div>

</body>
</html>
