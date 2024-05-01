#!/bin/bash

echo "> Installing packages..."
sudo pacman -S alacritty neofetch eza btop ranger thunar waybar wofi zathura zathura-pdf-poppler --noconfirm

# install starship
curl -sS https://starship.rs/install.sh | sh