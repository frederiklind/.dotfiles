#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NONE='\033[0m'

HDOTF="$HOME/.dotfiles/hypr/.conf"
HCONF="$HOME/.config/hypr"

function transparency_switch() {
    case "$1" in
        "on")
            ln -sf "${HDOTF}/default.conf" "${HCONF}/hyprland.conf"
            echo -e "Window transparency - ${GREEN}ON${NONE}"
            ;;
        "off")
            ln -sf "${HDOTF}/no-transparency.conf" "${HCONF}/hyprland.conf"
            echo -e "Window transparency - ${RED}OFF${NONE}"
            ;;
    esac
    hyprctl reload &>/dev/null
}

function select_preset() {
    local count=0
    local files=()  # Array to store file names

    while IFS= read -r file; do
        ((count++))
        files+=("$file")
        echo "$count. $file"
    done < <(ls "$HDOTF")

    if [[ $count -eq 0 ]]; then
        echo "No presets found in $HDOTF"
        return 1
    fi

    read -p "Select a preset (1-$count): " choice

    if [[ "$choice" =~ ^[0-9]+$ ]] && ((choice >= 1 && choice <= count)); then
        selected_file="${files[$((choice - 1))]}"
        ln -sf "${HDOTF}/$selected_file" "${HCONF}/hyprland.conf"
        hyprctl reload &>/dev/null
        echo "Preset '$selected_file' applied."
    else
        echo "Invalid choice"
        return 1
    fi
}

function main() {
    case "$1" in 
        "-t")
            transparency_switch $2
            ;;
        "-p")
            select_preset
            ;;
        *)
            exit 1
            ;;
    esac 
}

main $1 $2
