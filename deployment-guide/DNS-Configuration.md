# 04 – DNS Server Configuration

## Objective

The objective of this phase was to configure the Domain Name System (DNS) service to provide reliable name resolution for the TechSolutions Active Directory environment.

Because Active Directory depends heavily on DNS, configuring and validating DNS correctly was essential before deploying additional services such as DHCP and joining client computers to the domain.

---

# Background

In a Windows Active Directory environment, DNS allows client computers to locate domain controllers and other network resources using hostnames instead of IP addresses.

When the server was promoted to a Domain Controller, the DNS Server role was installed automatically. This phase focused on validating the DNS installation, confirming zone creation, and testing name resolution.

---

# Prerequisites

Before configuring DNS, the following tasks had already been completed:

* Oracle VirtualBox environment created
* Windows Server 2022 installed
* Static IP address configured (`192.168.10.10`)
* Active Directory Domain Services deployed
* Domain Controller promoted
* Domain **techsolutions.local** created

---

# DNS Configuration

## Step 1 – Verify DNS Server Installation

Opened **Server Manager** and confirmed that the **DNS Server** role was installed successfully.

The **DNS Manager** administrative console was available under:

**Tools → DNS**

---

## Step 2 – Verify Forward Lookup Zone

Opened **DNS Manager** and expanded:

```text
SERVER-DC01
    └── Forward Lookup Zones
```

Verified that the following zone existed:

| Zone Type           | Name                |
| ------------------- | ------------------- |
| Forward Lookup Zone | techsolutions.local |

This zone was automatically created during the Domain Controller promotion process.

---

## Step 3 – Verify Host Records

Confirmed that DNS records for the Domain Controller were created automatically.

Typical records included:

* Host (A) Record
* Name Server (NS) Record
* Start of Authority (SOA) Record
* Service (SRV) Records

These records enable clients to locate Active Directory services.

---

## Step 4 – Verify Reverse Lookup Zone (Optional)

A Reverse Lookup Zone may be created to resolve IP addresses back to hostnames.

Although not mandatory for this lab, reverse lookup zones are considered a best practice in many enterprise environments because they simplify troubleshooting and auditing.

---

## Step 5 – Configure Preferred DNS Server

Confirmed that the Domain Controller's network adapter was configured to use itself as the preferred DNS server.

| Setting              | Value         |
| -------------------- | ------------- |
| Preferred DNS Server | 192.168.10.10 |

Using the Domain Controller as its own DNS server ensures reliable name resolution for Active Directory services.

---

## Step 6 – Test Name Resolution

Verified DNS functionality using built-in Windows tools.

Tests included:

* Resolving the server hostname
* Resolving the domain name
* Confirming successful DNS responses

Example commands:

```powershell
ipconfig /all

nslookup techsolutions.local

nslookup SERVER-DC01

ping SERVER-DC01

ping techsolutions.local
```

Successful responses confirmed that DNS was operating correctly.

---

# Validation Checklist

The DNS deployment was validated by confirming:

* DNS Server role installed
* DNS Manager accessible
* Forward Lookup Zone created
* Domain **techsolutions.local** resolving correctly
* Host records present
* DNS service running
* Successful hostname resolution
* Successful domain name resolution

---

# Recommended Screenshots

Capture the following screenshots:

### DNS Manager

* DNS console
* Forward Lookup Zone
* Domain records

### Network Configuration

* IPv4 DNS configuration

### Command-Line Verification

* `ipconfig /all`
* `nslookup techsolutions.local`
* `ping SERVER-DC01`

Store screenshots in:

```text
screenshots/dns/
```

Suggested filenames:

```text
dns-manager-console.png
forward-lookup-zone.png
dns-host-records.png
ipconfig-all.png
nslookup-domain.png
ping-server-dc01.png
```

---

# Common Issues and Resolution

## Issue

Client computers were unable to locate the domain.

### Cause

The client was configured to use an incorrect DNS server.

### Resolution

Configured the client computers to use the Domain Controller (`192.168.10.10`) as their preferred DNS server.

---

## Issue

Hostname resolution failed.

### Cause

DNS records were missing or the DNS service was unavailable.

### Resolution

Verified that the DNS service was running and confirmed that the required host and SRV records existed.

---

## Issue

The server could not resolve its own hostname.

### Resolution

Verified that the Preferred DNS Server was set to the server's static IP address and restarted the DNS service if necessary.

---

# Skills Demonstrated

* DNS Administration
* DNS Zone Management
* Forward Lookup Zones
* Host Record Verification
* Name Resolution
* Network Troubleshooting
* Windows Server Administration

---

# Lessons Learned

This phase reinforced the critical relationship between DNS and Active Directory. Proper DNS configuration is essential for domain authentication, Group Policy processing, and locating network resources. Verifying DNS functionality before deploying additional services reduced the likelihood of future connectivity and authentication issues.

---

# References

* Microsoft Learn – DNS Server Overview
* Microsoft Learn – Manage DNS Zones
* Microsoft Learn – DNS and Active Directory Integration
* Microsoft Learn – Troubleshoot DNS in Windows Server

