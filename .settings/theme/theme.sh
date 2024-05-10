#!/bin/bash

cat <<"EOF"

  ▀█▀ █░█ █▀▀ █▀▄▀█ █▀▀   █▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀
  ░█░ █▀█ ██▄ █░▀░█ ██▄   ▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█

EOF

while true; do
    theme_setting_opt=$(gum choose --limit 1 "Colorscheme" "Waybar" "Back")
    case "$theme_setting_opt" in
        "Colorscheme")
            break
            ;;
        "Waybar")
            "${HOME}/.dotfiles/.settings/waybar/waybar_settings.sh"
            ;;
        "Back")
            break 
            ;;
    esac
done
