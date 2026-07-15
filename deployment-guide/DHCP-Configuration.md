# 05 – DHCP Server Configuration

## Objective

The objective of this phase was to deploy and configure the Dynamic Host Configuration Protocol (DHCP) service to automatically assign IP addresses and network configuration settings to client computers within the TechSolutions domain.

Implementing DHCP centralized IP address management, eliminated manual network configuration on client computers, and ensured consistent network settings across the enterprise environment.

---

# Background

Before DHCP was configured, every computer would require a manually assigned IP address. While this may be manageable in a very small environment, it quickly becomes inefficient and increases the risk of duplicate IP addresses and configuration errors.

By deploying DHCP, client computers automatically receive:

* IP Address
* Subnet Mask
* DNS Server
* Domain Name
* Lease Duration

This greatly simplifies workstation deployment and ongoing network administration.

---

# Prerequisites

The following tasks had already been completed:

* Windows Server 2022 installed
* Static IP configured on SERVER-DC01
* Active Directory deployed
* DNS configured and operational
* Domain Controller functioning correctly

---

# DHCP Installation

## Step 1 – Install the DHCP Server Role

Using **Server Manager**, the **Add Roles and Features Wizard** was launched.

The following role was installed:

* DHCP Server

The associated management tools were installed automatically.

After installation completed successfully, the DHCP management console became available under:

**Server Manager → Tools → DHCP**

---

## Step 2 – Authorize the DHCP Server

Since the server is a Domain Controller within an Active Directory environment, the DHCP server was authorized.

Authorizing the DHCP server prevents unauthorized DHCP servers from distributing IP addresses on the network.

Verification confirmed that **SERVER-DC01** was successfully authorized.

---

## Step 3 – Create the DHCP Scope

A new IPv4 scope was created to provide IP addresses to client computers.

### Scope Details

| Setting          | Value                        |
| ---------------- | ---------------------------- |
| Scope Name       | CorpNet Scope                |
| Description      | TechSolutions Client Network |
| Start IP Address | 192.168.10.100               |
| End IP Address   | 192.168.10.200               |
| Subnet Mask      | 255.255.255.0                |

This configuration provides up to 101 dynamic IP addresses for client devices.

---

## Step 4 – Configure Address Exclusions

No exclusion range was required because the Domain Controller was configured with a static IP address outside the DHCP scope.

| Device      | IP Address    |
| ----------- | ------------- |
| SERVER-DC01 | 192.168.10.10 |

Since the DHCP scope begins at **192.168.10.100**, there is no risk of the server's address being assigned to another device.

This design follows common enterprise networking practices by separating infrastructure devices from dynamically assigned client addresses.

---

## Step 5 – Configure Lease Duration

The default DHCP lease duration was retained for this lab environment.

For production environments, lease duration may be adjusted based on network size and client mobility.

---

## Step 6 – Configure DHCP Options

The following DHCP options were configured:

| Option                   | Value                                       |
| ------------------------ | ------------------------------------------- |
| Router (Default Gateway) | *Not configured (isolated lab environment)* |
| DNS Server               | 192.168.10.10                               |
| Domain Name              | techsolutions.local                         |

These options ensure that client computers can resolve domain resources and communicate with the Domain Controller.

---

## Step 7 – Activate the Scope

After completing the scope configuration, the scope was activated.

Once activated, the DHCP server began leasing IP addresses to eligible client computers.

---

## Step 8 – Verify DHCP Operation

Client computers were configured to obtain IP addresses automatically.

Verification confirmed that:

* Clients received IP addresses from the DHCP scope.
* The assigned addresses fell within the configured range.
* Clients received the correct DNS server.
* Clients successfully communicated with the Domain Controller.

Example verification commands:

```powershell
ipconfig /release

ipconfig /renew

ipconfig /all
```

---

# Validation Checklist

The DHCP deployment was considered successful after verifying:

* DHCP Server role installed
* DHCP server authorized
* IPv4 scope created
* Scope activated
* DNS option configured
* Domain name option configured
* Clients obtained IP addresses automatically
* Network connectivity verified

---

# Recommended Screenshots

Capture the following screenshots:

### DHCP Console

* DHCP Manager
* IPv4 Scope
* Address Pool
* Scope Properties

### Client Verification

* `ipconfig /all`
* DHCP lease information

Store screenshots in:

```text
screenshots/dhcp/
```

Suggested filenames:

```text
dhcp-manager-console.png
corpnet-scope.png
address-pool.png
scope-properties.png
client-ipconfig-all.png
dhcp-lease.png
```

---

# Common Issues and Resolution

## Issue

A client computer did not receive an IP address automatically.

### Cause

The client network adapter was configured with a static IP address instead of obtaining an address automatically.

### Resolution

Changed the client network adapter configuration to:

* Obtain an IP address automatically
* Obtain DNS server address automatically

After renewing the lease using:

```powershell
ipconfig /release
ipconfig /renew
```

the client successfully received an IP address from the DHCP server.

---

## Issue

Clients received an IP address but could not join the domain.

### Cause

Incorrect DNS server information.

### Resolution

Verified that DHCP Option 006 (DNS Server) was configured as:

```
192.168.10.10
```

---

## Issue

The DHCP scope was inactive.

### Resolution

Activated the scope within the DHCP management console and confirmed that address leasing began successfully.

---

# Skills Demonstrated

* DHCP Administration
* IPv4 Scope Configuration
* DHCP Authorization
* IP Address Management
* Network Services
* Windows Server Administration
* Enterprise Network Configuration

---

# Lessons Learned

Deploying DHCP simplified client network configuration by automating IP address assignment and ensuring consistent DNS settings across the environment. Separating the static address used by the Domain Controller from the DHCP scope demonstrated sound network design principles and reduced the possibility of IP address conflicts.

---

# References

* Microsoft Learn – DHCP Overview
* Microsoft Learn – Install and Configure DHCP
* Microsoft Learn – DHCP Scope Configuration
* Microsoft Learn – Authorize a DHCP Server in Active Directory

