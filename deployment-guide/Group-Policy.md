# 08 – Group Policy Configuration

## Objective

The objective of this phase was to implement centralized security policies using Group Policy Objects (GPOs) to enforce password requirements and account security across the TechSolutions Active Directory domain.

By applying Group Policy at the domain level, all domain users and computers receive consistent security settings without requiring manual configuration on individual workstations.

---

# Background

Managing security settings individually on every computer is inefficient and prone to inconsistencies. Group Policy provides a centralized method for applying security configurations to all domain-joined computers and users.

For this project, a domain-wide security policy was implemented to improve password security and reduce the risk of unauthorized access.

The following security policies were configured:

* Password Complexity Requirements
* Minimum Password Length
* Maximum Password Age
* Account Lockout Threshold
* Account Lockout Duration
* Reset Account Lockout Counter

---

# Prerequisites

Before configuring Group Policy, the following tasks had already been completed:

* Windows Server 2022 installed
* Active Directory Domain Services deployed
* Domain Controller operational
* DNS configured
* DHCP configured
* Client computers joined to the domain
* User accounts created
* Security groups configured

---

# Group Policy Configuration

## Step 1 – Open Group Policy Management

On **SERVER-DC01**, opened:

**Server Manager → Tools → Group Policy Management**

Expanded:

```text
Forest: techsolutions.local
    └── Domains
        └── techsolutions.local
```

The **Default Domain Policy** was selected for configuration.

---

## Step 2 – Configure Password Policy

Navigated to:

```text
Computer Configuration
└── Policies
    └── Windows Settings
        └── Security Settings
            └── Account Policies
                └── Password Policy
```

The following settings were configured:

| Policy                                      | Configuration          |
| ------------------------------------------- | ---------------------- |
| Enforce Password History                    | 5 passwords remembered |
| Maximum Password Age                        | 90 days                |
| Minimum Password Age                        | 1 day                  |
| Minimum Password Length                     | 8 characters           |
| Password Must Meet Complexity Requirements  | Enabled                |
| Store Passwords Using Reversible Encryption | Disabled               |

These settings help enforce strong password practices throughout the domain.

---

## Step 3 – Configure Account Lockout Policy

Navigated to:

```text
Computer Configuration
└── Policies
    └── Windows Settings
        └── Security Settings
            └── Account Policies
                └── Account Lockout Policy
```

Configured the following settings:

| Policy                              | Configuration            |
| ----------------------------------- | ------------------------ |
| Account Lockout Threshold           | 5 invalid logon attempts |
| Account Lockout Duration            | 15 minutes               |
| Reset Account Lockout Counter After | 15 minutes               |

These settings help protect user accounts from password guessing and brute-force attacks.

---

## Step 4 – Apply the Policy

The updated Group Policy settings were automatically linked to the **techsolutions.local** domain.

To apply the changes immediately, Group Policy was refreshed.

Example command:

```powershell
gpupdate /force
```

This ensured that the latest policy settings were applied without waiting for the normal refresh interval.

---

## Step 5 – Verify Group Policy Application

After updating the policy, client computers were used to verify that the new settings were applied successfully.

Verification included:

* Logging in with a domain account
* Confirming password requirements
* Testing account lockout after repeated failed logon attempts
* Confirming successful authentication after account recovery

To confirm that policies had been applied, the following command was used:

```powershell
gpresult /r
```

The output confirmed that the appropriate Group Policy Objects had been applied to the client computer.

---

# Validation Checklist

The Group Policy deployment was considered successful after confirming:

* Group Policy Management Console accessible
* Password Policy configured
* Account Lockout Policy configured
* Policy linked to the domain
* Group Policy updated successfully
* Client computers received the policy
* Password complexity enforced
* Account lockout functioning as expected

---

# Recommended Screenshots

Capture the following screenshots:

### Group Policy Management

* Group Policy Management Console
* Default Domain Policy

### Password Policy

* Password Policy settings

### Account Lockout Policy

* Account Lockout settings

### Client Verification

* `gpupdate /force`
* `gpresult /r`

Store screenshots in:

```text
screenshots/group-policy/
```

Suggested filenames:

```text
group-policy-management.png
default-domain-policy.png
password-policy-settings.png
account-lockout-policy.png
gpupdate-force.png
gpresult-report.png
```

---

# Common Issues and Resolution

## Issue

The updated policy did not apply to a client computer.

### Cause

The client had not refreshed Group Policy.

### Resolution

Ran:

```powershell
gpupdate /force
```

and restarted the client if required.

---

## Issue

Password complexity requirements were not enforced.

### Cause

The password policy was configured in the wrong Group Policy Object or the policy had not yet replicated.

### Resolution

Verified that the settings were configured in the **Default Domain Policy** and confirmed successful policy application using:

```powershell
gpresult /r
```

---

## Issue

Account lockout did not occur after multiple failed sign-in attempts.

### Cause

The Account Lockout Policy was not configured correctly or had not yet been applied.

### Resolution

Reviewed the policy settings, forced a Group Policy update, and repeated the test.

---

# Skills Demonstrated

* Group Policy Administration
* Windows Security Management
* Password Policy Configuration
* Account Lockout Configuration
* Group Policy Troubleshooting
* Domain Administration
* Windows Server Administration
* Enterprise Security

---

# Lessons Learned

Implementing Group Policy demonstrated how security settings can be managed centrally across an enterprise environment. Enforcing password complexity, expiration, and account lockout policies improved the overall security posture of the TechSolutions domain while reducing administrative overhead and ensuring consistent configuration across all domain-joined computers.

---

# References

* Microsoft Learn – Group Policy Overview
* Microsoft Learn – Group Policy Management Console (GPMC)
* Microsoft Learn – Password and Account Lockout Policies
* Microsoft Learn – Security Settings Extension for Group Policy
