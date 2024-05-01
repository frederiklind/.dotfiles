#!/bin/bash

echo -e "${GREEN}"
cat <<"EOF"

█▄▄ █▀█ █▀█ █░█░█ █▀ █▀▀ █▀█ █▀
█▄█ █▀▄ █▄█ ▀▄▀▄▀ ▄█ ██▄ █▀▄ ▄█

EOF
echo -e "${NONE}"
echo "Please select which browsers you want to install:" && echo

browsers=($(gum choose --no-limit Firefox Chromium Brave))
for brw_opt in "${browsers[@]}"; do
    case "$brw_opt" in
        "Firefox")
            echo "> Installing Firefox..."
            sudo pacman -S firefox-esr --noconfirm
            ;;
        "Chromium")
            echo "> Installing Chromium..."
            sudo pacman -S chromium --noconfirm
            ;;
        "Brave")
            echo "> Installing Brave..."
            #paru -S brave-bin --noconfirm
            ;;
    esac
done
echo