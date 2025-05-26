<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "pageTitle">
        Error
    <#elseif section = "form">
        <div style="background: linear-gradient(135deg, #add8e6 0%, #87ceeb 100%); font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; margin: 0; min-height: 100vh; display: flex; justify-content: center; align-items: center;">
            <div style="background: #ffffff; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.15); padding: 32px; max-width: 500px; width: 90%; text-align: center; margin: 20px auto;">
                <img src="${url.resourcesPath}/img/favicon.png" alt="Booking Platform Logo" style="max-width: 100px; margin: 0 auto 20px; display: block;">
                <h2 style="color: #1a1a1a; font-size: 28px; font-weight: 700; margin-bottom: 16px; letter-spacing: -0.5px;">Oops, Something Went Wrong, Bro!</h2>
                <p style="color: #4a4a4a; font-size: 16px; line-height: 1.5; margin: 0 0 24px;">${message.summary! 'The page has expired or an error occurred. Please try again or request a new password reset link.'}</p>
                <p>
                    <a href="https://booking.medhabib.me/signin" style="display: inline-block; background-color: #ff4500; color: #ffffff; font-size: 16px; font-weight: 600; padding: 12px 24px; border-radius: 8px; text-decoration: none; transition: background-color 0.3s ease, transform 0.2s ease;" onmouseover="this.style.backgroundColor='#e03e00'; this.style.transform='scale(1.05)';" onmouseout="this.style.backgroundColor='#ff4500'; this.style.transform='scale(1)';" onmousedown="this.style.transform='scale(0.95)';" onmouseup="this.style.transform='scale(1.05)';">Back to Sign In</a>
                </p>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>