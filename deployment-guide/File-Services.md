# 07 – File Server Configuration & Access Control

## Objective

The objective of this phase was to configure a centralized file server that provides secure departmental file sharing using Active Directory Security Groups, Share Permissions, and NTFS Permissions.

The implementation followed the principle of least privilege by ensuring users could only access resources required for their job responsibilities.

---

# Background

TechSolutions required a centralized location where each department could securely store and access company files.

Instead of assigning permissions directly to individual users, Security Groups were used. This approach simplifies administration and aligns with enterprise best practices.

The following departments required dedicated shared folders:

* IT
* Human Resources (HR)
* Finance

---

# Prerequisites

Before configuring the file server, the following tasks had been completed:

* Windows Server 2022 installed
* Active Directory Domain Services deployed
* DNS configured
* DHCP configured
* Domain Controller operational
* Client computers joined to the domain
* Departmental Security Groups created
* Departmental user accounts created

---

# Folder Structure

A parent folder was created on the Domain Controller to host all departmental shares.

```text
C:\
└── CompanyShares
    ├── IT
    ├── HR
    └── Finance
```

Each department received its own dedicated folder.

---

# Share Configuration

Each departmental folder was shared using descriptive share names.

| Folder  | Share Name |
| ------- | ---------- |
| IT      | IT         |
| HR      | HR         |
| Finance | Finance    |

The shares were made available across the network so authenticated domain users could access them according to their assigned permissions.

---

# Configure Share Permissions

Share permissions were configured to allow access through Active Directory Security Groups.

| Share   | Security Group |
| ------- | -------------- |
| IT      | IT-Team        |
| HR      | HR-Team        |
| Finance | Finance-Team   |

The **Everyone** group was removed from each share to prevent unrestricted access.

---

# Configure NTFS Permissions

NTFS permissions were configured on each departmental folder.

| Folder  | Assigned Group | Permission |
| ------- | -------------- | ---------- |
| IT      | IT-Team        | Modify     |
| HR      | HR-Team        | Modify     |
| Finance | Finance-Team   | Modify     |

Administrative accounts retained Full Control to support ongoing management.

Using both Share Permissions and NTFS Permissions ensured that access was controlled locally and across the network.

---

# Permission Verification

Domain users were assigned to their respective Security Groups and tested from domain-joined client computers.

Verification included:

### IT Department

User:

* sarah.it

Expected Result:

* Access granted to the IT share
* Access denied to HR and Finance shares

---

### Human Resources

User:

* mary.hr

Expected Result:

* Access granted to the HR share
* Access denied to IT and Finance shares

---

### Finance

User:

* david.finance

Expected Result:

* Access granted to the Finance share
* Access denied to IT and HR shares

This confirmed that Security Group membership correctly controlled access to shared resources.

---

# Validation Checklist

The file server configuration was considered successful after confirming:

* CompanyShares folder created
* Departmental folders created
* Shares published successfully
* Share Permissions configured
* NTFS Permissions configured
* Security Groups assigned
* Users could access only authorized folders
* Unauthorized access was denied

---

# Recommended Screenshots

Capture the following screenshots.

### File Explorer

* CompanyShares folder
* Department folders

### Share Properties

* Sharing tab
* Advanced Sharing

### Security

* NTFS Security permissions

### Client Testing

* Successful access
* Access denied message

Store screenshots in:

```text
screenshots/file-sharing/
```

Suggested filenames:

```text
companyshares-folder.png
department-folders.png
advanced-sharing.png
ntfs-permissions.png
successful-share-access.png
access-denied.png
```

---

# Common Issues and Resolution

## Issue

A user could see the shared folder but could not open it.

### Cause

Share permissions allowed access, but NTFS permissions did not.

### Resolution

Verified both Share Permissions and NTFS Permissions and ensured the appropriate Security Group had the required access.

---

## Issue

Users from another department could access restricted folders.

### Cause

Permissions had been assigned directly to users or to the **Everyone** group.

### Resolution

Removed unnecessary permissions and assigned access only through departmental Security Groups.

---

## Issue

Changes to group membership did not take effect immediately.

### Resolution

The user signed out and back in (or refreshed the Kerberos ticket) so that the updated group membership was applied.

---

# Skills Demonstrated

* Windows File Server Administration
* Shared Folder Configuration
* NTFS Permissions
* Share Permissions
* Security Group Management
* Access Control
* Active Directory Integration
* Windows Security Administration

---

# Lessons Learned

This phase demonstrated the importance of combining Share Permissions with NTFS Permissions to implement secure file access. Using Active Directory Security Groups instead of assigning permissions directly to users improved scalability, simplified administration, and aligned with enterprise security best practices.

---

# References

* Microsoft Learn – Shared Folders in Windows Server
* Microsoft Learn – NTFS Permissions
* Microsoft Learn – Configure Shared Folder Permissions
* Microsoft Learn – Access-Based Security in Windows Server

