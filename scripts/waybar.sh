#!/bin/bash

if grep -q 'visible=true' "${HOME}/.dotfiles/.settings/waybar_settings.conf"; then
    source "${HOME}/.dotfiles/waybar/launch.sh"
fi