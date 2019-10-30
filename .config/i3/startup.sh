#!/usr/bin/env sh

VBoxClient-all &
compton &
xbanish &

exec_always --no-startup-id ~/.config/i3/polybar.sh &

#Xresources
exec_always xrdb ~/.Xresources
exec dunst
exec feh --randomize --bg-fill --no-xinerama ~/Pictures/*
exec --no-startup-id lightscreen -d
exec --no-startup-id redshift-gtk -l 48.458510:11.832830 -t 6500K:3800K

