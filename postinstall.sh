#!/bin/bash

xargs pacman -S --noconfirm < packages.txt

cp -rf root/* /

systemctl enable bluetooth.service
systemctl enable acpid.service
systemctl enable fstrim.timer
systemctl enable NetworkManager

systemctl enable tlp.service
systemctl enable tlp-sleep.service
systemctl mask systemd-rfkill.service
systemctl mask systemd-rfkill.socket

systemctl enable rc.service
systemctl enable undervolt.service
