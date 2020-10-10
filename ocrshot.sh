#!/bin/bash

##Requirements 
# sudo pacman -S tesseract tesseract-data-eng tesseract-data-fra


outputfile=/tmp/ocrshot.png

spectacle -r -b -o $outputfile

line="$(cat ${HOME}/.config/spectaclerc | grep --color=never lastSaveLocation=)"
img="$(echo $line | tr ':' "\n" | tail -n 1)"

tesseract $img ocrshot_file -l eng

kate ocrshot_file.txt

# pifs=$IFS
# IFS=';'
# line=$(cat ${HOME}/.config/spectaclerc | grep --color=never lastSaveLocation=)
# pifs=$IFS
# IFS='='
# read -a strarr <<< "$line"
# IFS=pifs
# echo ${strarr[1]}