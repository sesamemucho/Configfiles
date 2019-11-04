#!/usr/bin/env sh

compton &
xbanish &

#Xresources
xrdb ~/.Xresources &
dunst &
feh --randomize --bg-fill --no-xinerama ~/Pictures/* &
lightscreen -d &
redshift-gtk -l 48.458510:11.832830 -t 6500K:3800K &
sxhkd &
VBoxClient-all &
echo "started them all"
