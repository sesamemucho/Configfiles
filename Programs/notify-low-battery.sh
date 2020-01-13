#!/bin/sh

while true
do
	POWER_PERCENT=$(upower -i /org/freedesktop/UPower/devices/DisplayDevice | rg "percentage" | awk '{print $2}' | sed 's/\%//g')
	if [ ! -z "$POWER_PERCENT" ] && [ "$POWER_PERCENT" -lt 20 ]
	then
		if type beep >/dev/null 2>&1
		then
			beep
		fi
		notify-send "Power below $POWER_PERCENT%" "Connect charging device!"
	fi
	sleep 300
done
