#!/bin/bash

# script outputs the connected monitor number specified by the first argument, if not has been specified, it returns the first one

if [[ $1 == "" ]]
    then
        monitor=`xrandr -q | grep ' connected' | sed '1q;d' | cut -d ' ' -f1`
else
        monitor=`xrandr -q | grep ' connected' | sed $1'q;d' | cut -d ' ' -f1`
fi

echo $monitor

exit 0
