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
