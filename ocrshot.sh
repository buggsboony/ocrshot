#!/bin/bash

##Requirements 
# sudo pacman -S tesseract tesseract-data-eng tesseract-data-fra

mkdir -p /tmp/ocrshot
img_moved_file=/tmp/ocrshot/ocrshot_lastimage.png
outputTextFile=/tmp/ocrshot/ocrshot_lastimage

#spectacle -r -b -n #Ne fonctionne plus
#imgfile="$HOME/ocrshot_image.png"
imgfile="$HOME/pictures/screenshots/Screenshot_$(date +'%Y%m%d_%H%M%S').png" 
spectacle  -br -o "$imgfile"

line="$(cat ${HOME}/.config/spectaclerc | grep --color=never lastSaveLocation=)"
#imgfile="$(echo $line | tr ':' "\n" | tail -n 1)"



echo "fichier image : "
echo $imgfile


if [ -f $imgfile ];
then
echo "Analyzing '$imgfile'"
    tesseract $imgfile $outputTextFile -l eng
    mv $imgfile $img_moved_file
    kate --new $outputTextFile.txt
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