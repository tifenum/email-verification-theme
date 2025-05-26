<#if requiredActions?seq_contains("UPDATE_PASSWORD")>
Yo, Reset Your Password, Bro!

We received a request to reset your password for your BookingPlatform account. Click the link below to set a new password. This link expires in 15 minutes, so act fast!

${link}

If you didn’t request a password reset, just ignore this email, and your account will stay secure.

Need help? Contact us at support@booking.medhabib.me.
<#else>
Yo, Verify Your Email, Bro!

We sent you this email to verify your BookingPlatform account. Click the link below to confirm your email address. This link expires in 15 minutes, so don’t wait!

${link}

If you didn’t request this, just ignore this email, and nothing will change.

Need help? Contact us at support@booking.medhabib.me.
</#if>