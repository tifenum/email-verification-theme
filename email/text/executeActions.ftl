<#if requiredActions?seq_contains("UPDATE_PASSWORD")>
Reset Your Password

We have received a request to reset the password for your BookingPlatform account. Please click the link below to set a new password. This link will expire in 15 minutes.

${link}

If you did not request a password reset, please ignore this email, and your account will remain secure.

For assistance, please contact us at support@booking.medhabib.me.
<#else>
Verify Your Email Address

This email was sent to verify your BookingPlatform account. Please click the link below to confirm your email address. This link will expire in 15 minutes.

${link}

If you did not request this verification, please ignore this email, and no changes will be made to your account.

For assistance, please contact us at support@booking.medhabib.me.
</#if>