#!/bin/bash

# INIT
loadkeys it
timedatectl set-ntp true

#PARTITIONING
echo -e "Starting bash shell for formatting/mounting drives.\nYou should mount everything in /mnt subdirs (ex.: /mnt/home for home partition ecc...). When you're ready just logout by typing exit or pressing CTRL+D..."
bash
read INPUT
echo "Are you ready ?[y/n]"
if [ $INPUT != "y" ]; then echo "Aborting..."; return 1; fi
echo "Hope you monunted everything because were strapping..."

#PACSTRAP
pacstrap /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab

#CHROOT
echo "Setting up post-chroot..."
cp post_chroot.sh /mnt
arch-chroot /mnt /post_chroot.sh

#Cleanup
rm /mnt/post_chroot.sh
echo "To complete the installation, run postinstall.sh after a reboot"
exit
