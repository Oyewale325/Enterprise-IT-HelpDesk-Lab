# Group Policy Account Lockout and Password Reset Troubleshooting

## Issue

The Account Lockout Policy was configured through Group Policy to lock a user account after multiple failed sign-in attempts. During testing, the account of **mary.hr** became locked after exceeding the configured threshold.

## Symptoms

* User could not sign in using the correct password.
* Windows displayed the message:

> "The referenced account is currently locked out and may not be logged on."

* The account remained inaccessible until administrative intervention.

## Root Cause

The configured Group Policy Account Lockout Policy successfully locked the account after repeated failed authentication attempts.

This behavior confirmed that the security policy was functioning as intended.

## Troubleshooting Process

1. Verified that the Default Domain Policy was applied to the client computer.
2. Confirmed the account lockout through testing.
3. Executed the PowerShell Password Reset script.
4. Automatically:

   * Reset the user's password.
   * Unlocked the Active Directory account.
   * Disabled the **Password Never Expires** setting (if enabled).
   * Forced the user to change the password at the next logon.
5. Provided the temporary password to the user.

## Resolution

The account was successfully unlocked using PowerShell automation.

The user logged in using the temporary password and was required to create a new secure password during the first sign-in.

## Verification

Verification included:

* Successful execution of the PowerShell script.
* User account unlocked.
* Temporary password generated.
* Password change required at next logon.
* User successfully authenticated after changing the password.

## Skills Demonstrated

* Active Directory Administration
* Group Policy Management
* Account Lockout Recovery
* Password Management
* PowerShell Automation
* Help Desk Support

