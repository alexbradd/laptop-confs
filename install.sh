#!/bin/bash

pacstrap /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt

ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
kwclock --systohc

nano /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=it" > /etc/vconsole.conf

echo "breadyx-laptop" > /etc/hostname
echo "127.0.0.1	localhost" > /etc/hosts
echo "::1 localhost" >> /etc/hosts
echo "127.0.1.1 breadyx-laptop.localdomain breadyx-laptop" >> /etc/hosts

mkinitcpio -p linux
passwd 

pacman -S grub efibootmgr
# mkdir /boot/efi
# mount /dev/sda1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=ARCH --efi-directory=/boot/efi
grub-mkconfig -o /boot/grub/grub.cfg
