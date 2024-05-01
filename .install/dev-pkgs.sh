#!/bin/bash

echo -e "${GREEN}"
cat <<"EOF"

█▀▄ █▀▀ █░█ █▀▀ █░░ █▀█ █▀█ █▀▄▀█ █▀▀ █▄░█ ▀█▀
█▄▀ ██▄ ▀▄▀ ██▄ █▄▄ █▄█ █▀▀ █░▀░█ ██▄ █░▀█ ░█░

EOF
echo -e "${NONE}"
dev_pkgs=($(gum choose --no-limit ".NET" Go Java Julia NodeJS npm PHP --header "Please select packages to install:"))
for dev_pkg in "${dev_pkgs[@]}"; do
    case "$dev_pkg" in
        ".NET")
            echo "> Installing dotnet packages..."
            sudo pacman -S dotnet-runtime dotnet-sdk aspnet-runtime --noconfirm
            ;;
        "Go")
            echo "> Installing Go..."
            sudo pacman -S go --noconfirm
            ;;
        "Java")
            
            ;;
    esac
done