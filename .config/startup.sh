#!/bin/sh

picom &
unclutter &

#Xresources
xrdb -merge ~/.Xresources &

feh --randomize --bg-fill --no-xinerama ~/Pictures/* &
export SXHKD_SHELL="/usr/bin/sh"
sxhkd &
~/Programs/notify-low-battery.sh &
# VBoxClient-all &
# setxkbmap -layout us -variant altgr-intl
systemctl --user start xfce4-notifyd
# xmodmap ~/.Xmodmap
sudo sh -c 'sysctl -w abi.vsyscall32=0' &
export GDK_CORE_DEVICE_EVENTS=1
# rg --files ~/.doom.d/ | entr ~/.emacs.d/bin/doom refresh
# notify-send (.emacs.d/bin/doom doctor | tail -2 | sed 's/\x1b\[[0-9;]*m//g')
echo "started them all"

