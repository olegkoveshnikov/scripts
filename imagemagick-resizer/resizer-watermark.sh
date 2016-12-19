#!/bin/bash
#
# Resize images with watermark
# Author: https://github.com/olegkoveshnikov
#

if [ -d photos ]; then
	rm -rf photos
fi

mkdir photos

for img in ./*
do
	filename=$(basename "$img")
	filename="${filename%.*}"
	
	convert "$img" -auto-orient -resize 1000x800 -quality 85% "photos/$filename.jpg"
	composite -gravity SouthEast -geometry +40+40 w.png "photos/$filename.jpg" "photos/$filename.jpg"
done;

mogrify -strip photos/*.jpg
