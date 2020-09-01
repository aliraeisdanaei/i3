#!/bin/bash



while [ true ]
do
    #this line outputs the percent of the battery 
    battery_percent=`cat /sys/class/power_supply/BAT0/capacity`

    #this line extracts if the battery is Discharging, or not. 
    battery_stauts=`acpi | cut -d " " -f3`
    LOW=35
    CRITICAL_LOW=25


    if [ $battery_stauts = "Discharging," ]
        then
        if [ $battery_percent -le $CRITICAL_LOW ]
            then 
            mplayer ~/.config/i3/scripts/sounds/WindowsXp_LowBattery_Sound.mp3    
            zenity --error --text '<span foreground="red" font="32" >\n\nBattery level is CRITICAL!\nPLUG IN YOUR COMPUTER NOW!</span>' --title="CRITICAL BATTERY LEVEL!" --width=800 --height=400


        elif [ $battery_percent -le $LOW ]
            then
            mplayer ~/.config/i3/scripts/sounds/WindowsXp_LowBattery_Sound.mp3    
            zenity --error --text '<span foreground="blue" font="32" >\n\nBattery level is LOW!\nPLUG IN YOUR COMPUTER!</span>' --title="LOW BATTERY LEVEL!" --width=800 --height=400

        fi
    fi

    

    sleep 5m
done