#!/bin/sh
set -euo pipefail

image=~/Documents/ocr.png
output=~/Documents/ocr

sleep 0.3
scrot --overwrite --select --quality 100 ${image}
mogrify -modulate 100,0 -resize 400% ${image}
convert ${image} -channel RGB -negate ${image}

tesseract -l jpn --psm 13 ${image} ${output} && cat ${output}.txt | sed 's/ //g' | tr -d '\n' | xclip -selection clipboard