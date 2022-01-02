# Wi-Fi Connectivity Issues

## Related Posts

- [DNS Issues](DNS_Issues.md)

## Background

After a while of using Arch I've encountered a few issues with DNS and Wireless Connectivity. The DNS Issue was solved after a while due to some competing daemon's. The Wireless Connectivity issues were small but were irritating to deal with after each reboot. 

I'm using Gnome as a Desktop Enviroment on my Arch install, and it comes with NetworkManager which it uses wpa_supplicant as a wifi backend. This by itself isn't an issue, as it works quite well by itself. However, I also use iwd as a wireless network manager as it is the easiest for me to use without having to delve into using ip.



## Problem

After each time I reboot my computer or it goes into standby, my computer loses connection to the wifi (I assume it's dropped to save power. After which iwd either starts off connected, or automatically connects due to the wireless interface being unused.
	
This is an issue because without wpa_suppicant being the one holding the connection all of the apps (aside from the terminal) cannot connect to the internet to preform the duties I need them for. This is aggravating since it requres me to spam "iwctl station wlan0 disconnect" while also making sure that I go to the wifi tab and select my wifi to connect to. While I can deal with this, it is still not a nice situation to be in.
	
	
## Process

After some searching I found [this post][Post] that details how to configure NetworkManager to use iwd as the wifi backend instead of wpa_supplicant.
	
The steps I had to take from here were:

1. Add this line of code into my NetworkManager.conf file.

'''  
[device]  
wifi.backend=iwd  
'''

2. Stop and restart both NetworkManager and wpa_supplicant.


## Conclusion

After doing this I have yet to happen upon this issue again (although it has only been a few hours). So I'd say that I fixed it, at least for now.

-----

### Packages used:  

- [NetworkManager](https://wiki.archlinux.org/index.php/NetworkManager)
- [wpa_supplicant](https://wiki.archlinux.org/index.php/wpa_supplicant)
- [iwd](https://wiki.archlinux.org/index.php/Iwd)


### Sources

- [Post on configuring NetworkManager][Post]  

[Post]: (https://wiki.debian.org/NetworkManager/iwd)
