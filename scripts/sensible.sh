#!/bin/sh

window=`xdotool getwindowfocus`
WIDTH=$(xwininfo -id $window | grep -E '(Width)' | awk '{print $2}')
HEIGHT=$(xwininfo -id $window | grep -E '(Height)' | awk '{print $2}')
if [ $WIDTH -gt $HEIGHT ]; then
    echo horizontal
    echo $WIDTH
    echo $HEIGHT
    i3-msg "split h"
else
    echo vertical
    echo $WIDTH
    echo $HEIGHT
    i3-msg "split v"
fi
