#!/bin/bash

# set gtk theme, font, cursor and icons

THEME="$1"
#ICONS=""
#FONT=""
#CURSOR=""

SCHEMA='gsettings set org.gnome.desktop.interface'

apply_themes() {
    ${SCHEMA} gtk-theme "$THEME"
#    ${SCHEMA} icon-theme "$ICONS"
#    ${SCHEMA} font-name "$FONT"
#    ${SCHEMA} cursor-theme "$CURSOR"
}
