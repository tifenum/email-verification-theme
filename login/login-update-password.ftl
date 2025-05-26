<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        Update Your BookingPlatform Password
    <#elseif section = "form">
        <div class="verify-email-container">
            <img src="${url.resourcesPath}/img/favicon.png" alt="Booking Platform Logo" class="logo">
            <h2>Yo, Set a New Password, Bro!</h2>
            <p>Enter and confirm your new password below to secure your BookingPlatform account.</p>
            <#if messagesPerField.existsError('password','password-confirm')>
                <div class="alert alert-error">
                    ${kcSanitize(messagesPerField.get('password')!messagesPerField.get('password-confirm'))?no_esc}
                </div>
            </#if>
            <div class="debug-info">
                <p>Debug: Form action = /realms/bookingPlatform/login-actions/execute-actions</p>
                <p>Debug: key = ${key!''}</p>
                <p>Debug: stateChecker = ${stateChecker!''}</p>
                <p>Debug: clientId = ${clientId!'spring-boot-client'}</p>
                <p>Debug: redirectUri = ${pageRedirectUri!'https://booking.medhabib.me/signin'}</p>
                <p>Debug: queryParams = <#if url.queryString?has_content>${url.queryString}<#else>none</#if></p>
            </div>
            <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="/realms/bookingPlatform/login-actions/execute-actions" method="post" onsubmit="return validateForm()">
                <input type="hidden" name="key" id="key" value="${key!''}" />
                <input type="hidden" name="stateChecker" id="stateChecker" value="${stateChecker!''}" />
                <input type="hidden" name="redirect_uri" value="${pageRedirectUri!'https://booking.medhabib.me/signin'}" />
                <input type="hidden" name="client_id" value="${clientId!'spring-boot-client'}" />
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-new" class="${properties.kcLabelClass!}">New Password</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="${properties.kcInputGroup!}" dir="ltr">
                            <input type="password" id="password-new" name="password-new" class="${properties.kcInputClass!}" autofocus autocomplete="new-password" required minlength="6" aria-invalid="<#if messagesPerField.existsError('password')>true</#if>" />
                            <button class="${properties.kcFormPasswordVisibilityButtonClass!}" type="button" aria-label="Show password" aria-controls="password-new" data-password-toggle data-icon-show="fa-eye" data-icon-hide="fa-eye-slash" data-label-show="Show Password" data-label-hide="Hide Password">
                                <i class="fa-eye" aria-hidden="true"></i>
                            </button>
                        </div>
                        <#if messagesPerField.existsError('password')>
                            <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password-confirm" class="${properties.kcLabelClass!}">Confirm Password</label>
                    </div>
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="${properties.kcInputGroup!}" dir="ltr">
                            <input type="password" id="password-confirm" name="password-confirm" class="${properties.kcInputClass!}" autocomplete="new-password" required aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" />
                            <button class="${properties.kcFormPasswordVisibilityButtonClass!}" type="button" aria-label="Show password" aria-controls="password-confirm" data-password-toggle data-icon-show="fa-eye" data-icon-hide="fa-eye-slash" data-label-show="Show Password" data-label-hide="Hide Password">
                                <i class="fa-eye" aria-hidden="true"></i>
                            </button>
                        </div>
                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                            </span>
                        </#if>
                    </div>
                </div>
                <@passwordCommons.logoutOtherSessions/>
                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                        <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="Update Password" />
                    </div>
                </div>
            </form>
            <p class="instruction">
                Password must be at least 6 characters long. Need help? Contact us at <a href="mailto:support@booking.medhabib.me">support@booking.medhabib.me</a>.
            </p>
            <script>
                function validateForm() {
                    const newPassword = document.getElementById('password-new').value;
                    const confirmPassword = document.getElementById('password-confirm').value;
                    if (newPassword !== confirmPassword) {
                        alert('Passwords do not match!');
                        return false;
                    }
                    const keyInput = document.getElementById('key');
                    const stateCheckerInput = document.getElementById('stateChecker');
                    const urlParams = new URLSearchParams(window.location.search);
                    const key = urlParams.get('key');
                    if (key) {
                        keyInput.value = key;
                    } else if (!keyInput.value) {
                        alert('Missing action token key!');
                        return false;
                    }
                    const stateChecker = urlParams.get('stateChecker') || '${stateChecker!''}';
                    stateCheckerInput.value = stateChecker;
                    return true;
                }

                document.querySelectorAll('[data-password-toggle]').forEach(button => {
                    button.addEventListener('click', () => {
                        const inputId = button.getAttribute('aria-controls');
                        const input = document.getElementById(inputId);
                        const isPassword = input.type === 'password';
                        input.type = isPassword ? 'text' : 'password';
                        button.setAttribute('aria-label', isPassword ? 'Hide password' : 'Show password');
                        const icon = button.querySelector('i');
                        icon.className = isPassword ? button.dataset.iconHide : button.dataset.iconShow;
                    });
                });
            </script>
        </div>
    </#if>
</@layout.registrationLayout>