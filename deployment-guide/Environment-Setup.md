# 01 – Environment Setup

## Objective

The objective of this phase was to prepare a virtual enterprise environment that could simulate a real-world corporate network for IT Support, Help Desk, and Windows Server administration.

The environment was designed to provide a safe platform for deploying Windows Server services, configuring enterprise network infrastructure, and practicing administrative and troubleshooting tasks without requiring physical hardware.

---

# Project Scenario

TechSolutions is a fictional organization that requires a centralized Windows Server infrastructure to manage users, computers, network services, security policies, and departmental resources.

As the IT Administrator, my responsibility was to design and deploy the company's Windows infrastructure from the ground up using virtualization technologies.

---

# Lab Environment

## Host Computer

| Component             | Specification                   |
| --------------------- | ------------------------------- |
| Computer              | Dell Latitude 5310              |
| Processor             | Intel Core i5 (10th Generation) |
| Memory                | 24 GB RAM                       |
| Host Operating System | Windows 11 Pro                  |

The available hardware provided sufficient resources to run multiple virtual machines simultaneously while maintaining good system performance.

---

# Virtualization Platform

The lab environment was built using Oracle VirtualBox.

VirtualBox was selected because it provides:

* Free desktop virtualization
* Snapshot support
* Multiple virtual networking modes
* Support for Windows Server operating systems
* Easy management of multiple virtual machines

---

# Software Used

| Software                         | Purpose                         |
| -------------------------------- | ------------------------------- |
| Oracle VirtualBox                | Virtualization Platform         |
| Windows Server 2022              | Domain Controller               |
| Windows 11 Pro                   | Client Operating System         |
| PowerShell                       | Administration & Automation     |
| Active Directory Domain Services | Identity Management             |
| DNS Server                       | Name Resolution                 |
| DHCP Server                      | Automatic IP Address Assignment |

---

# Virtual Machines Created

## SERVER-DC01

| Setting          | Value               |
| ---------------- | ------------------- |
| Operating System | Windows Server 2022 |
| Computer Name    | SERVER-DC01         |
| Role             | Domain Controller   |
| Memory           | 6 GB                |
| Storage          | 60 GB               |
| Network Adapter  | Internal Network    |

---

## CLIENT-PC01

| Setting          | Value            |
| ---------------- | ---------------- |
| Operating System | Windows 11 Pro   |
| Computer Name    | CLIENT-PC01      |
| Memory           | 4 GB             |
| Storage          | 40 GB            |
| Network Adapter  | Internal Network |

---

## CLIENT-PC02

| Setting          | Value            |
| ---------------- | ---------------- |
| Operating System | Windows 11 Pro   |
| Computer Name    | CLIENT-PC02      |
| Memory           | 4 GB             |
| Storage          | 40 GB            |
| Network Adapter  | Internal Network |

---

# Network Design

The lab uses a private Class C network.

| Configuration     | Value                           |
| ----------------- | ------------------------------- |
| Network           | 192.168.10.0/24                 |
| Domain Controller | 192.168.10.10                   |
| DNS Server        | 192.168.10.10                   |
| DHCP Scope        | 192.168.10.100 – 192.168.10.200 |

The Domain Controller was assigned a static IP address to ensure reliable delivery of Active Directory, DNS, and DHCP services.

Client computers were configured to obtain IP addresses automatically through DHCP.

---

# Project Goals

The environment was designed to demonstrate practical experience with:

* Windows Server deployment
* Active Directory administration
* DNS configuration
* DHCP configuration
* Domain management
* User and computer administration
* File sharing and permissions
* Group Policy
* Help Desk troubleshooting
* PowerShell automation

---

# Verification

The environment was considered successfully prepared after:

* Oracle VirtualBox was installed.
* Virtual machines were created successfully.
* Windows Server 2022 installation completed.
* Windows 11 client installations completed.
* Virtual networking was configured correctly.
* All virtual machines powered on successfully.

---

# Recommended Screenshots

Add the following screenshots to this document:

1. Oracle VirtualBox Manager
2. Virtual Machine List
3. Windows Server Installation Complete
4. Windows 11 Client Installation
5. Virtual Machine Settings
6. Network Adapter Configuration

Store screenshots in:

```text
screenshots/server-manager/
```

---

# Skills Demonstrated

* Virtualization
* Environment Planning
* Windows Installation
* Enterprise Lab Design
* Network Planning
* Windows Server Deployment

---

# Lessons Learned

Building a reliable enterprise environment begins with careful planning and proper virtualization. Establishing the virtual infrastructure before configuring Windows Server roles provided a stable foundation for Active Directory, networking services, and client administration throughout the remainder of the project.

