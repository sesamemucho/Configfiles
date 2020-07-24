#!/bin/sh

picom &
unclutter &
nyrna &
clipmenud &
keynav &

#Xresources
xrdb -merge ~/.Xresources &

feh --randomize --bg-fill --no-xinerama ~/Pictures/* &
export SXHKD_SHELL="/usr/bin/sh"
export CM_LAUNCHER=rofi
sxhkd &
~/Programs/notify-low-battery.sh &
# VBoxClient-all &
# sudo localectl set-x11-keymap us _ altgr-intl ctrl:swapcaps_hyper
# setxkbmap -layout us -variant altgr-intl
/usr/lib/xfce4/notifyd/xfce4-notifyd &
# sudo sh -c 'sysctl -w abi.vsyscall32=0' &
export GDK_CORE_DEVICE_EVENTS=1
# rg --files ~/.doom.d/ | entr ~/.emacs.d/bin/doom refresh
# notify-send (.emacs.d/bin/doom doctor | tail -2 | sed 's/\x1b\[[0-9;]*m//g')
echo "started them all"

