#!/bin/sh

echo "Updating firmware ..."
fw_update

echo "Installing Useful developer packages ..."
pkg_add openbox obconf obmenu windowmaker windowmaker-extra
pkg_add vim bash htop alacritty
pkg_add go python3 firefox
ln -s -f yourloginpics /home/aimbrock/.face
chown aimbrock:aimbrock /home/aimbrock/.face
sed -i 's/xconsole/#xconsole/' /etc/X11/xenodm/Xsetup_0
sed -i 's/vt220/pccon0/' /etc/ttys

echo "Adding aimbrock user to additional groups ..."
usermod -G operator aimbrock
usermod -G wheel aimbrock
echo "permit persist :wheel" >> /etc/doas.conf
rcctl enable messagebus
rcctl start messagebus
rcctl enable apmd
rcctl start apmd
#echo "exec startxfce4" > /home/aimbrock/.xsession
echo "exec openbox-session" > /home/aimbrock/.xsession
chown aimbrock:aimbrock /home/aimbrock/.xsession

echo "TODO: Under Window Manager Tweaks"
echo "[x] Hide title of windows when maximized"

echo "Add config example for wifi that can be copied 

echo "Reboot system for changes to take affect"
