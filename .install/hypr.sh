#!/bin/bash

echo -e "${GREEN}"
cat <<"EOF"

█░█ █▄█ █▀█ █▀█
█▀█ ░█░ █▀▀ █▀▄

EOF
echo -e "${NONE}"
echo "> Installing hyprland..."
sudo pacman -S hyprland --noconfirm

# install hyprlock
if gum confirm "Do you want to install hyprlock?"; then
    sudo pacman -S hyprlock --noconfirm
else
    echo "> Skipping hyprlock installation..."
fi