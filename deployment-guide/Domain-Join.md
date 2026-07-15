# 06 – Joining Client Computers to the Domain

## Objective

The objective of this phase was to join Windows 11 client computers to the **techsolutions.local** Active Directory domain and verify centralized authentication and management.

Joining workstations to the domain enables users to authenticate with their domain accounts, receive Group Policy settings, access shared resources, and be centrally managed by the IT department.

---

# Background

Prior to joining the domain, each client computer functioned independently using only local user accounts.

By joining the computers to the Active Directory domain, authentication and management became centralized through **SERVER-DC01**, allowing administrators to manage users, computers, security policies, and network resources from a single location.

---

# Prerequisites

The following tasks were completed before joining the clients to the domain:

* Windows Server 2022 installed
* Active Directory Domain Services deployed
* Domain Controller configured
* DNS Server operational
* DHCP Server operational
* User accounts created in Active Directory
* Client computers configured to obtain IP addresses automatically

---

# Client Computers

Two Windows 11 virtual machines were used during this deployment.

| Computer Name | Role                      |
| ------------- | ------------------------- |
| CLIENT-PC01   | Domain Joined Workstation |
| CLIENT-PC02   | Domain Joined Workstation |

---

# Domain Join Procedure

## Step 1 – Verify Network Connectivity

Each client computer received an IP address automatically from the DHCP server.

Verification included:

* IP address assignment
* DNS server configuration
* Network connectivity to SERVER-DC01

Example command:

```powershell
ipconfig /all
```

The Preferred DNS Server was confirmed as:

| Setting       | Value         |
| ------------- | ------------- |
| Preferred DNS | 192.168.10.10 |

---

## Step 2 – Verify Name Resolution

Before joining the domain, DNS name resolution was tested.

Example commands:

```powershell
ping SERVER-DC01

nslookup techsolutions.local
```

Successful responses confirmed that the clients could locate the Domain Controller.

---

## Step 3 – Join the Domain

On each client computer:

1. Open **System Properties**
2. Select **Rename this PC (Advanced)**
3. Open **Computer Name**
4. Click **Change**
5. Select **Domain**
6. Enter:

```text
techsolutions.local
```

7. Provide domain administrator credentials when prompted.
8. Restart the client computer.

After restarting, each workstation became a member of the Active Directory domain.

---

## Step 4 – Verify Active Directory

Opened **Active Directory Users and Computers** on SERVER-DC01.

Expanded:

```text
TechSolutions
    └── Computers
```

Confirmed that:

* CLIENT-PC01
* CLIENT-PC02

appeared as Active Directory computer objects.

---

## Step 5 – Verify Domain Authentication

Logged into each workstation using a domain account.

Example users:

* john.admin
* sarah.it
* mary.hr
* david.finance

Successful authentication confirmed that:

* Active Directory
* DNS
* DHCP

were functioning correctly.

---

## Step 6 – Verify Communication

Confirmed that:

* Domain users authenticated successfully.
* Clients could communicate with the Domain Controller.
* Shared resources were accessible.
* Group Policies were ready for deployment.

---

# Validation Checklist

The deployment was considered successful after verifying:

* CLIENT-PC01 joined the domain
* CLIENT-PC02 joined the domain
* Active Directory displayed both computers
* Domain user authentication successful
* DNS name resolution successful
* DHCP assigned valid addresses
* Communication with SERVER-DC01 verified

---

# Recommended Screenshots

Capture the following screenshots.

### Client Computers

* Computer Name window
* Domain Join dialog
* Successful domain join message
* Domain login screen

### Active Directory

* CLIENT-PC01 in Active Directory
* CLIENT-PC02 in Active Directory

### Network Verification

* `ipconfig /all`
* Successful ping to SERVER-DC01

Store screenshots in:

```text
screenshots/clients/
```

Suggested filenames:

```text
client-pc01-domain-joined.png
client-pc02-domain-joined.png
domain-login-screen.png
active-directory-computers.png
client-ipconfig.png
ping-server-dc01.png
```

---

# Common Issues and Resolution

## Issue

The client computer could not locate the domain.

### Cause

Incorrect DNS server configuration.

### Resolution

Configured the Preferred DNS Server as:

```text
192.168.10.10
```

Renewed the DHCP lease and verified name resolution before attempting the domain join again.

---

## Issue

"The specified domain either does not exist or could not be contacted."

### Cause

DNS resolution failed or the Domain Controller was unavailable.

### Resolution

Verified:

* DNS configuration
* Network connectivity
* Domain Controller availability
* Active Directory services

---

## Issue

Invalid username or password during domain join.

### Resolution

Confirmed that the account used had permission to join computers to the domain and entered the credentials using the domain administrator account.

---

# Skills Demonstrated

* Active Directory Administration
* Domain Management
* Windows Client Administration
* DNS Troubleshooting
* DHCP Verification
* Enterprise Authentication
* Windows Networking
* IT Support

---

# Lessons Learned

Joining client computers to the domain demonstrated the importance of the integration between Active Directory, DNS, and DHCP. Proper DNS configuration was essential for locating the Domain Controller, while DHCP ensured consistent client network settings. Successfully joining both client computers validated that the core Windows Server infrastructure was functioning as designed.

---

# References

* Microsoft Learn – Join a Computer to an Active Directory Domain
* Microsoft Learn – Manage Computer Accounts in Active Directory
* Microsoft Learn – Troubleshoot Domain Join Issues

