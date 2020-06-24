#!/bin/sh

wmctrl -a Plexamp || Plexamp.AppImage --disable-seccomp-filter-sandbox &
sleep 8
wmctrl -r Plexamp -t 5

