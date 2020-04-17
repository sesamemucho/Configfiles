#!/bin/sh

xdotool search --classname Plexamp windowactivate || Plexamp.AppImage&
sleep 4
wmctrl -r Plexamp -t 1

