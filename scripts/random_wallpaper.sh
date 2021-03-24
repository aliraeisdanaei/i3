#!/bin/bash

# every wait time it gets a random wallpaper from ~/.wallpapers
# then uses feh to draw it on the screen

changeTime=60
while [ true ]
do
    file=`find ~/.wallpapers | shuf -n1`
    echo $file
    feh --bg-fill $file

    sleep $changeTime

done
