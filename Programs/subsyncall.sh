#!/bin/sh
set -euo pipefail

extension=$1
shift
for i in "$@"
do
	episode=$(echo $i|grep -oP '.*S..E..')
	subsync "$i" -i "$episode.jpn.$extension" -o "$episode.jpn.$extension"
done
