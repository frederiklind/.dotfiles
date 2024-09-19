#!/bin/bash

echo -e "${GREEN}"
cat <<"EOF"

█▀▀ █░░ █ █▄░█  ░ █▀▄ █▀█ ▀█▀ █▀▀ █ █░░ █▀▀ █▀
█▀░ █▄▄ █ █░▀█  ▄ █▄▀ █▄█ ░█░ █▀░ █ █▄▄ ██▄ ▄█

Arch linux / hyprland WM installation.

EOF
echo -e "${NONE}"

CONFIG="${HOME}/.config"
DOTFILES="${HOME}/.dotfiles"
INSTALL_DIR="${DOTFILES}/.install"

# prompt for installation process confirmation
echo "You are about to install the flin dotfiles. Continue at your own risk."
read -p "Do you want to proceed with installation? (Y/n): " choice

case "$choice" in
    y|Y )
        echo "> Proceeding with installation..."
        ;;
    n|N )
        echo "> Aborting..."
        exit 1
        ;;
esac