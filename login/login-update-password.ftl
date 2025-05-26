<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <div class="flex items-center justify-center min-h-screen bg-gray-100">
            <div class="w-full max-w-md p-8 bg-white rounded-lg shadow-lg">
                <div class="flex justify-center mb-6">
                    <img src="${url.resourcesPath}/img/favicon.png" alt="Booking Platform Logo" class="w-16 h-16">
                </div>
                <h2 class="text-2xl font-bold text-center text-gray-800 mb-4">Time to Reset That Password, Bro!</h2>
                <p class="text-center text-gray-600 mb-6">For your security, please set a new password below.</p>

                <form id="kc-passwd-update-form" class="space-y-6" action="${url.loginResetCredentialsUrl}" method="post">
                    <div>
                        <label for="password-new" class="block text-sm font-medium text-gray-700">${msg("passwordNew")}</label>
                        <div class="relative mt-1">
                            <input type="password" id="password-new" name="password-new" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500" 
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
                            <span id="input-error-password" class="text-red-600 text-sm mt-1" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div>
                        <label for="password-confirm" class="block text-sm font-medium text-gray-700">${msg("passwordConfirm")}</label>
                        <div class="relative mt-1">
                            <input type="password" id="password-confirm" name="password-confirm" class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-blue-500 focus:border-blue-500" 
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
                            <span id="input-error-password-confirm" class="text-red-600 text-sm mt-1" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <div>
                        <@passwordCommons.logoutOtherSessions/>
                        <div class="flex justify-center space-x-4">
                            <#if isAppInitiatedAction??>
                                <button type="submit" class="px-6 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">
                                    ${msg("doSubmit")}
                                </button>
                                <button type="submit" name="cancel-aia" value="true" class="px-6 py-2 bg-gray-300 text-gray-800 rounded-md hover:bg-gray-400 focus:outline-none focus:ring-2 focus:ring-gray-500">
                                    ${msg("doCancel")}
                                </button>
                            <#else>
                                <button type="submit" class="w-full px-6 py-2 bg-blue-600 text-white rounded-md hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500">
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