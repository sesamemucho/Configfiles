#!/bin/sh
set -eu

extension=$1
shift
for i in "$@"
do
	episode=$(echo $i|grep -oP '.*E\d\d')
	subsync "$i" -i "$episode.jpn.$extension" --overwrite-input --max-offset-seconds 20 --vad webrtc
done
