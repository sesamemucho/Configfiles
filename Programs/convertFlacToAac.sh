#!/bin/sh
#TODO output file must end in mkv
for currentFile in "$@"
do
	ffmpeg -i "$currentFile" -vcodec copy -acodec aac -b:a 640k "${currentFile}.temp.mkv"
	rm "$currentFile"
	mv "${currentFile}.temp.mkv" "$currentFile"
done
