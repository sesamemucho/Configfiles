#!/bin/sh

STATUS=$(nmcli connection down "Scandio VPN")
[ -n "$STATUS" ] && notify-send "$STATUS" || notify-send "Error... Already down?"
