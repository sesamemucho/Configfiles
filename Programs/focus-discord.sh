#!/bin/sh
IFS=$'\n\t'

uids=$(xdotool search --classname discord)


for uid in ${uids[@]}; do
	echo $uid
	xdotool windowactivate $uid
done
