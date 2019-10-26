#!/bin/sh

episode=$(echo $3|grep -oP '.*S..E..')
echo $1
echo $2
echo $3
echo $episode
mkvextract tracks "$3" "$1:$episode.$2"
