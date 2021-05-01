#!/bin/bash

#install stuff
what=${PWD##*/}   
extension=.sh
#peut être extension vide

sudo pacman -S spectacle
sudo pacman -S tesseract tesseract-data-eng tesseract-data-fra

echo "Set executable..."
chmod +x $what$extension
#echo "lien symbolique vers usr bin"
sudo ln -s "$PWD/$what$extension" /usr/bin/$what
echo "done."
