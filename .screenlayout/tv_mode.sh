#!/bin/sh
xrandr --output HDMI-0 --primary --mode 1920x1080
# xrandr --dpi 96 --output HDMI-0 --primary --mode 1920x1080
xrandr --output DVI-D-0 --off --output DP-4 --off --output DP-0 --off
bspc desktop 6 --to-monitor HDMI-0
bspc desktop 5 --to-monitor HDMI-0
bspc desktop 4 --to-monitor HDMI-0
bspc desktop 3 --to-monitor HDMI-0
bspc desktop 2 --to-monitor HDMI-0
bspc desktop 1 --to-monitor HDMI-0
bspc monitor HDMI-0 -d 1 2 3 4 5 6
bspc wm -r

while true; do mpg123 ~/.screenlayout/1-hour-of-silence.mp3 ; done
