#!/bin/sh

STATUS=$(nmcli connection down "ScandioVPN")
[ -n "$STATUS" ] && notify-send "$STATUS" || notify-send "Error... Already down?"
