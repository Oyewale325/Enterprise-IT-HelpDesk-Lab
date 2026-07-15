# Shared Folder Access Troubleshooting

## Issue

A shared folder was created on **SERVER-DC01** to provide centralized file storage for domain users. Access permissions needed to be verified to ensure authorized users could connect successfully.

## Symptoms

Potential issues during testing included:

* Shared folder not visible.
* Access denied message.
* User unable to browse the network share.
* Insufficient permissions.

## Troubleshooting Process

1. Created the shared folder on **SERVER-DC01**.
2. Configured Advanced Sharing.
3. Assigned Share Permissions.
4. Configured NTFS Security Permissions.
5. Verified the client computer was joined to the domain.
6. Confirmed network connectivity to the server.
7. Accessed the shared folder using:

```text
\\SERVER-DC01\CompanyData
```

8. Mapped the shared folder as a network drive.
9. Verified read and write access according to assigned permissions.

## Resolution

The client successfully accessed the shared folder after verifying sharing settings, NTFS permissions, and network connectivity.

The shared folder was successfully mapped as a network drive for easier access.

## Verification

Successful verification included:

* Shared folder accessible from CLIENT-PC01.
* Network drive successfully mapped.
* Read and write permissions confirmed.
* No access denied errors encountered.

## Skills Demonstrated

* Windows File Server Administration
* NTFS Permissions
* Share Permissions
* Network Drive Mapping
* Access Control
* Enterprise File Sharing

