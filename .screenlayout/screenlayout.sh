#!/bin/sh
xrandr \
	--output DVI-D-0 --pos 0x0 --mode 1920x1080 \
	--output DP-4 --pos 1920x56 --mode 1280x1024 \
	--output HDMI-0 --off
bspc monitor DVI-D-0 -d 1 2 3
bspc monitor DP-4 -d 4 5 6
bspc wm -r
pkill mpg123
