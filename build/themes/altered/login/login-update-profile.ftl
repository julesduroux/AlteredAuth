<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("loginProfileTitle")}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">${msg("loginProfileTitle")}</div>
      <div class="login-subtitle">${msg("loginProfileSubtitle")}</div>
    </div>
  </div>

  <#if message?has_content>
    <div class="alert alert-${message.type}">
      ${kcSanitize(message.summary)?no_esc}
    </div>
  </#if>

  <form action="${url.loginAction}" method="post">

    <#if user.editUsernameAllowed>
      <div class="form-group">
        <label class="form-label" for="username">${msg("username")}</label>
        <input
          class="form-control"
          type="text"
          id="username"
          name="username"
          value="${(user.username!'')}"
          autocomplete="username"
        >
      </div>
    </#if>

    <div class="form-group">
      <label class="form-label" for="email">${msg("email")}</label>
      <input
        class="form-control"
        type="email"
        id="email"
        name="email"
        value="${(user.email!'')}"
        autocomplete="email"
      >
    </div>

    <div class="form-row">
      <div class="form-group form-group-half">
        <label class="form-label" for="firstName">${msg("firstName")}</label>
        <input
          class="form-control"
          type="text"
          id="firstName"
          name="firstName"
          value="${(user.firstName!'')}"
          autocomplete="given-name"
        >
      </div>

      <div class="form-group form-group-half">
        <label class="form-label" for="lastName">${msg("lastName")}</label>
        <input
          class="form-control"
          type="text"
          id="lastName"
          name="lastName"
          value="${(user.lastName!'')}"
          autocomplete="family-name"
        >
      </div>
    </div>

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
