#!/bin/bash
 
# setup paru for aur packages
echo "> Installing paru - AUR helper..."
sudo pacman -S --needed base-devel --noconfirm
cd "$HOME/source/aur" && \
git clone https://aur.archlinux.org/paru.git && \
cd paru && makepkg -si

cd "$HOME"