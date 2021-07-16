# DNS issues

This portion of the repo contains the information on the aggravating
issues reguarding my installs tendency to have DNS troubles and
connectivity issues.

## Issues

1. DNS 
    - Has issues with resolving domain names (ex: google.com) 

2. Connectivity
    - Has trouble with even connecting to outside servers


### Network Managers Installed
- NetworkManager
- wpa_supplicant

### DNS services installed
- dhcpcd
- systemd-resolved 

## Information Gathered
    
When using systemctl and systemctl status to check the behaviors of dhcpcd and systemd-resolved I found that one of the possible problems is that my device is changing M.A.C and IP addresses about every 4-5 minutes.   
  
I would ping (8.8.8.8) one of googles public dns servers to test if my connection was working,
however when I did the following message was returned " ping: connect: Network is Unreachable".

This by itself could mean a that either my network is offline or my computer just isn't connected to my wifi.

The other issue with my os not being able to resolve the host name. This happened everytime I tried
to ping a server using the domain name. When I tried originally the message "ping: google.com: Name
or Service is not known" was returned.

## Research

Using my phone, I decided to search about the issues on forums to see if I could find a solution. During this search I found [this post][post] that discussed having a simmilar issue to mine.

## Later Discoveries (updated: 1/22/2021)

I figured out the issue, but haven't had the time to update this.

I eventually found out that the service dhcpcd was where I was having my issues, as when I found out how to configure NetworkManager to set to give systemd-resolved the DNS duties. After doing this I no longer had issues.
    
All that was left was to solve my constant MAC randomization.

In my NetworkManager.conf file I configured it to stop randomizing my mac so much.  

    
    #This allows it to Randomize My MAC  
    [device-mac-randomization]  
    wifi.scan-rand-mac-address=yes

    #This forces it to stay at the most stable MAC  
    [connection-mac-randomization]  
    wifi.clone-mac-address=stable

    
After doing a bit of digging I found that this config file for **iwd** alowed it to take over DNS duties.    

    # This allows iwd to take over DNS duties
    [General]
    EnableNetworkConfiguration=true


### Packages
- [NetworkManager][NetworkManager]
- [dhcpcd][dhcpcd]


### Sources
- [Post Mentioned Above][post]


[post]: https://bbs.archlinux.org/viewtopic.php?id=237074&p=7
[dhcpcd]: https://wiki.archlinux.org/index.php/Dhcpcd  
[NetworkManager]: https://wiki.archlinux.org/index.php/NetworkManager  
