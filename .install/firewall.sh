#!/bin/bash

echo -e "${GREEN}"
cat <<"EOF"

█▀▀ █ █▀█ █▀▀ █░█░█ ▄▀█ █░░ █░░
█▀░ █ █▀▄ ██▄ ▀▄▀▄▀ █▀█ █▄▄ █▄▄

EOF
echo -e "${NONE}"
if gum confirm "Do you want to install and enable UFW (Uncomplicated Firewall)?"; then
    echo "> Installing UFW..."
    sudo pacman -S ufw --noconfirm
    sudo ufw limit 22/tcp
    sudo ufw allow 80/tcp
    sudo ufw allow 443/tcp
    sudo ufw default deny incoming
    sudo ufw default allow outgoing

    echo "> ufw - Firewall successfully installed."
    sudo systemctl enable ufw && \
    echo "> ufw service enabled."
    sudo ufw status
    echo "Applied rules can be changed at any time."
else 
    echo "> Firewall installation skipped."
fi