#!/bin/sh

OUTPUT=$(~/Programs/sanseido.py $(xclip -o))
echo $OUTPUT | xclip -sel clip
notify-send "$OUTPUT"
