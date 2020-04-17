#!/bin/sh

STATUS=$(nmcli connection up "Scandio VPN")
[ -n "$STATUS" ] && notify-send "$STATUS" || notify-send "Error... Already up?"
