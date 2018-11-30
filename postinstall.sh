#!/bin/bash

cat packages.txt | xargs pacman -S

systemctl enable bluetooth.service
systemctl enable acpid.service
systemctl enable fstrim.timer
systemctl enable NetworkManager

systemctl enable tlp.service
systemctl enable tlp-sleep.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

echo "exec startkde" > ~/.xinitrc
systemctl enable sddm
