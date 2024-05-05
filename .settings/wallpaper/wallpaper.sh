#!/bin/bash

# set wallpaper with swww
WPDIR="${HOME}/Pictures/wallpapers"
if [ ! -d "${WPDIR}" ]; then
    echo "No wallpapers directory found... exiting."
    exit 1
fi

WALLPAPERS=()
for f in "${WPDIR}"/*; do
    WALLPAPERS+=("$(basename "$f")")
done

cat <<"EOF"

 █░█░█ ▄▀█ █░░ █░░ █▀█ ▄▀█ █▀█ █▀▀ █▀█
 ▀▄▀▄▀ █▀█ █▄▄ █▄▄ █▀▀ █▀█ █▀▀ ██▄ █▀▄

 Select a wallpaper.

EOF
#echo -e "${NONE}"

wallpaper=$(gum choose --limit 1 --height ${#WALLPAPERS[@]} ${WALLPAPERS[@]})
swww img "${WPDIR}/${wallpaper}"
