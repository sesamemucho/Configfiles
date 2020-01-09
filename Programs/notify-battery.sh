#!/bin/sh

upower -i /org/freedesktop/UPower/devices/DisplayDevice | rg "percentage|time to empty" | xargs -d '\t' notify-send
