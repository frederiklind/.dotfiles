#!/bin/bash

cat <<"EOF"

Alacritty (TODO: insert figlet)

EOF

ALACRITTY_DIR="${HOME}/.dotfiles/alacritty"
themes=($(find ${ALACRITTY_DIR} -mindepth 1 -maxdepth 1 -type f -exec basename {} \;))
THEME=$(gum choose --limit 1 "${themes[@]}" "Back")
case "${THEME}" in
    "Off")
        exit 1
        ;;
    "Back")
        exit 1
        ;;
    *)
        ln -sf "${HOME}/.dotfiles/alacritty/${THEME}" "${HOME}/.config/alacritty/alacritty.toml"
        ;;
esac
