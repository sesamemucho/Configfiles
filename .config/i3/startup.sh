#!/usr/bin/env sh

VBoxClient-all &
compton &
xbanish &

~/.config/i3/polybar.sh &

#Xresources
xrdb ~/.Xresources
dunst
feh --randomize --bg-fill --no-xinerama ~/Pictures/*
--no-startup-id lightscreen -d
--no-startup-id redshift-gtk -l 48.458510:11.832830 -t 6500K:3800K

