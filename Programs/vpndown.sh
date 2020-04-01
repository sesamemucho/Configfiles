#!/bin/sh

status=$(nmcli connection down "Scandio VPN")

notify-send "$status"
