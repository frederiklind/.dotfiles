#!/bin/bash

echo -e "${GREEN}"
cat <<"EOF"

█▀ █▀█ █▀█ ▀█▀ █ █▀▀ █▄█ █▀▄
▄█ █▀▀ █▄█ ░█░ █ █▀░ ░█░ █▄▀

EOF
echo -e "${NONE}"
if gum confirm "You are about to install spotifyd. Do you want to proceed?"; then
    echo "> Installing spotifyd..."
    sudo pacman -S spotifyd --noconfirm
    echo
    ln -s "${HOME}/.dotfiles/spotifyd" "${HOME}/.config/spotifyd"
    echo "> Created symlink: spotifyd -> ${HOME}/.dotfiles/spotifyd"
    systemctl --user enable spotifyd.service --now
    echo "> Spotifyd installed succellfully."
fi
