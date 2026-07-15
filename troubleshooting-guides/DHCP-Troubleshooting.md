# DHCP Troubleshooting

## Issue

The DHCP server was successfully installed and configured on **SERVER-DC01**; however, **CLIENT-PC01** was unable to communicate with the domain controller or other devices on the network.

## Symptoms

* The client computer could not contact the domain controller.
* Network connectivity tests failed.
* The client was configured with:

  * **Static IP Address:** `192.168.50.25`
  * **Subnet Mask:** `255.255.255.0`
  * Incorrect network configuration prevented communication with the DHCP server.
* The client was not receiving an IP address dynamically.

## Root Cause

The client network adapter was configured with an incorrect static IPv4 configuration instead of obtaining its IP address and DNS server automatically from the DHCP server.

## Troubleshooting Process

1. Verified that the DHCP role was installed and authorized on **SERVER-DC01**.
2. Confirmed that the DHCP scope was active.
3. Opened the IPv4 properties of the client network adapter.
4. Changed the client configuration to:

   * Obtain an IP address automatically.
   * Obtain DNS server address automatically.
5. Renewed the DHCP lease.
6. Verified the assigned IP address using `ipconfig /all`.
7. Tested connectivity using the `ping` command.

## Resolution

After configuring the client to obtain its IP address and DNS settings automatically, the DHCP server assigned a valid IP configuration from the configured scope.

Network connectivity was successfully restored.

## Verification

The following tests confirmed the issue was resolved:

* Successful DHCP lease obtained.
* Client received the correct IP address and DNS server.
* Successful communication with **SERVER-DC01** using the `ping` command.
* Client successfully communicated with other hosts on the network.

## Skills Demonstrated

* DHCP Administration
* IPv4 Configuration
* Network Troubleshooting
* TCP/IP Diagnostics
* Command Line Troubleshooting

