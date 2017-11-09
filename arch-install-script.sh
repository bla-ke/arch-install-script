#!/bin/bash

# Language/Język
echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Choose your language/Wybierz swój język:"
echo "****** English [en]"
echo "****** Polski [pl]"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read input

# Polish/Polski
if [[ $input == "pl" || $input == "Pl" || $input == "polski" || $input == "Polski" ]]; then

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Witaj w skrypcie instalacyjnym systemu Arch Linux!"
echo "****** Przeprowadzi Cię on przez podstawowy proces instalacji"
echo "****** Pamiętaj, aby zawsze, niezależnie od sytuacji, ruszyć głową!"
echo "****** Autor skryptu (bla-ke) nie ponosi odpowiedzialności za wszelkie szkody"
echo "****** Za 10 sekund pojawi się menu wyboru: wpisz numer opcji,"
echo "****** która Cię interesuje..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

# Error
else
echo ""
fi

# English
if [[ $input == "en" || $input == "En" || $input == "english" || $input == "English" ]]; then
echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Welcome to Arch Linux installation script!"
echo "****** It will take you towards the installation"
echo "****** Remember to, no matter what, use your head!"
echo "****** Author of this script (bla-ke) doesn't give you a warranty"
echo "****** After 10 seconds you will be able to choose an option from menu,"
echo "****** which you would like to do..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sleep 10

# Options
PS3='Please enter your choice: '
options=("Load keymaps (optional)" "Wi-Fi Configuration" "Partitioning the Disk" "Formating the partitions" "Formating and enabling swap partition" "Mounting the partitions" "Download base packages” "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Load keymaps (optional)")
        # KEYMAPS
            echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Type correct keymap to set it:"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read keymap

loadkeys $keymap

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

            ;;
        "Wi-Fi Configuration")
        # NETWORK CONFIGURATION
            echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** If you use Ethernet, skip this step"
echo "****** This script is going to start wifi-menu tool"
echo "****** It will let you to connect to your Wi-Fi"
echo "****** Waiting 5 seconds..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sleep 5

wifi-menu

sleep 5

ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo "****** Your network is working correctly! :)" || echo "****** Error! No network connection! :("

            ;;
        "Update the system clock")
        # SYSTEM CLOCK UPDATING
            echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** You have chosen updating the system clock..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

timedatectl set-ntp true 

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

            ;;
        "Partite the Disk")
        # DISK PARTITIONING
            echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** You have chosen partitioning your disk..."
echo "****** Do you want to continue?"
echo "****** [Y - Yes, N - No]"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read confirmation

if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Executing lsblk command to show your connected disks..."
echo "****** Read carefully the output information!"
echo "****** You need to type the correct name of your disk"
echo "****** where you want to install Arch Linux"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sleep 3

lsblk

sleep 3

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Which disk would you like to partite?"
echo "****** (sdX)"
echo "****** Where X is a letter of you disk"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read disk

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Executing cfdisk in 5 seconds..."
echo "****** If you don't know how to use it, read Arch Wiki!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

cfdisk /dev/$disk

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

else 

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

fi

            ;;
        "Formate the partitions")
        #FORMATING
            echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Formating your partitions to let mount them. Don't forget to do that for every partition! Needed things:"
echo "****** sdXY (X - letter, Y - number)"
echo "****** File system"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sleep 3

lsblk

sleep 3

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Type your partition"
echo "****** Scheme: sdXY (X - letter, Y - number)"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read partition

sleep 3

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Type your file system"
echo "****** Recommended: ext4, ext3"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read filesystem

sleep 3

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Do you really want to do that?"
echo "****** [Y - Yes, N - No]"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read confirmation

if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Executing mkfs command to make a filesystem..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

mkfs.$filesystem /dev/$partition

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

else 
sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

fi

            ;;
        "Formate and enable swap partition")
            # SWAP FORMATING/ENABLING
        echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Type your swap partition..."
echo "****** Sheme: sdXY (X - letter, Y - number)"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sleep 3

lsblk

read swap_partition

mkswap /dev/$swap_partition

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Do you want to enable it?"
echo "****** [Y - Yes, N - No]"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read confirmation

if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Enabling swap partition..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sleep 2

mount /dev/$swap_partition 

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

else 

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

fi

            ;;
        "Mount the partitions")
            echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Type your root partition..."
echo "****** Sheme: sdXY (X - letter, Y - number)"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

lsblk

read root_partition

mount /dev/$root_partition /mnt

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Do you want to mount home partition?"
echo "****** [Y - Yes, N - No]"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read confirmation

if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Making /mnt/home directory..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sleep 2

mkdir /mnt/home

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Type your home partition..."
echo "****** Sheme: sdXY (X - letter, Y - number)"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

lsblk

read home_partition

mount /dev/$home_partition /mnt/home 

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

else 

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

fi 

            ;;
        "Download base packages")
            # PACSTRAP BASE/BASE-DEVEL
        echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Downloading the base group’s packages..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

pacstrap /mnt base 

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Do you want to download the base-devel group’s packages?"
echo "****** [Y - Yes, N - No]"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read confirmation

if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Downloading the base-devel group’s packages..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""


pacstrap /mnt base-devel 

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

else 

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

fi

            ;;
       "Generate fstab config file")
            # FSTAB CONFIG FILE
        echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Type the method you would like to use to generate your fstab config file"
echo "****** -L - labels"
echo "****** -p - Linux partitions"
echo "****** -U - UUID"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read fstab_method 

genfstab -$fstab_method /mnt >> /mnt/etc/fstab 

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

            ;;
      "Chrooting")
            # ARCH-CHROOT
        echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Do you want to change root (use it only when everything before is done)?"
echo "****** [Y - Yes, N - No]"
echo "******”
echo "************************************************"
echo "**************************************************"
echo ""

read confirmation 

if [[ $confirmation == "y" || $confirmation == "Y" || $confirmation == "yes" || $confirmation == "Yes" ]]; then
echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Chrooting..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

arch-chroot /mnt 

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

else 
echo "”
fi
            ;;

        "Generate locales")
            # GENLOCALE
        echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Generating locales gives you a possibility to change your system language"
echo "****** You need to edit /etc/locale.gen file to uncomment your languages"
echo "****** Waiting 5 seconds..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sleep 5 

nano /etc/locale.conf 

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Generating locales…”
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

locale-gen 

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Type your keymap to set it as default:”
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read keymap

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Editing /etc/vconsole.conf file…”
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sudo bash -c 'cat <<EOT >> '/etc/vconsole.conf'
KEYMAP=$keymap
EOT' 

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Type your locale to set it as default:”
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read locale 

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Editing /etc/locale.conf file...”
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sudo bash -c 'cat <<EOT >> '/etc/locale.conf'
LANG=$locale
EOT'

sleep 2

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

            ;;
        "Time zone")
            # TIMEZONE
        echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** To have a good time, you need to set a time zone"
echo "****** To change it, you have to choose your region and city"
echo "****** Executing ls command to show available choices..."
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sleep 3

ls /user/share/zoneinfo 

sleep 5 

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Type your region:”
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read region 

ls /usr/share/zoneinfo/$region 

sleep 5 

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Type your city:”
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read city 

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Setting your time zone...”
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sleep 2 

ln -sf /usr/share/zoneinfo/$region/$city

echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Generating /etc/adjtime...”
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

sleep 2 

hwclock --systohc 

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

            ;;
        "Hostname")
            # HOSTNAME
        echo ""
echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Set your hostname to let the other users find you in your local network"
echo "****** Type what you want:"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""

read hostname 

sudo bash -c 'cat <<EOT >> '/etc/hostname'
$hostname
EOT'

sleep 2 

echo "**************************************************"
echo "************************************************"
echo "******"
echo "****** Done!"
echo "******"
echo "************************************************"
echo "**************************************************"
echo ""
           ;;
        *) echo Invalid option;;
    esac
done

# Error
else
echo ""
fi
