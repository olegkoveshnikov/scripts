#!/bin/bash

if [ -d photos ]; then
	rm -rf photos
fi

mkdir photos

for img in ./*
do
	filename=$(basename "$img")
	filename="${filename%.*}"
	
	convert "$img" -resize 800x600 -quality 85% "photos/$filename.jpg"
done;

mogrify -strip photos/*.jpg
