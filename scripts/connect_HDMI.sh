#!/bin/bash

# connects HDM1 to above the first connected monitor above if no argument of the placement is given (left, right, below, above), turns off HDMI1 if off is the argument

main_monitor=`./get_monitor.sh` # path for the scripts call
if [ -z $main_monitor ]
then
    main_monitor=`~/.config/i3/scripts/get_monitor.sh` # path for the i3 config
fi

if [[ $1 == "" ]]
    then
        xrandr --output "HDMI-1" --auto --above $main_monitor
elif [[ $1 == "left" ]]
    then
        xrandr --output "HDMI-1" --auto --left-of $main_monitor
elif [[ $1 == "above" ]]
    then
        xrandr --output "HDMI-1" --auto --above $main_monitor
elif [[ $1 == "below" ]]
    then
        xrandr --output "HDMI-1" --auto --below $main_monitor
elif [[ $1 == "right" ]]
    then
        xrandr --output "HDMI-1" --auto --right-of $main_monitor
elif [[ $1 == "off" ]]
    then
        xrandr --output "HDMI-1" --off
fi
