<#import "template.ftl" as layout>
<#import "password-commons.ftl" as passwordCommons>
<@layout.registrationLayout displayMessage=true; section>
    <#if section = "pageTitle">
        <#if requiredActions?has_content && requiredActions?seq_contains("UPDATE_PASSWORD")>
            Update Your BookingPlatform Password
        <#elseif requiredActions?has_content && requiredActions?seq_contains("VERIFY_EMAIL")>
            Verify Your BookingPlatform Email
        <#elseif message.summary?contains("updated")>
            Password Updated - BookingPlatform
        <#else>
            ${msg("loginInfoMessage")}
        </#if>
    <#elseif section = "form">
        <div id="kc-info-message" class="no-form-wrapper">
            <#if requiredActions?has_content && requiredActions?seq_contains("UPDATE_PASSWORD")>
                <div class="verify-email-container">
                    <img src="${url.resourcesPath}/img/favicon.png" alt="Booking Platform Logo" class="logo">
                    <h2>Yo, Set a New Password, Bro!</h2>
                    <p>Enter and confirm your new password below to secure your BookingPlatform account.</p>
                    <#if message?has_content && message.type = 'error'>
                        <div class="alert alert-error">${kcSanitize(message.summary)?no_esc}</div>
                    </#if>
                    <#-- Debug output -->
                    <div class="debug-info">
                        <p>Debug: Form action = /realms/bookingPlatform/login-actions/execute-actions</p>
                        <p>Debug: key = ${key!''}</p>
                        <p>Debug: stateChecker = ${stateChecker!''}</p>
                        <p>Debug: clientId = ${clientId!'spring-boot-client'}</p>
                        <p>Debug: redirectUri = ${pageRedirectUri!'https://booking.medhabib.me/signin'}</p>
                        <p>Debug: queryParams = <#if url.queryString?has_content>${url.queryString}<#else>none</#if></p>
                        <p>Debug: Current URL = ${url.currentUri}</p>
                    </div>
                    <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="/realms/bookingPlatform/login-actions/execute-actions" method="post" onsubmit="return validateForm()">
                        <input type="hidden" name="key" id="key" value="${key!''}" />
                        <input type="hidden" name="stateChecker" id="stateChecker" value="${stateChecker!''}" />
                        <input type="hidden" name="redirect_uri" value="${pageRedirectUri!'https://booking.medhabib.me/signin'}" />
                        <input type="hidden" name="client_id" value="${clientId!'spring-boot-client'}" />
                        <div class="${properties.kcFormGroupClass!} form-group">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password-new" class="${properties.kcLabelClass!}">New Password</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <div class="input-group" dir="ltr">
                                    <input type="password" id="password-new" name="password-new" class="form-input" autofocus required minlength="6" autocomplete="new-password" />
                                    <button class="password-toggle" type="button" aria-label="Show password" aria-controls="password-new" data-password-toggle data-icon-show="fa-eye" data-icon-hide="fa-eye-slash" data-label-show="Show Password" data-label-hide="Hide Password">
                                        <i class="fa-eye" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="${properties.kcFormGroupClass!} form-group">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password-confirm" class="${properties.kcLabelClass!}">Confirm Password</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <div class="input-group" dir="ltr">
                                    <input type="password" id="password-confirm" name="password-confirm" class="form-input" required autocomplete="new-password" />
                                    <button class="password-toggle" type="button" aria-label="Show password" aria-controls="password-confirm" data-password-toggle data-icon-show="fa-eye" data-icon-hide="fa-eye-slash" data-label-show="Show Password" data-label-hide="Hide Password">
                                        <i class="fa-eye" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <@passwordCommons.logoutOtherSessions/>
                        <div class="${properties.kcFormGroupClass!} form-group">
                            <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                <input class="btn btn-primary" type="submit" value="Update Password" />
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
                            // Set stateChecker if available
                            const stateChecker = urlParams.get('stateChecker') || '';
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
            <#elseif requiredActions?has_content && requiredActions?seq_contains("VERIFY_EMAIL")>
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
                    <p class="instruction">Need help? Contact us at <a href="mailto:support@booking.medhabib.me">support@booking.medhabib.me</a>.</p>
                </div>
            <#elseif message.summary?contains("updated")>
                <div class="verify-email-container">
                    <img src="${url.resourcesPath}/img/favicon.png" alt="Booking Platform Logo" class="logo">
                    <h2>Password Updated, Bro!</h2>
                    <p>Redirecting you to sign in...</p>
                    <script>
                        setTimeout(() => {
                            window.location.href = "${pageRedirectUri!'https://booking.medhabib.me/signin'}";
                        }, 2000);
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
                        <p><a href="${properties.logoUrl!'https://booking.medhabib.me'}" class="btn btn-primary" role="button">${msg("backToApplication")}</a></p>
                    </#if>
                </#if>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>