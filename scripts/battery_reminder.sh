#!/bin/bash

zenity --error --text '<span foreground="green" font="32" >\n\nBatterieerinnerung funktioniert.</span>' --title="Funkioniert!" --width=800 --height=400


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
            espeak -v de "Ihre Batterie ist kritisch schwach."    
            zenity --error --text '<span foreground="red" font="32" >\n\nBatteriestand ist KRITISCH!\nStecken Sie JETZT Ihren Computer ein!</span>' --title="Kritischer Batteriestand!" --width=800 --height=400

    
        elif [ $battery_percent -le $LOW ]
            then
            # mplayer ~/.config/i3/scripts/sounds/WindowsXp_LowBattery_Sound.mp3  
            espeak -v de "Ihre Batterie ist schwach."  
            zenity --error --text '<span foreground="blue" font="32" >\n\nBatteriestand ist schwach!\nStecken Sie Ihren Computer ein!</span>' --title="Niedriger Batteriestand!" --width=800 --height=400

        fi
    fi

    sleep 300

done