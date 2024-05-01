#!/bin/bash

echo -e "${GREEN}"
cat <<"EOF"

█▀▀ █▀▄ █ ▀█▀ █▀█ █▀█ █▀
██▄ █▄▀ █ ░█░ █▄█ █▀▄ ▄█

EOF
echo -e "${NONE}"
echo "Please select which text/code editors you want to install:"
editors=($(gum choose --no-limit VSCode Neovim Vim))
for edt in "${editors[@]}"; do
    case "$edt" in
        "VSCode")
            if pacman -Qs code &>/dev/null; then
                echo "> VSCode is already installed. Skipping installation."
            else
                echo "> Installing Visual Studio Code..."
                sudo pacman -S code --noconfirm
            fi
            echo
            ;;
        # "Emacs")
        #     if pacman -Qs emacs &>/dev/null; then
        #         echo "> Emacs is already installed. Skipping installation."
        #     else
        #         echo "> Installing Emacs..."
        #         sudo pacman -S emacs --noconfirm
        #     fi
        #     echo
        #     ;;
        "Neovim")
            if pacman -Qs neovim &>/dev/null; then
                echo "> Neovim is already installed. Skipping installation."
            else
                echo "> Installing Neovim..."
                sudo pacman -S neovim --noconfirm
            fi
            echo
            
            # remove existing config
            if [ -d "${CONFIG}/nvim" ]; then
                echo "> Existing Neovim config directory detected. Removing..."
                rm -rf "${CONFIG}/nvim" && echo "> Directory deleted: ${CONFIG}/nvim"
            fi
            
            # setup symlink for config
            ln -s "${DOTFILES}/nvim" "${CONFIG}/nvim" && \
            echo "> Symlink created: nvim -> ${DOTFILES}/nvim"
            echo
            ;;
        "Vim")
            if pacman -Qs vim &>/dev/null; then
                echo "> Vim is already installed. Skipping installation."
            else
                echo "> Installing Vim..."
                sudo pacman -S vim --noconfirm 
            fi
            echo
            # remove existing config
            if [ -d "${CONFIG}/vim" ]; then
                echo "> Existing Neovim config directory detected. Removing..."
                rm -rf "${CONFIG}/nvim" && echo "> Directory deleted: ${CONFIG}/nvim"
            fi
            
            # setup symlink for config
            ln -s "${DOTFILES}/vim" "${CONFIG}/vim" && \
            echo "> Symlink created: vim -> ${DOTFILES}/vim"
            echo
            ;;
    esac
done