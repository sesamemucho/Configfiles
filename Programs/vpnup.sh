#!/bin/sh

STATUS=$(nmcli connection up "ScandioVPN")
[ -n "$STATUS" ] && notify-send "$STATUS" || notify-send "Error... Already up?"
