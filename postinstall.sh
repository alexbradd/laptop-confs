#!/bin/bash

cat packages.txt | xargs pacman -S

systemctl enable bluetooth.service
systemctl enable acpid.service
systemctl eamble fstrim.timer

echo "exec startkde" > ~/.xinitrc
systemctl enable sddm

useradd -m -g users -G wheel -s /bin/bash breadyx
passwd breadyx
EDITOR=nani visudo
