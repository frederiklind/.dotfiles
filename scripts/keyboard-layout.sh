#!/bin/bash


setxkbmap -query | grep -q "layout:\s*us" && setxkbmap dk || setxkbmap us

echo -e "Keyboard layout"
