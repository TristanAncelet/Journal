# Setting up a VPN


| Details               |                                                   |
|-----------------------|---------------------------------------------------|
|  Machine Used         | [IBM System x3650 M4][server file]           |
|  VPN Service Used     | [OpenVPN Access Server][OpenVPN Download] |


## Steps

1) Download and Install [OpenVPN Access Server][OpenVPN Download]:  

2) Followed the [instructions][configuration page] on getting it installed and on how to finish the initial setup.

3) Opened OpenVPN operating ports of 443, 1194 on my routers NAT

4) Opened the OpenVPN management console, and changed the hostname to my external ip address to allow for external clients to connect.

5) Created a personal profile for me and copied the ".opvn" file to my clients and installed them.

## Coming Later

Once I have a windows server I plan to find out how to implement LDAP authorization for OpenVPN in order to learn how to correctly configure it to work with Active Directory.


[OpenVPN Download]: https://openvpn.net/download-open-vpn/
[server file]: Hardware/IBM_System_x3650_M4.md
[configuration page]: https://openvpn.net/vpn-server-resources/finishing-configuration-of-access-server/