# DNS Troubleshooting

## Issue

After joining the client computer to the domain, name resolution needed to be verified to ensure domain services were functioning correctly.

## Symptoms

Potential issues included:

* Failure to resolve the domain controller by name.
* Inability to locate Active Directory services.
* Failure to communicate using hostnames.

## Troubleshooting Process

1. Verified that the DNS Server role was installed on **SERVER-DC01**.
2. Confirmed the Forward Lookup Zone for **techsolutions.local** existed.
3. Verified that the client received the correct DNS server address from DHCP.
4. Executed:

```cmd
ipconfig /all
```

5. Confirmed the DNS server pointed to **SERVER-DC01**.
6. Executed:

```cmd
nslookup SERVER-DC01
```

7. Verified successful hostname resolution.
8. Executed:

```cmd
ping SERVER-DC01
```

9. Confirmed successful communication with the domain controller.

## Resolution

DNS name resolution functioned correctly after verifying the client received the proper DNS server configuration from DHCP.

The client successfully resolved hostnames and communicated with the domain controller.

## Verification

Successful verification included:

* Correct DNS server assignment.
* Successful `nslookup`.
* Successful `ping`.
* Domain resources accessible by hostname.

## Skills Demonstrated

* DNS Administration
* Name Resolution
* TCP/IP Troubleshooting
* Active Directory Connectivity
* Network Diagnostics

