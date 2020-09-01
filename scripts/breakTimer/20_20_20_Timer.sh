#!/bin/bash

#This program runs in the background and every workTime minutes will shutdown the screen make a sound 
#and wait breakTime to load back up with a sound
#It is designed to guide user to take 20 20 20 breaks

workTime=20
#converting the minutes into seconds
let workTime=$workTime*60 

breakTime=20


sleep 1
mplayer ~/.config/i3/scripts/sounds/WindowsXp_Startup_Sound.mp3


while [ true ]
do
    sleep $workTime

    #shut screen down and make sound
    echo "take a break"
    mplayer ~/.config/i3/scripts/sounds/WindowsXp_Shutdown_Sound.mp3
    $HOME/.config/i3/scripts/brightnessControl.sh tmpOff
    
    
    sleep $breakTime
    echo "break over get back to work"
    $HOME/.config/i3/scripts/brightnessControl.sh
    mplayer ~/.config/i3/scripts/sounds/WindowsXp_Startup_Sound.mp3

    

done    