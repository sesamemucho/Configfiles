#!/bin/sh

for currentFile in "$@"
do
	ffmpeg -i "$currentFile" -vcodec copy -acodec aac -b:a 640k "${currentFile}.temp"
	rm "$currentFile"
	mv "${currentFile}.temp" "$currentFile"
done
