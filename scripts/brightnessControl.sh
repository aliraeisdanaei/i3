#!/bin/bash

#Changes the brightness of the nth connected monitor
#argument one should be the number of connected monitor to change the brightness for
#argument three should be + - to go down or up, low, full, or tmpOff

scripts_folder=~/.config/i3/scripts

#setting the connected monitor as a variable
monitor=`$scripts_folder/get_monitor.sh $1`

brightness_file=.brightness_$1 
brightness_fullpath=$scipts_folder/$brightness_file

#setting the current brightness
brightness=`cat $scripts_folder/$brightness_file` || (echo 100 > $scripts_folder/$brightness_file && brightness=100)
if [ -z $brightness ]
then
   echo -n 100 > $scripts_folder/$brightness_file && brightness=100
fi

MAX=150
MIN=20

echo $monitor
echo $brightness

#function sets the brightness to the variable brightness
# echos the brightness to the brightness file
set_brightness(){
    xrandr --output $monitor --brightness `echo "scale=1; $brightness/100" | bc`
    echo -n $brightness > $scripts_folder/$brightness_file
    echo -n "$brightness_file content "
    echo `cat $brightness_file`
}

#note there is no validation for a hard set, this value can be anythin
if [[ $2 == "set" ]]
    then
        brightness=$3
        set_brightness
        echo -n "Brightness of $monitor has been set to $brightness %."
        exit
fi

if [[ $2 == "full" ]]
    then
        brightness=$MAX
        set_brightness
        echo -n "Brightness of $monitor has been set to $brightness %."
        exit
fi

if [[ $2 == "low" ]]
    then
        brightness=$MIN
        set_brightness
        echo -n "Brightness of $monitor has been set to $brightness %."
        exit
fi

#this does not set the brightness variable to 0, it just turns the brightness of screen to 0
if [[ $2 == "tmpOff" ]]
    then
        xrandr --output $monitor --brightness 0 
        exit
fi


if [[ $2 == "+" ]]
    then 
        if [ $brightness -lt $MAX ]
            then    
                let "brightness += 10"
                set_brightness
                echo "Brightness of $monitor has been increased to $brightness%."
                exit
        else
            echo -n cannot go higher than this
            exit 1
        fi
fi

if [[ $2 == "-" ]]
    then 
        if [ $brightness -gt $MIN ]
            then    
                let "brightness -= 10 "
                set_brightness
                echo "Brightness of $monitor has been decreased to $brightness%."
                exit
        else
            echo -n cannot go lower than this
            exit 1    
        fi
fi


#by default with no arguments the brightness will be set to the .brightness value
set_brightness
exit
