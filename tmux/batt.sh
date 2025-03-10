#!/bin/bash

if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    batt_lvl=$(cat /sys/class/power_supply/BAT0/capacity)
    
    if [ "$batt_lvl" -le 30 ]; then
        echo "#[fg=#fab387,bg=#181926]󱐋"
    else
        echo ""
    fi 
else
    echo ""
fi
