#!/bin/sh

while true
do
	POWER_PERCENT=$(upower -i /org/freedesktop/UPower/devices/DisplayDevice | rg "percentage" | awk '{print $2}' | sed 's/\%//g')
	if [ "$POWER_PERCENT" \< 20 ]
		then
			beep
			notify-send "Power below $POWER_PERCENT%" "Connect charging device!"
	fi
	sleep 300
done
