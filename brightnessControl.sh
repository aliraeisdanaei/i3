#!/bin/bash

#Program uses xrandr to find the connected monitor
#increases or decrease brightness by set amount


#valid arguments: + -
#exit code 1: no argument
#exit code 2: invalid argument


#setting the connected monitor as a variable
monitor=`xrandr -q | grep ' connected' | head -n 1 | cut -d ' ' -f1` 

#setting an enviroment variable for the brightness of the monitor (1 always when booted)
export BRIGHTNESS=100


if [ $1="+" ]
    then 
        if [ $BRIGHTNESS -lt 100 ]
            then    
                let "BRIGHTNESS += 10 "
                #xrandr --output $monitor --brightness `echo "$BRIGHTNESS/100" | bc`
                echo "Brightness of $monitor has been increased to $BRIGHTNESS %."
                exit
        fi
fi

if [ $1="-" ]
    then 
        if [ $BRIGHTNESS -gt 40 ]
            then    
                let "BRIGHTNESS -= 10 "
                #xrandr --output $monitor --brightness `echo "$BRIGHTNESS/100" | bc`
                echo "Brightness of $monitor has been decreased to $BRIGHTNESS %."
                exit
        fi
fi

#increas or decrease brightness


echo invalid argument
exit 1




