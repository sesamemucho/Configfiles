#!/bin/sh

STATUS=$(nmcli connection up "ScandioVPN" $(gopass show -o Account/scandio.de/jdehner))
[ -n "$STATUS" ] && notify-send "$STATUS" || notify-send "Error... Already up?"
