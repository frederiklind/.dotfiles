#!/bin/bash

SETTINGS_DIR="${HOME}/.dotfiles/.settings"
opts=("Wallpaper" "Waybar" "Other" "Exit")

while true; do

clear
cat <<"EOF"


  ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
  ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
  ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
  ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
  ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
  ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝


EOF

    opt=$(gum choose --limit 1 ${opts[@]})
    case "$opt" in
        "Wallpaper")
            "${SETTINGS_DIR}/wallpaper/wallpaper.sh"
            ;;
        "Waybar")
            "${SETTINGS_DIR}/waybar"
            ;;
        "Exit")
            break
            ;;
    esac

done
clear

