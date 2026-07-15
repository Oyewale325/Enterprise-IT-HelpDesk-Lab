# 03 – Active Directory Domain Services (AD DS) Deployment

## Objective

The objective of this phase was to deploy Active Directory Domain Services (AD DS), promote the Windows Server to a Domain Controller, and establish the **techsolutions.local** Active Directory domain.

This deployment provides centralized authentication, authorization, and management of users, computers, and security policies across the organization's network.

---

# Background

TechSolutions required a centralized identity management solution to eliminate the need for managing local user accounts on individual computers.

By deploying Active Directory Domain Services, administrators can:

* Centrally manage user accounts
* Organize resources using Organizational Units (OUs)
* Apply Group Policies
* Authenticate users and computers
* Control access to shared resources

The Windows Server **SERVER-DC01** was promoted to become the first Domain Controller in a new Active Directory forest.

---

# Prerequisites

The following tasks were completed before installing Active Directory:

* Windows Server 2022 installed
* Server renamed to **SERVER-DC01**
* Static IP address configured (`192.168.10.10`)
* Network connectivity verified
* Server Manager operational

---

# Deployment Procedure

## Step 1 – Install the Active Directory Domain Services Role

Using **Server Manager**, the **Add Roles and Features Wizard** was used to install:

* Active Directory Domain Services (AD DS)

The installation also included the required management tools.

No restart was required immediately after the role installation.

---

## Step 2 – Promote the Server to a Domain Controller

After the AD DS role was installed, the server was promoted to a Domain Controller.

The deployment configuration included:

| Setting                     | Value                   |
| --------------------------- | ----------------------- |
| Deployment Operation        | Add a new forest        |
| Root Domain Name            | techsolutions.local     |
| Forest Functional Level     | Windows Server 2022     |
| Domain Functional Level     | Windows Server 2022     |
| DNS Server                  | Installed Automatically |
| Global Catalog              | Enabled                 |
| Read Only Domain Controller | No                      |

A Directory Services Restore Mode (DSRM) password was also configured during the promotion process.

After the promotion completed successfully, the server restarted automatically.

---

## Step 3 – Verify Active Directory Installation

After restarting:

* The server booted successfully.
* The domain **techsolutions.local** was available.
* Active Directory administrative tools were installed.
* The server was functioning as the organization's Domain Controller.

The following administrative consoles became available:

* Active Directory Users and Computers
* Active Directory Administrative Center
* Active Directory Domains and Trusts
* Active Directory Sites and Services

---

## Step 4 – Verify DNS Integration

During promotion, the DNS Server role was installed automatically.

Verification included:

* Forward Lookup Zone created for **techsolutions.local**
* DNS service running
* Domain name resolving correctly

DNS functionality will be configured in greater detail in the next deployment phase.

---

## Step 5 – Create Organizational Units (OUs)

To organize directory objects logically, the following Organizational Units were created:

| Organizational Unit |
| ------------------- |
| TechSolutions       |
| IT                  |
| HR                  |
| Finance             |
| Users               |
| Computers           |

Using OUs improves administrative delegation and simplifies the application of Group Policies.

---

## Step 6 – Create Security Groups

Departmental security groups were created to simplify permission management.

| Group        |
| ------------ |
| IT-Team      |
| HR-Team      |
| Finance-Team |

These groups were later used to assign permissions to shared folders and other organizational resources.

---

## Step 7 – Create User Accounts

Sample employee accounts were created for testing and administration.

| Username      | Department |
| ------------- | ---------- |
| john.admin    | IT         |
| sarah.it      | IT         |
| mary.hr       | HR         |
| david.finance | Finance    |

These accounts were used throughout the project for authentication, Group Policy testing, file access, and troubleshooting scenarios.

---

# Validation Checklist

The deployment was validated by confirming:

* Active Directory Domain Services role installed
* Server successfully promoted to Domain Controller
* New forest **techsolutions.local** created
* DNS installed automatically
* Active Directory management tools available
* Organizational Units created
* Security Groups created
* User accounts created successfully

---

# Recommended Screenshots

Capture the following screenshots:

### Server Manager

* AD DS installation completed

### Active Directory Users and Computers

* Domain structure
* Organizational Units
* User accounts
* Security Groups

### Active Directory Administrative Center

* Domain overview

Store screenshots in:

```text
screenshots/active-directory/
```

Recommended filenames:

```text
ad-ds-role-installed.png
domain-controller-overview.png
organizational-units.png
security-groups.png
active-directory-users.png
active-directory-administrative-center.png
```

---

# Common Issues and Resolution

## Issue

The option to promote the server to a Domain Controller was unavailable.

### Resolution

Confirmed that the AD DS role installation had completed successfully before attempting promotion.

---

## Issue

Active Directory tools were missing.

### Resolution

Verified that the management tools were included during the role installation and reinstalled them if necessary.

---

## Issue

Clients were unable to locate the domain.

### Resolution

Verified that the Domain Controller's IP address was configured as the preferred DNS server and confirmed that the DNS service was running.

---

# Skills Demonstrated

* Active Directory Domain Services
* Domain Controller Deployment
* Forest and Domain Creation
* Organizational Unit Management
* Security Group Administration
* User Account Administration
* Identity and Access Management
* Windows Server Administration

---

# Lessons Learned

Deploying Active Directory established the foundation for centralized identity management throughout the organization. Creating a logical Organizational Unit structure and using Security Groups for access management demonstrated best practices that improve scalability, simplify administration, and enhance security in enterprise environments.

---

# References

* Microsoft Learn – Active Directory Domain Services Overview
* Microsoft Learn – Install a New Active Directory Forest
* Microsoft Learn – Active Directory Administrative Center
* Microsoft Learn – Organizational Units in Active Directory

