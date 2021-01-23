# Dual-Booting Arch with Windows 10

This will depict the methods I used dual[tri]-boot my linux install with windows 10

## My Partition Scheme

My Partitions are as followed (sda being what the hard-drive is referred to by fdisk -l)

sda [300 GB (I plan to upgrade to 1 TB soon)]:
---------------------------------------------------------------------------
- sda1 (my EFI partition) [500 MB]
    * This is where my grub .efi files are located for use by my bootloader

- sda2 (My Arch-linux install location) [20 GB]
    * This is where my root "/" partition is located for my linux install

- sda3 ("/home" directory) [150 GB]
    * This is the home directory of my arch-linux install.

- sda4 (Ubuntu install) [30 GB]
    * Shares sda3 as a home directory with Arch

- sda5 (my Windows 10 install) [30 GB]

- sda6 (extra storage for windows) [70 GB]
    * will Probably merge this with the windows install at a later date.
---------------------------------------------------------------------------
## Configuring the Grub bootloader
----------------------------------

### Adding it to Grub
After installing Windows 10 I booted back into Arch and used the package update-grub to automatically detect the ".efi" files for each install and configure grub to 
add it to the list of bootable OS's.  

### Setting Arch as my Default
I downloaded the "grub-customizer" package to push Arch to the top of the list, so I didn't have to hurry and sellect it every time I boot up my PC.
