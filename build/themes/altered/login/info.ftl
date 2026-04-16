<!DOCTYPE html>
<html lang="${locale.currentLanguageTag}">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="robots" content="noindex, nofollow">
  <title>${msg("infoTitle")}</title>
  <link rel="icon" href="${url.resourcesPath}/img/logo.png" type="image/png">
  <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
</head>
<body>

<div class="login-card">

  <div class="login-header">
    <img class="login-logo" src="${url.resourcesPath}/img/logo.png" alt="Altered Re:Union">
    <div>
      <div class="login-title">Altered Re:Union</div>
    </div>
  </div>

  <#if messageHeader??>
    <div class="info-header">${messageHeader}</div>
  </#if>

  <#if message?has_content>
    <div class="alert alert-${message.type}">
      ${kcSanitize(message.summary)?no_esc}
      <#if requiredActions??>
        <#list requiredActions>: <#items as reqActionItem>${kcSanitize(msg("requiredAction.${reqActionItem}"))?no_esc}<#sep>, </#sep></#items></#list>
      </#if>
    </div>
  </#if>

  <#if skipLink??>
  <#elseif pageRedirectUri?has_content>
    <div class="form-actions">
      <a class="btn-secondary" href="${pageRedirectUri}">${kcSanitize(msg("backToApplication"))?no_esc}</a>
    </div>
  <#elseif actionUri?has_content>
    <div class="form-actions">
      <a class="btn-primary" href="${actionUri}" style="text-decoration:none; text-align:center; flex:1;">${kcSanitize(msg("proceedWithAction"))?no_esc}</a>
    </div>
  <#elseif (client.baseUrl)?has_content>
    <div class="form-actions">
      <a class="btn-secondary" href="${client.baseUrl}">${kcSanitize(msg("backToApplication"))?no_esc}</a>
    </div>
  </#if>

</div>

</body>
</html>
