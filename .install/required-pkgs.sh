#!/bin/bash

echo "> Installing required packages..."
sudo pacman -Sy --noconfirm

# check for gum
if pacman -Qs gum &>/dev/null; then
    echo "> gum is already installed. Skipping installation."
else
    echo "> Installing gum..."
    sudo pacman -S gum --noconfirm
fi

if pacman -Qs curl &>/dev/null; then
    echo "> curl is already installed. Skipping installation."
else
    echo "> Installing curl..."
    sudo pacman -S curl --noconfirm
fi
echo
echo "✓ Required packgages successfully installed. Proceeding with installation."
echo