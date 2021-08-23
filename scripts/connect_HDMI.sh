#!/bin/bash

# connects HDM1 to above the first connected monitor above if no argument of the placement is given (left, right, below, above), turns off HDMI1 if off is the argument

main_monitor=`./get_monitor.sh`

if [[ $1 == "" ]]
    then
        xrandr --output HDMI1 --auto --above $main_monitor
elif [[ $1 == "left" ]]
    then
        xrandr --output HDMI1 --auto --left-of $main_monitor
elif [[ $1 == "above" ]]
    then
        xrandr --output HDMI1 --auto --above $main_monitor
elif [[ $1 == "below" ]]
    then
        xrandr --output HDMI1 --auto --below $main_monitor
elif [[ $1 == "right" ]]
    then
        xrandr --output HDMI1 --auto --right-of $main_monitor
elif [[ $1 == "off" ]]
    then
        xrandr --output HDMI1 --off
fi
