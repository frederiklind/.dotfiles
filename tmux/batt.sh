#!/bin/bash

if [ -f /sys/class/power_supply/BAT0/capacity ]; then
    batt_lvl=$(cat /sys/class/power_supply/BAT0/capacity)
    
    if [ "$batt_lvl" -ge 80 ]; then
        icon=""
    elif [ "$batt_lvl" -ge 60 ]; then
        icon=""
    elif [ "$batt_lvl" -ge 40 ]; then
        icon=""
    elif [ "$batt_lvl" -ge 20 ]; then
        icon=""
    else
        icon=""
    fi

    echo "  #[fg=#74c7ec,bg=#181926]$icon "
else
    echo ""
fi
