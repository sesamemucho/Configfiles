#!/bin/sh

track=$1
extension=$2
lang=$3
shift
for i in "$@"
do
	episode=$(echo $i|grep -oP '.*S..E..')
	mkvextract tracks "$i" "$track:$episode.$lang.$extension"
done
