#!/bin/bash

rows=$(tput lines)
if [ "$rows" -lt 17 ]; then
    exit 1
elif [ "$rows" -ge 17 ] && [ "$rows" -lt 28 ]; then
    neofetch
else
    fastfetch  
fi
