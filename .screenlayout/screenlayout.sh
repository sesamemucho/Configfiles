#!/bin/sh
xrandr --dpi 144 \
	--output DVI-D-0 --pos 0x570 --mode 1920x1080 --scale 1.5x1.5 \
	--output DP-0 --pos 2880x0 --primary --mode 3840x2160 \
	--output DP-4 --pos 6720x570 --mode 1280x1024 --scale 1.5x1.5 \
	--output HDMI-0 --off
bspc desktop 1 --to-monitor DP-0
bspc desktop 2 --to-monitor DP-0
bspc desktop 3 --to-monitor DVI-D-0
bspc desktop 4 --to-monitor DVI-D-0
bspc desktop 5 --to-monitor DP-4
bspc desktop 6 --to-monitor DP-4
bspc monitor DP-0 -d 1 2
bspc monitor DVI-D-0 -d 3 4
bspc monitor DP-4 -d 5 6
bspc wm -r

