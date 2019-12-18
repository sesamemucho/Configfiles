#!/usr/bin/env sh

compton &
xbanish &

#Xresources
xrdb ~/.Xresources &
dunst &
feh --randomize --bg-fill --no-xinerama ~/Pictures/* &
lightscreen -d &
redshift-gtk -l 48.458510:11.832830 -t 6500K:3800K &
sxhkd &
VBoxClient-all &
xmodmap ~/.Xmodmap
rg --files ~/.doom.d/ | entr ~/.emacs.d/bin/doom refresh
notify-send (.emacs.d/bin/doom doctor | tail -2 | sed 's/\x1b\[[0-9;]*m//g')
echo "started them all"

