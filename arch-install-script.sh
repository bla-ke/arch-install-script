#!/bin/bash

echo ""
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^"
echo "^^^^^^ Language/Język:"
echo "^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
echo ""

# Options
PS3='Please enter your choice: '
options=("English (en)" "Polski (pl)" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "English (en)")
        while :
        do
            clear
            cat<<EOF
            ==============================
            Arch Linux Install Script's menu
            ------------------------------
            Please enter your choice:
            Load keymaps (1)
            Wi-Fi Configuration (2)
            Update the system clock (3)
            Partite the Disk (4)
            Make file systems (5)
            Formate and enable swap partition (6)
            Mount the partitions (7)
            Download base/base-devel packages (8)
            Generate fstab config file (9)
            Chroot (10)
            Time zone (11)
            Generate locales (12)
            Hostname (13)
            NetworkManager (14)
            Recreate initramfs (15)
            Set root password (16)
            Create a new user (17)
            Install GRUB2 (18)
            Install desktop enviroments (19)
            Logout and reboot (20)
                   (Q)uit
            Author: Daria Szatan (bla-ke)
            License: MIT License
            ------------------------------
EOF
            read
            case "$REPLY" in
            "1")
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

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

            ;;
            "2")
            # WI-FI CONFIGURATION
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** If you use Ethernet, skip this step"
            echo "****** This script is going to start wifi-menu tool"
            echo "****** It will let you to connect to your Wi-Fi"
            echo "****** After 5 seconds your Internet connection is going to be checked"
            echo "****** Waiting 3 seconds..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 3

            wifi-menu

            sleep 5

            ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null && echo "****** Your network is working correctly! :)" || echo "****** Error! No network connection! :("

            ;;
            "3")
            # SYSTEM CLOCK UPDATE
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

            ;;
            "4")
            # DISK PARTITIONING
            echo ""
            echo "**************************************************"
            echo "************************************************"
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

              sleep 2

              lsblk

              sleep 2

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Which disk would you like to pull changes?"
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
              echo "****** Executing cfdisk in 3 seconds..."
              echo "****** If you don't know how to use it, read Arch Wiki!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 3

              cfdisk /dev/$disk

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Done!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            else
              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Aborted!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            fi

            ;;
            "5")
            # MAKING FILE SYSTEMS
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** You have chosen making file systems. Don't forget to do that for every partition! Needed things:"
            echo "****** sdXY (X - letter, Y - number)"
            echo "****** File system"
            echo "****** Showing your disks and partitions..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 2

            lsblk

            sleep 2

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

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Done!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            else
              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Aborted!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

            fi

            ;;
            "6")
            # SWAP
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Type your swap partition..."
            echo "****** Sheme: sdXY (X - letter, Y - number)"
            echo "****** Showing your disks and partitions..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 2

            lsblk

            sleep 2

            read swap_partition

            mkswap /dev/$swap_partition

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

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

              mount /dev/$swap_partition

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Done!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            else
              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Aborted!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            fi

            ;;
            "7")
            # MOUNT
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

            sleep 2

            lsblk

            sleep 2

            read root_partition

            mount /dev/$root_partition /mnt

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

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
              echo "****** Type your home partition..."
              echo "****** Sheme: sdXY (X - letter, Y - number)"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 2

              lsblk

              sleep 2

              read home_partition

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Making /mnt/home directory..."
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              mkdir /mnt/home

              mount /dev/$home_partition /mnt/home

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Done!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            else
              sleep 1

              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Aborted!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            fi

            ;;
            "8")
            # PACSTRAP
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Downloading the base packages..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            pacstrap /mnt base

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

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

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Done!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            else
              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Aborted!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            fi

            ;;
            "9")
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

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            ;;
            "10")
            #ARCH-CHROOT
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Do you want to change root (use it only when everything before is done)?"
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
              echo "****** Chrooting..."
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              arch-chroot /mnt

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Done!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            else
              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Aborted!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            fi

            ;;
            "11")
            # TIME ZONE
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

            sleep 2

            ls /user/share/zoneinfo

            sleep 2

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Type your region:"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            read region

            sleep 2

            ls /usr/share/zoneinfo/$region

            sleep 2

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Type your city:"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            read city

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Setting your time zone..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            ln -sf /usr/share/zoneinfo/$region/$city

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Generating /etc/adjtime..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            hwclock --systohc

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

            ;;
            "12")
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

            nano /etc/locale.gen

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Generating locales..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            locale-gen

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Type your keymap to set it as default:"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            read keymap

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Editing /etc/vconsole.conf file..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            bash -c 'cat <<EOT >> '/etc/vconsole.conf'
            KEYMAP=$keymap
            EOT'

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Type your locale to set it as default:"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            read locale

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Editing /etc/locale.conf file..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            bash -c 'cat <<EOT >> '/etc/locale.conf'
            LANG=$locale
            EOT'

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

            ;;
            "13")
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

            bash -c 'cat <<EOT >> '/etc/hostname'
            $hostname
            EOT'

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Editing /etc/hosts file..."
            echo "******"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            bash -c 'cat <<EOT >> '/etc/hosts'
            127.0.1.1 $hostname.localdomain $hostname
            EOT'

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

            ;;
            "14")
            # NETWORKMANAGER
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** NetworkManager gives you a possibility to connect to your network"
            echo "****** Do you want to install it?"
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
              echo "****** Installing required packages..."
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              pacman -S NetworkManager

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Done!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Enabling and starting NetworkManager by using systemd..."
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              systemctl enable NetworkManager.service && systemctl start NetworkManager.service

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Done!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Do you want to connect to your Wi-Fi?"
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
                echo "****** Type your network SSID:"
                echo "******"
                echo "************************************************"
                echo "**************************************************"
                echo ""

                read network_ssid

                sleep 1

                echo ""
                echo "**************************************************"
                echo "************************************************"
                echo "******"
                echo "****** Type your network password:"
                echo "******"
                echo "************************************************"
                echo "**************************************************"
                echo ""

                read network_password

                sleep 1

                echo ""
                echo "**************************************************"
                echo "************************************************"
                echo "******"
                echo "****** Type your network interface:"
                echo "******"
                echo "************************************************"
                echo "**************************************************"
                echo ""

                sleep 2

                ip addr show

                sleep 2

                read network_interface

                sleep 1

                echo ""
                echo "**************************************************"
                echo "************************************************"
                echo "******"
                echo "****** Type your profile name:"
                echo "******"
                echo "************************************************"
                echo "**************************************************"
                echo ""

                read network_profile_name

                sleep 1

                echo ""
                echo "**************************************************"
                echo "************************************************"
                echo "******"
                echo "****** Connecting to your Wi-Fi..."
                echo "******"
                echo "************************************************"
                echo "**************************************************"
                echo ""

                nmcli dev wifi connect $network_ssid password $network_password iface $network_interface $network_profile_name

                sleep 1

                echo ""
                echo "**************************************************"
                echo "************************************************"
                echo "******"
                echo "****** Done! Check it later!"
                echo "******"
                echo "************************************************"
                echo "**************************************************"
                echo ""

                sleep 1

              else
                sleep 1

                echo ""
                echo "**************************************************"
                echo "************************************************"
                echo "******"
                echo "****** Aborted!"
                echo "******"
                echo "************************************************"
                echo "**************************************************"
                echo ""

                sleep 1

              fi

            else
              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Aborted!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            fi

            ;;
            "15")
            # RECREATE INITRAMFS
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** You have chosen recreating initramfs"
            echo "****** Don't worry, if you notice warnings"
            echo "****** Waiting 5 seconds..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 5

            mkinitcpio -p linux

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

            ;;
            "16")
            # CHANGE ROOT PASSWORD
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Because of security, you need to change root password"
            echo "****** It shouldn't be easy to guess and have special characters/numbers"
            echo "****** Executing command passwd in 5 seconds..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 5

            passwd

            sleep 1

            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Done!"
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

            ;;
            "17")
            # CREATE A NEW USER
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** You have chosen creating a new user..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            # Options
            PS3='Please enter your choice: '
            options=("Normal user" "User with administrator privileges" "Quit")
            select opt in "${options[@]}"
            do
                case $opt in
                    "Normal user")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Type new user's name:"
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    read user_name

                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Creating a new user..."
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    useradd -m -G users -s /bin/bash $user_name

                    sleep 1

                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Setting a new password for $user_name"
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    passwd $user_name

                    sleep 1

                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Done!"
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    sleep 1

                    ;;
                    "User with administrator privileges")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Type new user with administrator privileges's name:"
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    read $user_admin_name

                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Creating a new user..."
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    useradd -m -G wheel -s /bin/bash $user_admin_name

                    sleep 1

                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Setting a new password for $user_admin_name..."
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    passwd $user_admin_name

                    sleep 1

                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Adding $user_admin_name to /etc/sudoers..."
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    bash -c 'cat <<EOT >> '/etc/vconsole.conf'
                    $user_admin_name ALL=(ALL) PASSWD: ALL
                    EOT'

                    sleep 1

                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Done!"
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    sleep 1

                    ;;
                    "Quit")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Aborting..."
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    sleep 1

                    break
                  esac
                done

            ;;
            "18")
            # INSTALL GRUB
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** GRUB lets you to load OS from your hard disk"
            echo "****** Do you want to install it?"
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
              echo "****** Installing required packages..."
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              pacman -S grub os-prober

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Done!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Type your disk, where you want to install GRUB:"
              echo "****** (sdX)"
              echo "****** Where X is a letter of you disk"
              echo "******"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 2

              lsblk

              sleep 2

              read disk_grub

              grub-install /dev/$disk_grub

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Done!"
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Making a configuration file..."
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              grub-mkconfig -o /boot/grub/grub.cfg

              sleep 1

              echo ""
              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Done!"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              sleep 1

            else
              sleep 1

              echo "**************************************************"
              echo "************************************************"
              echo "******"
              echo "****** Aborted!"
              echo "************************************************"
              echo "**************************************************"
              echo ""

            fi

            ;;
            "19")
            # INSTALL DESKTOP ENVIROMENTS
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** You have chosen installing desktop enviroments..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            # Options
            PS3='Please enter your choice: '
            options=("GNOME" "Plasma" "MATE" "Cinnamon" "Xfce" "LXDE" "Openbox" "Fluxbox" "Quit")
            select opt in "${options[@]}"
            do
                case $opt in
                    "GNOME")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Do you want to install gnome and gnome-extra packages?"
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
                      echo "****** Installing gnome and gnome-extra packages..."
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      pacman -S gnome gnome-extra

                      sleep 1

                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Done!"
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      sleep 1

                      break

                    else
                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Installing gnome packages..."
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      pacman -S gnome

                      sleep 1

                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Done!"
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      break

                    fi

                    ;;
                    "Plasma")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Do you want to install full plasma?"
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
                      echo "****** Installing all plasma packages..."
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      pacman -S plasma

                      sleep 1

                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Done!"
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      sleep 1

                      break

                    else
                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Installing plasma-desktop packages..."
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      pacman -S plasma-desktop

                      sleep 1

                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Done!"
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      sleep 1

                      break

                    fi

                    ;;
                    "MATE")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Do you want to install mate and mate-extra packages?"
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
                      echo "****** Installing mate and mate-extra packages..."
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      pacman -S mate mate-extra

                      sleep 1

                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Done!"
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      sleep 1

                      break

                    else
                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Installing mate packages..."
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      pacman -S mate

                      sleep 1

                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Done!"
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      sleep 1

                      break

                    fi

                    ;;
                    "Cinnamon")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Installing cinnamon packages..."
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    pacman -S cinnamon

                    sleep 1

                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Done!"
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    sleep 1

                    break

                    ;;
                    "Xfce")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Do you want to install xfce4 and xfce4-goodies packages?"
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
                      echo "****** Installing xfce4 and xfce4-goodies packages..."
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      pacman -S xfce4 xfce4-goodies

                      sleep 1

                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Done!"
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      sleep 1

                      break

                    else
                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Installing xfce4 packages..."
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      pacman -S xfce4

                      sleep 1

                      echo ""
                      echo "**************************************************"
                      echo "************************************************"
                      echo "******"
                      echo "****** Done!"
                      echo "******"
                      echo "************************************************"
                      echo "**************************************************"
                      echo ""

                      sleep 1

                      break

                    fi

                    ;;
                    "LXDE")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Installing lxde packages..."
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    pacman -S lxde

                    sleep 1

                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Done!"
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    sleep 1

                    break

                    ;;
                    "Openbox")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Installing openbox packages..."
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    pacman -S openbox

                    sleep 1

                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Done!"
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    sleep 1

                    break

                    ;;
                    "Fluxbox")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Installing fluxbox packages..."
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    pacman -S fluxbox

                    sleep 1

                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Done!"
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    sleep 1

                    break

                    ;;
                    "Quit")
                    echo ""
                    echo "**************************************************"
                    echo "************************************************"
                    echo "******"
                    echo "****** Aborting..."
                    echo "******"
                    echo "************************************************"
                    echo "**************************************************"
                    echo ""

                    sleep 1

                    break
                  esac
                done

            ;;
            "20")
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** You have chosen logouting and rebooting"
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
              echo "****** Logouting and rebooting..."
              echo "******"
              echo "************************************************"
              echo "**************************************************"
              echo ""

              bash -c 'exit'

              reboot

            else
              echo ""

            fi

            ;;
            "Q")
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Exiting..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

            break

            ;;
            "q")
            echo ""
            echo "**************************************************"
            echo "************************************************"
            echo "******"
            echo "****** Exiting..."
            echo "******"
            echo "************************************************"
            echo "**************************************************"
            echo ""

            sleep 1

            break

            ;;
          esac

        done

        ;;
        "Polski (pl)")
        ;;

        "Quit")
        echo ""
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo "^^^^^^"
        echo "^^^^^^ Exiting..."
        echo "^^^^^^"
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
        echo ""

        sleep 1

        break
      esac
    done
