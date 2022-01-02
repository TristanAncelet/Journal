# Moving to a new 1 TB SSD


| **New SSD** |                                 |
|:-----------:|---------------------------------|
|Name         | SanDisk SDSSDA-1                |
|Capacity     | 1 TB                            |
|Datasheet    | [link to pdf][product datasheet]|

## Partition Sheme

| Partition # | Filesystem | Size   | Notes |
|:-----------:|------------|--------|-------|
| 1           | EFI        | 500 MB |This is my bootloader partition for both Windows 10 and Arch
| 2           | ext4       | 100 GB | This is the boot partition for my linux install
| 3           | ext4       | 200 GB | This is the "\home" directory for my linux install
| 4           | NTFS       | 200 GB | This is the boot partition for my Windows 10 install
| 5           | NTFS       | 16 MB  | Not sure what this one is for, Windows made it during installation
| 6           | Fat32      | 30 GB  | This is my "Universal" storage, a partition that functions as a place to store any files that I need/want to move between my installs


## Process

Following a [tutorial][youtube tutorial] to brush up on how to install Arch I:

- Using [fdisk][fdisk] I made a new [GPT](https://en.wikipedia.org/wiki/GUID_Partition_Table) partition table and made:
    1. The [EFI](https://en.wikipedia.org/wiki/EFI_system_partition) partition for the bootloader

    2. The root ( / ) partition for my linux install

    3. The home partition ( /home ) for the install

    4. An empty [Fat32](https://en.wikipedia.org/wiki/File_Allocation_Table) partition for my Windows install I planned to do later

    5. Made the "Universal" Partition to use as storage.



[fdisk]: https://wiki.archlinux.org/index.php/Fdisk
[youtube tutorial]: https://www.youtube.com/watch?v=a00wbjy2vns&ab_channel=LearnLinuxTV  
[product page]:https://www.googleadservices.com/pagead/aclk?sa=L&ai=DChcSEwj_g5bL6d3uAhVR8MAKHWMmAPUYABADGgJpbQ&ae=2&ohost=www.google.com&cid=CAASE-Ro2ajlV9YWBbY5zs2GY5YE8Es&sig=AOD64_0ZI4HdPjWaUiWvjzAr5l3gdaGnWg&ctype=5&q=&ved=2ahUKEwjC_Y3L6d3uAhUTQ80KHXFzBb0Q9aACegQIERBA&adurl= 

[product datasheet]: https://shop.westerndigital.com/tools/documentRequestHandler?docPath=/content/dam/doc-library/en_us/assets/public/sandisk/product/internal-drives/ssd-plus-sata-iii-ssd/data-sheet-ssd-plus-sata-iii-ssd.pdf