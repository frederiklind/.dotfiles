#!/bin/bash

# setup arws
OK='\033[1;32m>\033[0m'
ERR='\033[1;31m>\033[0m'

DOTFILES="${HOME}/.dotfiles"

# ------------------------------------------------------------------
#
#                            T E R M I N A L
#
# ------------------------------------------------------------------

function set_alacritty() {
    local theme="import = [\"$HOME/.dotfiles/alacritty/colors/${1}.toml\"]"
    local pat="import = \[\"$HOME/.dotfiles/alacritty/colors/.*.toml\"\]"
    if grep -q "$pat" "${DOTFILES}/alacritty/alacritty.toml"; then
        sed -i "s|$pat|$theme|" "${DOTFILES}/alacritty/alacritty.toml"
        echo -e "${OK} Alacritty configuration modified."
    else
        echo -e "${ERR} No matching line found in alacritty config, skipping modification."
    fi
}

function set_starship() {
    local theme="${DOTFILES}/starship/${1}.toml"
    
    if [[ -f "${theme}" ]]; then
        ln -sf "${theme}" "$HOME/.config/starship.toml"
        echo -e "${OK} Symlink created for ${theme}."
    else
        echo -e "${ERR} Starship theme not found. No changes were made."
    fi
}

function set_eza() {
    local theme="${DOTFILES}/eza/${1}.yml"
    if [ -f $theme ]; then
        ln -sf $theme "${HOME}/.config/eza/theme.yml"
        echo -e "${OK} Symlink created for ${theme}"
    else
        echo -e "${ERR} Eza theme not found. No changes were made."
    fi
}

# ------------------------------------------------------------------
#
#                             N E O V I M
#
# ------------------------------------------------------------------

function set_nvim() {
    local theme="${DOTFILES}/nvim/lua/themes/${1}.lua"
    local palette="${DOTFILES}/nvim/lua/colors/palettes/${1}.lua"
    
    # THEME

    if [ -f $theme ]; then
        ln -sf "${theme}" "${DOTFILES}/nvim/lua/plugins/theme.lua"
        echo -e "${OK} Symlink created for ${theme}"
    else
        echo -e "${ERR} Neovim theme not found. No changes were made."
    fi

    if [[ -f "${palette}" ]]; then
        ln -sf "${palette}" "${DOTFILES}/nvim/lua/colors/palette.lua"
        echo -e "${OK} Symlink created for ${palette}."
    else
        echo -e "${ERR} No palette found. No changes have were made."
    fi
}

# ------------------------------------------------------------------
#
#                       S T A T U S   B A R
#
# ------------------------------------------------------------------

function set_statusbar() {

    if [[ $XDG_SESSION_DESKTOP == "bspwm" ]]; then
        local bar="polybar"
    elif [[ $XDG_SESSION_DESKTOP == "Hyprland" ]]; then
        local bar="waybar"
    else
        echo -e "${ERR} No suitable WM for this script."
        return
    fi

    local theme="${DOTFILES}/${bar}/themes/${1}"
    
    if [[ -d "${theme}" ]]; then
        
        rm -rf "$HOME/.config/${bar}"
        ln -sf "$theme" "$HOME/.config/${bar}"

        echo -e "${OK} Symlink created for ${theme}."

        killall $bar
        pkill $bar
        sleep 0.2

        exec $bar &> /dev/null &
    else
        echo -e "${ERR} ${bar} theme not found. No changes were made."
    fi   
}


# TODO: firefox, tmux, wallpaper?, wofi 

if [ ! $1 = "" ]; then
    
    echo -e "\n\033[1;36mChanging color theme to: \033[1;35m${1}\033[0m\n"

    set_alacritty $1
    set_starship $1
    set_eza $1
    set_nvim $1
    set_statusbar $1
else
    echo -e "No arguments given. Goodbye."
fi

# cleanup :)

unset OK
unset ERR
unset DOTFILES
