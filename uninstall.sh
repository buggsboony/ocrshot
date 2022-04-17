#!/bin/bash

#install stuff
what=${PWD##*/}  
what2=ocrshut 
extension=.sh
#peut être extension vide 
 
echo "killing running instances"
killall $what

echo "remove symbolic link from usr bin"
sudo rm /usr/bin/$what
sudo rm /usr/bin/$what2

echo "done."

