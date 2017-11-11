# Arch Install Script 
Arch Linux Install Script is a good alternative for beginners to install Arch Linux on their PCs. It brings you toward everything what you need to have a functional operating system. All you need is typing needed things with your keyboard. You even don't need to know commands! But, be aware of choosing options, because using them without thinking can remove important data from your disks (hard disks, USB sticks and much more).

## How to get it?
Unfortunately, I don't give you ISO file, so you need to download it manually and mount your USB stick to your computer with running Arch Linux LiveCD. It's an easy piece of cake, just try this solution:

Execute fdisk command to check connected disks to your PC and recognize it:
```
[blake@shinou ~]$ lsblk
NAME             MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda                8:0    0 232,9G  0 disk 
├─sda1             8:1    0     1K  0 part 
├─sda2             8:2    0  29,3G  0 part 
├─sda3             8:3    0  20,5G  0 part 
├─sda5             8:5    0     1G  0 part /boot
├─sda6             8:6    0    30G  0 part /
├─sda7             8:7    0     3G  0 part 
└─sda8             8:8    0 149,1G  0 part /home
sdb                8:16   1  14,7G  0 disk 
sr0               11:0    1  1024M  0 rom  
```
For example: my USB stick with this script is on sdb disk. We need to mount it easily, but firstly we need to make a directory for our mount command:
```
mkdir /mnt/USB_stick /dev/sdb
```
Now go to this directory:
```
cd /mnt/USB_stick
```
And copy `arch-install-script.sh` to /mnt
```
cp arch-linux-install.sh /mnt
```
Before we start everything, it's recommended to umount this device and remove created earlier directory:
```
umount /mnt/USB_stick
rm -r /mnt/USB_stick
```
We need to give a permission to execute this file:
```
chmod +x arch-install-script.sh
```
The last thing you need to do is execute Arch Install Script. You can do it with this command:
```
./arch-install-script.sh
```

## Warranty
I don't give you any warranty: you use this script on you own. Remember that it's still in development, so it's possible to lose your data without any reason, for example.

## Languages
Available lanugages:
- `English (en)`

Soon available:
- `Polski (pl)`
