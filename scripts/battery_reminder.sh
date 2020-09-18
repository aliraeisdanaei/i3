#!/bin/bash

zenity --error --text '<span foreground="green" font="32" >\n\nBattery Reminder Working.</span>' --title="Working!" --width=800 --height=400


while [ true ]
do 


    #this line outputs the percent of the battery 
    battery_percent=`cat /sys/class/power_supply/BAT0/capacity`



    #this line extracts if the battery is Discharging, or not. 
    battery_status=`acpi | cut -d " " -f3`
    LOW=25
    CRITICAL_LOW=15



   echo -n $battery_status $battery_percent


    if [ $battery_status = "Discharging," ]
        then
        if [ $battery_percent -le $CRITICAL_LOW ]
            then 
            # mplayer ~/.config/i3/scripts/sounds/WindowsXp_LowBattery_Sound.mp3
            espeak "Your batter is critically low."    
            zenity --error --text '<span foreground="red" font="32" >\n\nBattery level is CRITICAL!\nPLUG IN YOUR COMPUTER NOW!</span>' --title="CRITICAL BATTERY LEVEL!" --width=800 --height=400


        elif [ $battery_percent -le $LOW ]
            then
            # mplayer ~/.config/i3/scripts/sounds/WindowsXp_LowBattery_Sound.mp3  
            espeak "Your battery is low."  
            zenity --error --text '<span foreground="blue" font="32" >\n\nBattery level is LOW!\nPLUG IN YOUR COMPUTER!</span>' --title="LOW BATTERY LEVEL!" --width=800 --height=400

        fi
    fi

    sleep 260

done