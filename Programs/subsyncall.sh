#!/bin/sh

for i in "$@"
do
	episode=$(echo $i|grep -oP '.*S..E..')
	subsync "$i" -i "$episode.jpn.srt" -o "$episode.jpn.srt"
done
