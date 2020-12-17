#!/bin/sh
xrandr \
	--output DVI-D-0 --pos 0x0 --mode 1920x1080 \
	--output DP-0 --pos 1920x56 --mode 1280x1024 \
	--output HDMI-0 --off
bspc monitor DVI-D-0 -d 1
bspc monitor DP-0 -d 2
bspc wm -r
killall tv_mode.sh
killall mpg123
