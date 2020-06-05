#!/bin/sh
set -eu

extension=$1
shift
for i in "$@"
do
	episode=$(echo $i|grep -oP '.*E..')
	subsync "$i" -i "$episode.jpn.$extension" -o "$episode.jpn.$extension"
done
