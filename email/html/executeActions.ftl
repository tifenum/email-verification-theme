<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <#if requiredActions?seq_contains("UPDATE_PASSWORD")>
        <title>Reset Your BookingPlatform Password</title>
    <#else>
        <title>Verify Your BookingPlatform Email</title>
    </#if>
</head>
<body style="margin: 0; padding: 0; background-color: #f4f4f4; font-family: Arial, Helvetica, sans-serif; line-height: 1.5; color: #333333;">
    <table role="presentation" width="100%" cellspacing="0" cellpadding="0" border="0" style="background-color: #f4f4f4; padding: 20px 0;">
        <tr>
            <td align="center">
                <table role="presentation" width="600" cellspacing="0" cellpadding="0" border="0" style="background-color: #ffffff; border-radius: 8px; overflow: hidden;">
                    <!-- Header -->
                    <tr>
                        <td style="background: linear-gradient(135deg, #add8e6, #87ceeb); padding: 20px; text-align: center;">
                            <#if realmName??>
                                <img src="https://ibb.co/C5CDJ2hy" alt="Booking Platform Logo" style="max-width: 150px; height: auto; display: block; margin: 0 auto;">
                            </#if>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 32px; text-align: center;">
                            <#if requiredActions?seq_contains("UPDATE_PASSWORD")>
                                <h1 style="color: #1a1a1a; font-size: 26px; font-weight: bold; margin: 0 0 16px;">Yo, Reset Your Password, Bro!</h1>
                                <p style="font-size: 16px; color: #4a4a4a; margin: 0 0 24px;">We received a request to reset your password for your BookingPlatform account. Hit the button below to set a new password. This link expires in 15 minutes, so act fast!</p>
                                <a href="${link}" style="display: inline-block; background-color: #ff4500; color: #ffffff; font-size: 16px; font-weight: bold; padding: 12px 32px; border-radius: 6px; text-decoration: none;">Reset Password Now</a>
                                <p style="font-size: 14px; color: #4a4a4a; margin: 24px 0 0;">Didn’t request a password reset? No stress—just ignore this email, and your account will stay secure.</p>
                            <#else>
                                <h1 style="color: #1a1a1a; font-size: 26px; font-weight: bold; margin: 0 0 16px;">Yo, Verify Your Email, Bro!</h1>
                                <p style="font-size: 16px; color: #4a4a4a; margin: 0 0 24px;">We sent this email to verify your BookingPlatform account. Hit the button below to confirm your email address. This link expires in 15 minutes, so don’t wait!</p>
                                <a href="${link}" style="display: inline-block; background-color: #ff4500; color: #ffffff; font-size: 16px; font-weight: bold; padding: 12px 32px; border-radius: 6px; text-decoration: none;">Verify Email Now</a>
                                <p style="font-size: 14px; color: #4a4a4a; margin: 24px 0 0;">Didn’t request this? No stress—just ignore this email, and nothing will change.</p>
                            </#if>
                            <p style="font-size: 14px; color: #4a4a4a; margin: 16px 0 0;">Need help? Contact us at <a href="mailto:support@booking.medhabib.me" style="color: #ff4500; text-decoration: underline;">support@booking.medhabib.me</a>.</p>
                        </td>
                    </tr>
                    <!-- Footer -->
                    <tr>
                        <td style="background-color: #f8f8f8; padding: 20px; text-align: center; font-size: 12px; color: #777777;">
                            <p style="margin: 0 0 8px;">© 2025 BookingPlatform. All rights reserved.</p>
                            <p style="margin: 0;">Follow us on 
                                <a href="https://x.com/bookingplatform" style="color: #ff4500; text-decoration: none;">X</a> | 
                                <a href="https://www.instagram.com/bookingplatform" style="color: #ff4500; text-decoration: none;">Instagram</a>
                            </p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>