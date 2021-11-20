#!/bin/bash

#This program runs in the background and every workTime minutes will emit sound
#It is designed to guide user to take 20 20 20 breaks

workTime=20
#converting the minutes into seconds
let workTime=$workTime*60 

breakTime=20


sleep 1
#mplayer ~/.config/i3/scripts/sounds/WindowsXp_Startup_Sound.mp3
echo "work" > ~/.config/i3/scripts/.20Timer && killall -SIGUSR1 i3status

while [ true ]
do
    sleep $workTime

    #shut screen down and make sound
   echo -n "take a break ##########################################################################"
    mplayer ~/.config/i3/scripts/sounds/soft_beep.mp3
    echo "break" > ~/.config/i3/scripts/.20Timer && killall -SIGUSR1 i3status
    
    
    sleep $breakTime
    echo -n "break over get back to work ##########################################################################"
    mplayer ~/.config/i3/scripts/sounds/soft_beep.mp3
    echo "work" > ~/.config/i3/scripts/.20Timer && killall -SIGUSR1 i3status

done    
