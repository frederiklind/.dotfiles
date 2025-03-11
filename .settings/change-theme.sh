#!/bin/bash

DOTFILES="${HOME}/.dotfiles"



function set_alacritty() {
    local new_theme="import = [\"$HOME/.dotfiles/alacritty/colors/${1}.toml\"]"
    local expanded_pattern="import = \[\"$HOME/.dotfiles/alacritty/colors/.*.toml\"\]"
    if grep -q "$expanded_pattern" "${DOTFILES}/alacritty/uw.toml"; then
        sed -i "s|$expanded_pattern|$new_theme|" "${DOTFILES}/alacritty/uw.toml"
    else
        echo "No matching line found, skipping modification."
    fi
}

function set_eza() {
    local eza_theme="${DOTFILES}/eza/$1.yml"
    if [ -f $eza_theme ]; then
        echo "Symlinking ${eza_theme}"
        ln -sf $eza_theme "${HOME}/.config/eza/theme.yml"
    else
        echo "eza theme not found. skipping..."
    fi
}

function set_nvim() {
    local nvim_theme="${DOTFILES}/nvim/lua/themes/$1.lua"
    if [ -f $nvim_theme ]; then
        echo "Symlinking ${nvim_theme}"
        ln -sf $nvim_theme "${DOTFILES}/nvim/lua/plugins/theme.lua"
    else
        echo "nvim theme not found. skipping..."
    fi
}

# function set_wp() {
#
# }


set_alacritty "$1"
set_eza "$1"
set_nvim "$1"

