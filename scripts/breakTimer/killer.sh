#!/bin/bash

#this script kills the 20_20_20_Timer.sh


# while true
# do
#   sleep $1
#   ps -ef | grep 20_20_20_Timer.sh  | grep -v grep | awk '{print $2}' | xargs kill -9  

# done

ps -ef | grep 20_20_20_Timer.sh  | grep -v grep | awk '{print $2}' | xargs kill -9  

