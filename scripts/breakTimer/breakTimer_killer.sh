#!/bin/bash

#this script kills the 20_20_20_Timer.sh and battery_reminder.sh and if successful gives a sound


if ps -ef | grep 20_20_20_Timer.sh | grep -v grep | awk '{print $2}' | xargs kill -9 ; then
    mplayer ~/.config/i3/scripts/sounds/WindowsXp_Error_Sound.mp3    
fi

ps -ef | grep battery_reminder.sh | grep -v grep | awk '{print $2}' | xargs kill -9 