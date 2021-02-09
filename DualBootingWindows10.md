# Dual-Booting Arch with Windows 10

This will depict the methods I used dual[tri]-boot my linux install with windows 10

## My Partition Scheme

My Partitions are as followed (sda being what the hard-drive is referred to by fdisk -l)

### sda [300 GB (I plan to upgrade to 1 TB soon)]:
----------------------------------------------
| Partition   | Use                        | Size   | Notes                                                                |
| :---------: | -------------------------- | ------ | -------------------------------------------------------------------- |
| sda1        | EFI partition              | 500 MB |                                                                      |
| sda2        | Arch Install               | 30 GB  |                                                                      |
| sda3        | "/home" directory for Arch | 150 GB |                                                                      |
| sda4        | Ubuntu Install             | 30 GB  | Shares sda3 as home directory                                        |
| sda5        | Windows 10 Install         | 30 GB  |                                                                      |
| sda6        | Extra storage for windows  | 70 GB  | Will Probably merge this with the windows partition at a later date. |

---------------------------------------------------------------------------
## Configuring the Grub bootloader
----------------------------------

### Adding it to Grub
- After installing Windows 10 I booted back into Arch and used the package update-grub to automatically detect the ".efi" files for each install and configure grub to 
add it to the list of bootable OS's.  

### Setting Arch as my Default
- I downloaded the "grub-customizer" package to push Arch to the top of the list, so I didn't have to hurry and select it every time I boot up my PC.
