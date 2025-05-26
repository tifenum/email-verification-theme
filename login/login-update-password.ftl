<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        <!-- Intentionally empty to skip default title -->
    <#elseif section = "form">
        <style>
            .alert-warning { display: none !important; }
            #kc-page-title { display: none !important; }
        </style>
        <div style="background: linear-gradient(135deg, #add8e6 0%, #87ceeb 100%); font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; margin: 0; min-height: 100vh; display: flex; justify-content: center; align-items: center;">
            <div style="background: #ffffff; border-radius: 12px; box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15); padding: 32px; max-width: 500px; width: 90%; text-align: center; margin: 20px auto; transition: transform 0.3s ease;" onmouseover="this.style.transform='translateY(-5px)'" onmouseout="this.style.transform='translateY(0)'">
                <img src="${url.resourcesPath}/img/favicon.png" alt="Booking Platform Logo" style="max-width: 100px; margin: 0 auto 20px; display: block;">
                <h2 style="color: #1a1a1a; font-size: 28px; font-weight: 700; margin-bottom: 16px; letter-spacing: -0.5px;">Time to Reset That Password, Bro!</h2>
                <p style="color: #4a4a4a; font-size: 16px; line-height: 1.5; margin: 0 0 24px;">For your security, please set a new password below.</p>

                <form id="kc-passwd-update-form" style="display: flex; flex-direction: column; gap: 20px;" action="${url.loginResetCredentialsUrl}" method="post">
                    <div>
                        <label for="password-new" style="display: block; text-align: left; font-size: 14px; font-weight: 500; color: #1a1a1a; margin-bottom: 8px;">${msg("passwordNew")}</label>
                        <div style="position: relative;">
                            <input type="password" id="password-new" name="password-new" style="width: 100%; padding: 12px 16px; border: 1px solid #d1d5db; border-radius: 8px; font-size: 16px; outline: none; transition: border-color 0.2s ease, box-shadow 0.2s ease; box-shadow: 0 1px 3px rgba(0,0,0,0.1);"
                                   autofocus autocomplete="new-password"
                                   aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                   onfocus="this.style.borderColor='#ff4500'; this.style.boxShadow='0 0 0 3px rgba(255,69,0,0.1);'" 
                                   onblur="this.style.borderColor='#d1d5db'; this.style.boxShadow='0 1px 3px rgba(0,0,0,0.1);'">
                            <button type="button" style="position: absolute; top: 50%; right: 16px; transform: translateY(-50%); background: none; border: none; cursor: pointer; color: #4a4a4a;" 
                                    aria-label="${msg('showPassword')}" aria-controls="password-new" data-password-toggle
                                    data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" 
                                    data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                    data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                                <i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i>
                            </button>
                        </div>
                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" style="color: #dc2626; font-size: 12px; margin-top: 8px; display: block; text-align: left; background: #fef2f2; padding: 4px 8px; border-radius: 4px;" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div>
                        <label for="password-confirm" style="display: block; text-align: left; font-size: 14px; font-weight: 500; color: #1a1a1a; margin-bottom: 8px;">${msg("passwordConfirm")}</label>
                        <div style="position: relative;">
                            <input type="password" id="password-confirm" name="password-confirm" style="width: 100%; padding: 12px 16px; border: 1px solid #d1d5db; border-radius: 8px; font-size: 16px; outline: none; transition: border-color 0.2s ease, box-shadow 0.2s ease; box-shadow: 0 1px 3px rgba(0,0,0,0.1);"
                                   autocomplete="new-password"
                                   aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                   onfocus="this.style.borderColor='#ff4500'; this.style.boxShadow='0 0 0 3px rgba(255,69,0,0.1);'" 
                                   onblur="this.style.borderColor='#d1d5db'; this.style.boxShadow='0 1px 3px rgba(0,0,0,0.1);'">
                            <button type="button" style="position: absolute; top: 50%; right: 16px; transform: translateY(-50%); background: none; border: none; cursor: pointer; color: #4a4a4a;" 
                                    aria-label="${msg('showPassword')}" aria-controls="password-confirm" data-password-toggle
                                    data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" 
                                    data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                    data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                                <i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i>
                            </button>
                        </div>
                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" style="color: #dc2626; font-size: 12px; margin-top: 8px; display: block; text-align: left; background: #fef2f2; padding: 4px 8px; border-radius: 4px;" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div>
                        <div id="kc-form-options" style="text-align: left; margin-bottom: 16px;">
                            <div class="checkbox" style="display: flex; align-items: center; gap: 8px;">
                                <input type="checkbox" id="logout-sessions" name="logout-sessions" value="on" checked style="width: 16px; height: 16px; accent-color: #ff4500; cursor: pointer;">
                                <label for="logout-sessions" style="font-size: 14px; color: #4a4a4a; cursor: pointer;">Sign out from other devices</label>
                            </div>
                        </div>
                        <div style="display: flex; justify-content: center; gap: 16px; flex-wrap: wrap;">
                            <#if isAppInitiatedAction??>
                                <button type="submit" style="display: inline-block; background-color: #ff4500; color: #ffffff; font-size: 16px; font-weight: 600; padding: 12px 24px; border-radius: 8px; border: none; cursor: pointer; transition: background-color 0.3s ease, transform 0.2s ease;"
                                        onmouseover="this.style.backgroundColor='#e03e00'; this.style.transform='scale(1.05)';" 
                                        onmouseout="this.style.backgroundColor='#ff4500'; this.style.transform='scale(1)';" 
                                        onmousedown="this.style.transform='scale(0.95)';" 
                                        onmouseup="this.style.transform='scale(1.05)';">
                                    ${msg("doSubmit")}
                                </button>
                                <button type="submit" name="cancel-aia" value="true" style="display: inline-block; background-color: #d1d5db; color: #1a1a1a; font-size: 16px; font-weight: 600; padding: 12px 24px; border-radius: 8px; border: none; cursor: pointer; transition: background-color 0.3s ease, transform 0.2s ease;"
                                        onmouseover="this.style.backgroundColor='#b3b7c1'; this.style.transform='scale(1.05)';" 
                                        onmouseout="this.style.backgroundColor='#d1d5db'; this.style.transform='scale(1)';" 
                                        onmousedown="this.style.transform='scale(0.95)';" 
                                        onmouseup="this.style.transform='scale(1.05)';">
                                    ${msg("doCancel")}
                                </button>
                            <#else>
                                <button type="submit" style="display: inline-block; width: 100%; background-color: #ff4500; color: #ffffff; font-size: 16px; font-weight: 600; padding: 12px 24px; border-radius: 8px; border: none; cursor: pointer; transition: background-color 0.3s ease, transform 0.2s ease;"
                                        onmouseover="this.style.backgroundColor='#e03e00'; this.style.transform='scale(1.05)';" 
                                        onmouseout="this.style.backgroundColor='#ff4500'; this.style.transform='scale(1)';" 
                                        onmousedown="this.style.transform='scale(0.95)';" 
                                        onmouseup="this.style.transform='scale(1.05)';">
                                    ${msg("doSubmit")}
                                </button>
                            </#if>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
    </#if>
</@layout.registrationLayout>