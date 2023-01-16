#!/bin/bash

#this script kills the 20_20_20_Timer.sh and battery_reminder.sh and if successful gives a sound


~/.config/i3/scripts/breakTimer/breakTimer_killer.sh

ps -ef | grep battery_reminder.sh | grep -v grep | awk '{print $2}' | xargs kill -9

ps -ef | grep random_wallpaper.sh | grep -v grep | awk '{print $2}' | xargs kill -9


~/.config/i3/scripts/tray_killer.sh
