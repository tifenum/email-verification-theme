<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=true; section>
  <#if section = "pageTitle">
    ${msg("updatePasswordTitle")}
  <#elseif section = "form">
    <div class="update-password-container">
      <img src="${url.resourcesPath}/img/favicon.png" alt="Logo" class="logo">
      <h2>Yo, Set a New Password!</h2>

      <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
        <div class="form-group">
          <label for="password-new">${msg("passwordNew")}</label>
          <input type="password" id="password-new" name="password-new" class="form-control" autofocus>
        </div>

        <div class="form-group">
          <label for="password-confirm">${msg("passwordConfirm")}</label>
          <input type="password" id="password-confirm" name="password-confirm" class="form-control">
        </div>

        <div class="form-group">
          <button type="submit" class="btn btn-primary">${msg("doSubmit")}</button>
        </div>
      </form>
    </div>
  </#if>
</@layout.registrationLayout>
