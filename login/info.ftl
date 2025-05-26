<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "pageTitle">
        <#if messageHeader??>
            ${messageHeader}
        <#else>
            ${message.summary}
        </#if>
    <#elseif section = "form">
        <div id="kc-info-message" class="no-form-wrapper">
            <#if requiredActions?has_content && requiredActions?seq_contains("VERIFY_EMAIL")>
                <div class="verify-email-container">
                    <img src="${url.resourcesPath}/img/favicon.png" alt="Booking Platform Logo" class="logo">
                    <h2>Yo, Verify Your Email, Bro!</h2>
                    <p>An email has been sent to your registered address. Click the button below to verify your email.</p>
                    <#if actionUri?has_content>
                        <p>
                            <a href="${actionUri}" class="btn btn-primary" role="button">Verify Email</a>
                        </p>
                    <#else>
                        <p>Email verification link is missing. Please check your spam folder or try registering again.</p>
                    </#if>
                </div>
            <#elseif requiredActions?has_content && requiredActions?seq_contains("UPDATE_PASSWORD")>
                <div class="update-password-container">
                    <img src="${url.resourcesPath}/img/favicon.png" alt="Booking Platform Logo" class="logo">
                    <h2>Time to Reset That Password!</h2>
                    <p>For your security, please reset your password using the form below.</p>
                    
                    <form id="kc-update-password-form" action="${url.loginAction()}" method="post">
                        <div class="form-group">
                            <label for="password-new">${msg("passwordNew")}</label>
                            <input type="password" id="password-new" name="password-new" class="form-control" autocomplete="new-password" required>
                        </div>
                        <div class="form-group">
                            <label for="password-confirm">${msg("passwordConfirm")}</label>
                            <input type="password" id="password-confirm" name="password-confirm" class="form-control" autocomplete="new-password" required>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary">Update Password</button>
                        </div>
                    </form>
                </div>
            
            <#elseif message.summary?contains("updated")>
                <div class="verify-email-container">
                    <img src="${url.resourcesPath}/img/favicon.png" alt="Booking Platform Logo" class="logo">
                    <h2>Email Verified, Bro!</h2>
                    <p>Redirecting you to sign in...</p>
                    <script>
                        window.location.href = "${pageRedirectUri! 'https://booking.medhabib.me/signin'}";
                    </script>
                </div>
            <#else>
                <p class="instruction">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b></#list><#else></#if></p>
                <#if skipLink??>
                <#else>
                    <#if pageRedirectUri?has_content>
                        <p><a href="${pageRedirectUri}" class="btn btn-primary" role="button">${msg("backToApplication")}</a></p>
                    <#elseif actionUri?has_content>
                        <p><a href="${actionUri}" class="btn btn-primary" role="button">${kcSanitize(msg("proceedWithAction"))?no_esc}</a></p>
                    <#else>
                        <p><a href="${properties.logoUrl}" class="btn btn-primary" role="button">${msg("backToApplication")}</a></p>
                    </#if>
                </#if>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>