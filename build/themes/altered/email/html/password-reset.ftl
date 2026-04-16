<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Reset your password – Altered Re:Union</title>
  <!--[if mso]><noscript><xml><o:OfficeDocumentSettings><o:PixelsPerInch>96</o:PixelsPerInch></o:OfficeDocumentSettings></xml></noscript><![endif]-->
  <style>
    body { margin: 0; padding: 0; background-color: #080c17; font-family: 'Inter', Arial, sans-serif; color: #e2e8f0; }
    table { border-collapse: collapse; }
    a { color: #00c2d4; }
    .wrapper { width: 100%; background-color: #080c17; padding: 40px 0; }
    .container { max-width: 520px; margin: 0 auto; background-color: #0e1525; border: 1px solid #1e2d45; border-radius: 16px; overflow: hidden; }
    .header { text-align: center; padding: 36px 40px 24px; border-bottom: 1px solid #1e2d45; }
    .header img { width: 60px; height: 60px; }
    .header h1 { margin: 16px 0 0; font-size: 20px; font-weight: 600; color: #e2e8f0; letter-spacing: 0.01em; }
    .header p { margin: 6px 0 0; font-size: 13px; color: #8899aa; }
    .body { padding: 32px 40px; }
    .body p { font-size: 15px; line-height: 1.7; color: #c8d8e8; margin: 0 0 16px; }
    .btn-wrap { text-align: center; margin: 28px 0; }
    .btn { display: inline-block; padding: 13px 36px; background: linear-gradient(135deg, #c9a84c, #a8853a); border-radius: 8px; color: #080c17 !important; font-size: 15px; font-weight: 600; text-decoration: none; letter-spacing: 0.02em; }
    .divider { height: 1px; background: #1e2d45; margin: 24px 0; }
    .fallback { font-size: 12px; color: #8899aa; word-break: break-all; }
    .fallback a { color: #8899aa; }
    .footer { text-align: center; padding: 20px 40px 28px; }
    .footer p { font-size: 12px; color: #4a5f78; margin: 0; line-height: 1.6; }
  </style>
</head>
<body>
<div class="wrapper">
  <table class="container" width="520" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td class="header">
        <img src="https://auth.altered.re/realms/${realmName}/login-actions/resource/logo.png" alt="Altered Re:Union" onerror="this.style.display='none'">
        <h1>Altered Re:Union</h1>
        <p>Password reset</p>
      </td>
    </tr>
    <tr>
      <td class="body">
        <p>Hello,</p>
        <p>We received a request to reset the password for your Altered Re:Union account. Click the button below to set a new password.</p>
        <div class="btn-wrap">
          <a class="btn" href="${link}">Reset my password</a>
        </div>
        <div class="divider"></div>
        <p class="fallback">If the button doesn't work, copy and paste this link into your browser:<br>
          <a href="${link}">${link}</a>
        </p>
        <p class="fallback" style="margin-top:12px;">This link expires in ${linkExpirationFormatter(linkExpiration)}.</p>
      </td>
    </tr>
    <tr>
      <td class="footer">
        <p>If you did not request a password reset, you can safely ignore this email.<br>
        Your password will not be changed.</p>
      </td>
    </tr>
  </table>
</div>
</body>
</html>
