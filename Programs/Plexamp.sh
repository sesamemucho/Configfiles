#!/bin/sh

wmctrl -a Plexamp || Plexamp.AppImage&
sleep 8
wmctrl -r Plexamp -t 1

