#!/bin/sh

status=$(nmcli connection up "Scandio VPN")

notify-send "$status"
