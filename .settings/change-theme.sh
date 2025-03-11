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
    local theme="${DOTFILES}/nvim/lua/themes/${1}/theme.lua"
    local lualine="${DOTFILES}/nvim/lua/themes/${1}/lualine.lua"
    local alpha="${DOTFILES}/nvim/lua/themes/${1}/alpha.lua"
    
    # THEME

    if [ -f $theme ]; then
        echo "Symlinking ${theme}"
        ln -sf $theme "${DOTFILES}/nvim/lua/plugins/theme.lua"
    else
        echo "nvim theme not found. skipping..."
    fi

    # LUALINE

    if [ -f $lualine ]; then
        echo "Symlinking ${lualine}"
        ln -sf $lualine "${DOTFILES}/nvim/lua/plugins/lualine.lua"
    else
        echo "lualine theme not found. skipping..."
    fi

    # ALPHA
    
    if [ -f $alpha ]; then
        echo "Symlinking ${alpha}"
        ln -sf $alpha "${DOTFILES}/nvim/lua/plugins/alpha.lua"
    else
        echo "alpha theme not found. skipping..."
    fi
}

# function set_wp() {
#     
#     if [ $XDG_SESSION_DESKTOP = "bspwm" ]; then
#         
#         local wp_dir="${DOTFILES}/wallpapers/ultrawide/${1}"
#
#     elif [ $XDG_SESSION_DESKTOP = "Hyprland" ]; then
#
#         local wp_dir="${DOTFILES}/wallpapers/laptop"
#
#     fi
#
# }


set_alacritty "$1"
set_eza "$1"
set_nvim "$1"
