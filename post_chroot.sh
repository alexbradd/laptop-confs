#!/bin/bash

#CLOCK
echo "Settings clock..."
ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
kwclock --systohc

#LOCALE
echo "Opening nano for locale gen..."
sleep 2s; nano /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=it" > /etc/vconsole.conf

#HOST
echo "breadyx-laptop" > /etc/hostname
echo "127.0.0.1	localhost" > /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 breadyx-laptop.localdomain breadyx-laptop" >> /etc/hosts

#MKINIT
mkinitcpio -p linux

#ROOT PASSWD
echo "Selecting root passwd..."
passwd root

#BOOTLOADER
echo "Installing grub"
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --bootloader-id=ARCH --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg 

#USER
echo "Enter username:"
read USER
useradd -m -g users -G wheel -s /bin/bash $USER
passwd $USER

echo "Opening nano to set sudo privileges..."
sleep 2s; EDITOR=nano visudo

exit
