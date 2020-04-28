#!/bin/sh
set -euo pipefail

image=~/Documents/ocr.png
output=~/Documents/ocr

sleep 0.3
maim --select ${image}
mogrify -modulate 100,0 -resize 400% ${image}
convert ${image} -channel RGB -negate ${image}

tesseract -l jpn --psm 10 ${image} ${output} && cat ${output}.txt | sed 's/ //g' | tr -d '\n' | xclip -selection clipboard
