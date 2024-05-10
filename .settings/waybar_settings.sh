#!/bin/bash

cat <<"EOF"

  █░█░█ ▄▀█ █▄█ █▄▄ ▄▀█ █▀█   █▀ █▀▀ ▀█▀ ▀█▀ █ █▄░█ █▀▀ █▀
  ▀▄▀▄▀ █▀█ ░█░ █▄█ █▀█ █▀▄   ▄█ ██▄ ░█░ ░█░ █ █░▀█ █▄█ ▄█

EOF

THEMES_DIR="${HOME}/.dotfiles/waybar/themes"
DEVICE=$(gum choose --limit 1 "kraken" "xps")

themes=($(find "${THEMES_DIR}" -mindepth 1 -maxdepth 1 -type d -exec basename {} \;))
THEME=$(gum choose --limit 1 "${themes[@]}" "Off" "Back")
case "${THEME}" in
    "Off")
        killall waybar &>/dev/null
        pkill waybar &>/dev/null
        ;;
    "Back")
        exit 1
        ;;
    *)
        ln -sf "${THEMES_DIR}/${THEME}/${DEVICE}/config.jsonc" "${HOME}/.config/waybar/config.jsonc"
        ln -sf "${THEMES_DIR}/${THEME}/${DEVICE}/style.css" "${HOME}/.config/waybar/style.css"
        "${HOME}/.dotfiles/waybar/launch.sh" &>/dev/null & disown
        ;;
esac
