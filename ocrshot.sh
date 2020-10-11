#!/bin/bash

##Requirements 
# sudo pacman -S tesseract tesseract-data-eng tesseract-data-fra

mkdir -p /tmp/ocrshot
img_moved_file=/tmp/ocrshot/ocrshot_lastimage.png
outputTextFile=/tmp/ocrshot/ocrshot_lastimage

spectacle -r -b -n

line="$(cat ${HOME}/.config/spectaclerc | grep --color=never lastSaveLocation=)"
imgfile="$(echo $line | tr ':' "\n" | tail -n 1)"

if [ -f $imgfile ];
then
echo "Analyzing '$imgfile'"
    tesseract $imgfile $outputTextFile -l eng
    mv $imgfile $img_moved_file
    kate $outputTextFile.txt
else
    echo "Oups file not found"
fi

# pifs=$IFS
# IFS=';'
# line=$(cat ${HOME}/.config/spectaclerc | grep --color=never lastSaveLocation=)
# pifs=$IFS
# IFS='='
# read -a strarr <<< "$line"
# IFS=pifs
# echo ${strarr[1]}