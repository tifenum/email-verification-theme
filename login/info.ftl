<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "pageTitle">
        <#if messageHeader??>
            ${messageHeader}
        <#else>
            ${message.summary}
        </#if>
    <#elseif section = "form">
        <div style="background: linear-gradient(135deg, #add8e6 0%, #87ceeb 100%); font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; margin: 0; min-height: 100vh; display: flex; justify-content: center; align-items: center;">
            <div style="background: #ffffff; border-radius: 12px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15); padding: 32px; max-width: 500px; width: 90%; text-align: center; margin: 20px auto; transition: transform 0.3s ease;" onmouseover="this.style.transform='translateY(-5px)'" onmouseout="this.style.transform='translateY(0)'">
                <img src="${url.resourcesPath}/img/favicon.png" alt="Booking Platform Logo" style="max-width: 100px; margin: 0 auto 20px; display: block;">
                <#if requiredActions?has_content && requiredActions?seq_contains("VERIFY_EMAIL")>
                    <h2 style="color: #1a1a1a; font-size: 28px; font-weight: 700; margin-bottom: 16px; letter-spacing: -0.5px;">Yo, Verify Your Email, Bro!</h2>
                    <p style="color: #4a4a4a; font-size: 16px; line-height: 1.5; margin: 0 0 24px;">An email has been sent to your registered address. Click the button below to verify your email.</p>
                    <#if actionUri?has_content>
                        <p>
                            <a href="${actionUri}" style="display: inline-block; background-color: #ff4500; color: #ffffff; font-size: 16px; font-weight: 600; padding: 12px 24px; border-radius: 8px; text-decoration: none; transition: background-color 0.3s ease, transform 0.2s ease;" onmouseover="this.style.backgroundColor='#e03e00'; this.style.transform='scale(1.05)';" onmouseout="this.style.backgroundColor='#ff4500'; this.style.transform='scale(1)';" onmousedown="this.style.transform='scale(0.95)';" onmouseup="this.style.transform='scale(1.05)';">Verify Email</a>
                        </p>
                    <#else>
                        <p style="color: #4a4a4a; font-size: 16px; line-height: 1.5; margin: 0 0 24px;">Email verification link is missing. Please check your spam folder or try registering again.</p>
                    </#if>
                <#elseif message.summary?contains("updated")>
                    <h2 style="color: #1a1a1a; font-size: 28px; font-weight: 700; margin-bottom: 16px; letter-spacing: -0.5px;">Email Verified, Bro!</h2>
                    <p style="color: #4a4a4a; font-size: 16px; line-height: 1.5; margin: 0 0 24px;">Redirecting you to sign in...</p>
                    <script>
                        window.location.href = "${pageRedirectUri! 'https://booking.medhabib.me/signin'}";
                    </script>
                <#elseif requiredActions?has_content && requiredActions?seq_contains("UPDATE_PASSWORD")>
                    <h2 style="color: #1a1a1a; font-size: 28px; font-weight: 700; margin-bottom: 16px; letter-spacing: -0.5px;">Preparing Password Reset...</h2>
                    <p style="color: #4a4a4a; font-size: 16px; line-height: 1.5; margin: 0 0 24px;">Redirecting you to reset your password...</p>
                    <#if actionUri?has_content>
                        <script>
                            window.location.href = "${actionUri}";
                        </script>
                    <#else>
                        <p style="color: #4a4a4a; font-size: 16px; line-height: 1.5; margin: 0 0 24px;">Password reset link is invalid. Please request a new reset link.</p>
                        <p>
                            <a href="https://booking.medhabib.me/signin" style="display: inline-block; background-color: #ff4500; color: #ffffff; font-size: 16px; font-weight: 600; padding: 12px 24px; border-radius: 8px; text-decoration: none; transition: background-color 0.3s ease, transform 0.2s ease;" onmouseover="this.style.backgroundColor='#e03e00'; this.style.transform='scale(1.05)';" onmouseout="this.style.backgroundColor='#ff4500'; this.style.transform='scale(1)';" onmousedown="this.style.transform='scale(0.95)';" onmouseup="this.style.transform='scale(1.05)';">Back to Sign In</a>
                        </p>
                    </#if>
                <#else>
                    <h2 style="color: #1a1a1a; font-size: 28px; font-weight: 700; margin-bottom: 16px; letter-spacing: -0.5px;">Action Required</h2>
                    <p style="color: #4a4a4a; font-size: 16px; line-height: 1.5; margin: 0 0 24px;">${message.summary}<#if requiredActions??><#list requiredActions>: <b><#items as reqActionItem>${msg("requiredAction.${reqActionItem}")}<#sep>, </#items></b></#list><#else></#if></p>
                    <#if skipLink??>
                    <#else>
                        <#if pageRedirectUri?has_content>
                            <p>
                                <a href="${pageRedirectUri}" style="display: inline-block; background-color: #ff4500; color: #ffffff; font-size: 16px; font-weight: 600; padding: 12px 24px; border-radius: 8px; text-decoration: none; transition: background-color 0.3s ease, transform 0.2s ease;" onmouseover="this.style.backgroundColor='#e03e00'; this.style.transform='scale(1.05)';" onmouseout="this.style.backgroundColor='#ff4500'; this.style.transform='scale(1)';" onmousedown="this.style.transform='scale(0.95)';" onmouseup="this.style.transform='scale(1.05)';">${msg("backToApplication")}</a>
                            </p>
                        <#elseif actionUri?has_content>
                            <p>
                                <a href="${actionUri}" style="display: inline-block; background-color: #ff4500; color: #ffffff; font-size: 16px; font-weight: 600; padding: 12px 24px; border-radius: 8px; text-decoration: none; transition: background-color 0.3s ease, transform 0.2s ease;" onmouseover="this.style.backgroundColor='#e03e00'; this.style.transform='scale(1.05)';" onmouseout="this.style.backgroundColor='#ff4500'; this.style.transform='scale(1)';" onmousedown="this.style.transform='scale(0.95)';" onmouseup="this.style.transform='scale(1.05)';">${kcSanitize(msg("proceedWithAction"))?no_esc}</a>
                            </p>
                        <#else>
                            <p>
                                <a href="${properties.logoUrl!'https://booking.medhabib.me/signin'}" style="display: inline-block; background-color: #ff4500; color: #ffffff; font-size: 16px; font-weight: 600; padding: 12px 24px; border-radius: 8px; text-decoration: none; transition: background-color 0.3s ease, transform 0.2s ease;" onmouseover="this.style.backgroundColor='#e03e00'; this.style.transform='scale(1.05)';" onmouseout="this.style.backgroundColor='#ff4500'; this.style.transform='scale(1)';" onmousedown="this.style.transform='scale(0.95)';" onmouseup="this.style.transform='scale(1.05)';">${msg("backToApplication")}</a>
                            </p>
                        </#if>
                    </#if>
                </#if>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>