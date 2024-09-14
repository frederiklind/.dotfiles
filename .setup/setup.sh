#!/bin/bash

echo -e "${GREEN}"
cat <<"EOF"

░ █▀▄ █▀█ ▀█▀ █▀▀ █ █░░ █▀▀ █▀   █▀ █▀▀ ▀█▀ █░█ █▀█
▄ █▄▀ █▄█ ░█░ █▀░ █ █▄▄ ██▄ ▄█   ▄█ ██▄ ░█░ █▄█ █▀▀

Frederik Lind (2024)

EOF
echo -e "${NONE}"

echo "> Checking internet connection"
ping -c 1 8.8.8.8 > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "> Internet is connected."
else
  echo "> No internet connection. Exiting setup..."
  exit 1
fi

CONFIG=$HOME/.config
DOTFILES=$HOME/.dotfiles

mkdir Downloads Documenrs Pictures Source 


function terminal_tewls() {
    sudo pacman -S tmux --noconfirm
    if [ -d "${CONFIG}/tmux"]; then
        echo "> Removing default tmux configuration"
        rm -rf "${CONFIG}/tmux"
    fi
    ln -sf "${DOTFILES}/tmux" "${CONFIG}/tmux"
    mkdir -p "${DOTFILES}/tmux/plugins"
     
}

function install_dev_tools() {
    echo "\n------------ DEV TOOLS ------------\n"
    local opts=($(gum choose --no-limit ".NET" "Java" "NodeJs" "NPM"))
    for opt in "${opts[@]}"; do
        case "$opt" in
            ".NET")
                echo "Installing .NET packages"
                sudo pacman -S dotnet-sdk dotnet-runtime aspnet-runtime --noconfirm
                ;;
            "Java")
                echo "Installing Java"
                sudo pacman -S jdk-openjdk --noconfirm
                ;;
            "NodeJs")
                echo "Installing NodeJs"
                sudo pacman -S nodejs npm --noconfirm 
                ;;
        esac
    done
}

function install_firefox() {
    echo "\n------------ FIREFOX ------------\n"
    echo "> Installing Firefox"
    sudo pacman -S firefox --noconfirm
    opt=(read "\nDo you want to setup custom firefox css now?")
    if [ "$opt" == "y" ]; then
        echo "> Setting up custom firefox css"
        mkdir -p $HOME/.mozilla/firefox/*.default/chrome
        ln -sf $DOTFILES/firefox/userChrome.css $HOME/.mozilla/firefox/*.default/chrome/userChrome.css
        ln -sf $DOTFILES/firefox/userContent.css $HOME/.mozilla/firefox/*.default/chrome/userContent.css
    fi
}

function setup_neovim() {
    if [ -d "${CONFIG}/nvim" ]; then
        echo "> Existing nvim configuration detected. Removing..."
        rm -rf "${CONFIG}/nvim"
    fi
    ln -sf "${DOTFILES}/nvim" "${CONFIG}/nvim"
    echo "> Created symlink for nvim"

    echo "Installing essential neovim packages"
    sudo pacman -S neovim python-pynvim python2-pynvim --noconfirm
    sudo npm install -g neovim
}

function 
