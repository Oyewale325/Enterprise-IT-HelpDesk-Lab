# 02 – Windows Server 2022 Installation & Initial Configuration

## Objective

The objective of this phase was to deploy Windows Server 2022, perform the initial operating system configuration, assign a static IP address, rename the server, and prepare the system for Active Directory Domain Services installation.

A properly configured server provides the foundation for all enterprise infrastructure services, including Active Directory, DNS, DHCP, Group Policy, and File Services.

---

# Background

After preparing the virtual environment, Windows Server 2022 was installed on the virtual machine designated as the organization's primary server.

This server would later be promoted to the Domain Controller and host the following infrastructure services:

* Active Directory Domain Services (AD DS)
* DNS Server
* DHCP Server
* File Services
* Group Policy Management

To ensure reliable network communication, the server was configured with a static IPv4 address before installing any Windows Server roles.

---

# Prerequisites

Before beginning this phase, the following requirements were completed:

* Oracle VirtualBox installed
* Windows Server 2022 ISO downloaded
* Virtual machine created
* Internal virtual network configured
* Sufficient virtual hardware allocated

---

# Installation Procedure

## Step 1 – Install Windows Server 2022

The Windows Server 2022 operating system was installed on the virtual machine using the official installation media.

Installation included:

* Selecting Windows Server 2022 Standard Evaluation (Desktop Experience)
* Creating the Administrator account
* Completing the initial operating system setup

After installation, the server successfully booted into Windows Server.

---

## Step 2 – Rename the Server

The default computer name was replaced with a descriptive hostname.

| Setting       | Value           |
| ------------- | --------------- |
| Original Name | Windows Default |
| New Name      | SERVER-DC01     |

Using meaningful server names simplifies administration and improves identification within enterprise environments.

The server was restarted to apply the name change.

---

## Step 3 – Configure Static IPv4 Address

A static IP address was assigned to ensure the server always retained the same network address.

| Setting              | Value                                             |
| -------------------- | ------------------------------------------------- |
| IP Address           | 192.168.10.10                                     |
| Subnet Mask          | 255.255.255.0                                     |
| Default Gateway      | *(Not required for the isolated lab environment)* |
| Preferred DNS Server | 192.168.10.10                                     |

Using a static IP address is essential because infrastructure services such as Active Directory and DNS depend on a consistent server address.

---

## Step 4 – Verify Network Connectivity

After configuring the network settings, the server configuration was verified using Windows networking tools.

Verification included:

* Confirming the assigned IPv4 address
* Verifying subnet configuration
* Confirming DNS server configuration
* Testing network adapter functionality

---

## Step 5 – Install Windows Updates

Available Windows updates were installed to ensure the operating system contained the latest security updates and bug fixes before deploying server roles.

Although this lab environment is isolated, applying updates reflects enterprise deployment best practices.

---

## Step 6 – Verify Server Manager

Server Manager was opened to verify that the server was operating correctly and ready for role installation.

At this stage, no infrastructure roles had yet been installed.

---

# Validation Checklist

The following items were successfully completed:

* Windows Server 2022 installed successfully
* Administrator account configured
* Server renamed to **SERVER-DC01**
* Static IPv4 address configured
* DNS server configured
* Network adapter functioning correctly
* Windows updates installed
* Server Manager verified

---

# Recommended Screenshots

Capture and include the following screenshots:

### Server Installation

* Windows Server desktop after installation
* Windows activation or system information (optional)

### Computer Name

* System Properties showing **SERVER-DC01**

### Network Configuration

* IPv4 Properties
* `ipconfig /all` output
* Network Connections window

### Server Manager

* Server Manager Dashboard

Store the screenshots in:

```text
screenshots/server-manager/
```

Example filenames:

```text
server-installation-complete.png
server-name-server-dc01.png
static-ip-configuration.png
ipconfig-output.png
server-manager-dashboard.png
```

---

# Common Issues and Resolution

## Issue

Incorrect IP address configuration prevented communication with client computers.

### Resolution

Verified the IPv4 configuration and corrected the IP address, subnet mask, and DNS server settings.

---

## Issue

The server name did not update immediately after renaming.

### Resolution

Restarted the server to apply the hostname change.

---

## Skills Demonstrated

* Windows Server Installation
* Operating System Configuration
* Static IP Configuration
* Network Administration
* Windows Server Management
* Server Deployment
* Initial System Validation

---

# Lessons Learned

Assigning a static IP address and configuring the server correctly before installing Active Directory significantly reduces deployment issues later in the project. Proper server naming conventions and early validation also improve manageability and simplify troubleshooting.

---

# References

* Microsoft Learn – Install and configure Windows Server
* Microsoft Learn – Configure TCP/IP settings
* Microsoft Learn – Server Manager Overview

