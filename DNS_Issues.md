# DNS issues

This portion of the repo contains the information on the aggravating
issues reguarding my installs tendency to have DNS troubles and
connectivity issues.

Issues:
    1) DNS 
        * has issues with resolving domain names (ex: google.com) 
    2) Connectivity
        * has trouble with even connecting to outside servers


## Network Managers Installed
    - iwd
    - NetworkManager
    - wpa_supplicant
    - netctl

## DNS services installed
    - dhcpcd
    - systemd-resolved 

### Information Gathered
    
When using systemctl and systemctl status to check the behaviors of dhcpcd and systemd-resolved i
found that one of the possible problems is that my device is changing M.A.C and IP addresses about
every 4-5 minutes.

I would ping (8.8.8.8) one of googles public dns servers to test if my connection was working,
however when I did the following message was returned " ping: connect: Network is Unreachable".

This by itself could mean a that either my network is offline or my computer just isn't connected to my wifi.

The other issue with my os not being able to resolve the host name. This happened everytime I tried
to ping a server using the domain name. When I tried originally the message "ping: google.com: Name
or Service is not known" was returned.

#### Research

Using my phone, I decided to search about the issues on forums to see if I could find a solution.
The following pages are ones that I've visited:
   -  https://bbs.archlinux.org/viewtopic.php?id=237074&p=7

Here the issue that the poster mentioned having was simmilar to that of mine. However it 
 
