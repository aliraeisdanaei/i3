#!/bin/bash

#Program uses xrandr to find the connected monitor
#increases or decrease brightness by set amount
#stores the brightness in the current directory as .brightness
#with no arguments it sets the brightness to that value




#setting the connected monitor as a variable
monitor=`xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1` 
# echo $monitor

#setting the current brightness
brightness=`cat ./.brightness` || (echo 100 > ./.brightness && brightness=100)

# echo $brightness

MAX=150
MIN=60

#function sets the brightness to the variable brightness
set_brightness(){
    xrandr --output $monitor --brightness `echo "scale=1; $brightness/100" | bc`
    echo $brightness > ./.brightness
}


#note there is no validation for a hard set, this value can be anything
if [[ $1 == "set" ]]
    then
        brightness=$2
        set_brightness
        echo "Brightness of $monitor has been set to $brightness %."
        exit
fi

if [[ $1 == "full" ]]
    then
        brightness=$MAX
        set_brightness
        echo "Brightness of $monitor has been set to $brightness %."
        exit
fi

if [[ $1 == "low" ]]
    then
        brightness=$MIN
        set_brightness
        echo "Brightness of $monitor has been set to $brightness %."
        exit
fi

if [[ $1 == "+" ]]
    then 
        if [ $brightness -lt $MAX ]
            then    
                let "brightness += 10 "
                set_brightness
                echo "Brightness of $monitor has been increased to $brightness%."
                exit
        fi
    echo cannot go higher than this
    exit 1
fi

if [[ $1 == "-" ]]
    then 
        if [ $brightness -gt $MIN ]
            then    
                let "brightness -= 10 "
                set_brightness
                echo "Brightness of $monitor has been decreased to $brightness%."
                exit
        fi
    echo cannot go lower than this
    exit 1    
fi

#by default with no arguments the brightness will be set to the .brightness value
set_brightness
exit




