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

source "${INSTALL_DIR}/required-pkgs.sh"    # nstall required packages
source "${INSTALL_DIR}/prep.sh"             # create directories
source "${INSTALL_DIR}/paru.sh"             # nstall paru aur helper
source "${INSTALL_DIR}/gpu-driver.sh"       # nstall graphics card driver
source "${INSTALL_DIR}/pkgs.sh"             # install packages
source "${INSTALL_DIR}/nerd-font.sh"        # install nerd font
source "${INSTALL_DIR}/ranger.sh"           # additional ranger plugins installation
source "${INSTALL_DIR}/browser.sh"          # install browsers
source "${INSTALL_DIR}/hypr.sh"             # install hyprland (WM)
source "${INSTALL_DIR}/editors.sh"          # nstall editors
# source "${INSTALL_DIR}/dev-pkgs.sh"         # install dev stuff
source "${INSTALL_DIR}/dm.sh"               # install display manager
source "${INSTALL_DIR}/symlinks.sh"
source "${INSTALL_DIR}/reboot.sh"           # system reboot
