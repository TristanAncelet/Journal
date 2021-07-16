# Mounting Samba Share to local directory  
After I changed my Laptop's HDD to a SSD, as doccumented [here](MovingToNewSDD.md), I encountered an issue related to forgetting to copy over files from my previous intalls' home partition. In this I was wanting to start prepping for a session of D&D, and without my files I couldn't do so. So after looking through my pendrives I found a full copy of my Campaign notes and copied them to my laptop. However, I wanted to be able to access them and change them even if I wasn't in my house. This is where I got the idea for this project.

## Background (for context)
I use Vim for taking my D&D notes, in conjunction with the plugin [VimWiki][vimwiki page] it is an amazing tool to write and organize notes of all types.

## What I wanted to do  
In this project I wanted to figure out how to mount a remote filesystem, a tower I use as a file/media server in my house, to a local directory (namely my Campaigns folder. 


## Process  
### Using FTP
I had previously learned how to mount a ftp connection using the package "curlftpfs", so I thought I'd try and see if it would work well with vim when I try to treverse the folders and subfolders. In the first mounting of the the remote folder it seemed to work fine, but as I tried to access one of the subfolders while using vim it caused the program to freeze and crash. So I ended up giving up on using ftp since it didn't come packaged with a fs that supports subfolders.

### Using Samba
From here I decided to try and mount the Share instead. Since I used Samba on my spare tower running ubuntu to use it as a file server, I thought it would be a good idea to use it as to mount my campaign directory of my server as it supports it being used as a virtual filesystem.


## Packages used  
- [CurlFtpFS](https://wiki.archlinux.org/index.php/CurlFtpFS)
- [Mount](https://archeage.fandom.com/wiki/Mount)

## Vim plugins used
- [VimWiki][vimwiki page]

## Articles used  
- [Article 1: How to mount Samba shares to local directories](https://www.looklinux.com/how-to-mount-samba-share-smbfs-in-linux/)
- [Article 2: How to change rw permissions of mounted Samba shares](https://askubuntu.com/questions/393563/how-to-change-permissions-on-mounted-windows-share)

[vimwiki page]: https://vimwiki.github.io/
