<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <div class="flex items-center justify-center min-h-screen bg-gradient-to-br from-[#add8e6] to-[#87ceeb]" style="font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;">
            <div class="w-full max-w-md p-8 bg-white rounded-xl shadow-xl text-center mx-5 transition-transform duration-300 hover:-translate-y-1">
                <img src="${url.resourcesPath}/img/favicon.png" alt="Booking Platform Logo" class="w-24 mx-auto mb-5">
                <h2 class="text-3xl font-bold text-gray-900 mb-4 tracking-tight">Time to Reset That Password, Bro!</h2>
                <p class="text-gray-500 text-base mb-6 leading-relaxed">For your security, please set a new password below.</p>

                <form id="kc-passwd-update-form" class="space-y-6" action="${url.loginResetCredentialsUrl}" method="post">
                    <div>
                        <label for="password-new" class="block text-sm font-medium text-gray-700 text-left">${msg("passwordNew")}</label>
                        <div class="relative mt-1">
                            <input type="password" id="password-new" name="password-new" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-[#ff4500] focus:border-[#ff4500] transition-colors duration-200" 
                                   autofocus autocomplete="new-password"
                                   aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>">
                            <button type="button" class="absolute inset-y-0 right-0 flex items-center pr-3" aria-label="${msg('showPassword')}"
                                    aria-controls="password-new" data-password-toggle
                                    data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" 
                                    data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                    data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                                <i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i>
                            </button>
                        </div>
                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="text-red-600 text-sm mt-1 block text-left" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div>
                        <label for="password-confirm" class="block text-sm font-medium text-gray-700 text-left">${msg("passwordConfirm")}</label>
                        <div class="relative mt-1">
                            <input type="password" id="password-confirm" name="password-confirm" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-[#ff4500] focus:border-[#ff4500] transition-colors duration-200" 
                                   autocomplete="new-password"
                                   aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>">
                            <button type="button" class="absolute inset-y-0 right-0 flex items-center pr-3" aria-label="${msg('showPassword')}"
                                    aria-controls="password-confirm" data-password-toggle
                                    data-icon-show="${properties.kcFormPasswordVisibilityIconShow!}" 
                                    data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!}"
                                    data-label-show="${msg('showPassword')}" data-label-hide="${msg('hidePassword')}">
                                <i class="${properties.kcFormPasswordVisibilityIconShow!}" aria-hidden="true"></i>
                            </button>
                        </div>
                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="text-red-600 text-sm mt-1 block text-left" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div>
                        <@passwordCommons.logoutOtherSessions/>
                        <div class="flex justify-center space-x-4">
                            <#if isAppInitiatedAction??>
                                <button type="submit" class="px-6 py-2 bg-[#ff4500] text-white font-semibold rounded-lg hover:bg-[#e03e00] focus:outline-none focus:ring-2 focus:ring-[#ff4500] transition-transform duration-200 hover:scale-105 active:scale-95">
                                    ${msg("doSubmit")}
                                </button>
                                <button type="submit" name="cancel-aia" value="true" class="px-6 py-2 bg-gray-300 text-gray-800 font-semibold rounded-lg hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-500 transition-transform duration-200 hover:scale-105 active:scale-95">
                                    ${msg("doCancel")}
                                </button>
                            <#else>
                                <button type="submit" class="w-full px-6 py-2 bg-[#ff4500] text-white font-semibold rounded-lg hover:bg-[#e03e00] focus:outline-none focus:ring-2 focus:ring-[#ff4500] transition-transform duration-200 hover:scale-105 active:scale-95">
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