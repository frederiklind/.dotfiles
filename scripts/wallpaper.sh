#!/bin/bash

cache="~/.cache/swww"

count=$(ls -l "$cache" | grep "^-" | wc -l)
echo $count
if [ "$count" -eq 1 ]; then
    swww restore 
else 
    swww-daemon && swww img "$HOME/Pictures/wallpapers/snowy_mountains_2.jpg" 
fi
