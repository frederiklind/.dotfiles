#!/bin/bash

# make sure unzip utility package is installed on system
echo "> checking if unzip package is installed on system..."
if ! command -v unzip &>/dev/null; then
    echo "> unzip package not installed. Installing now."
    sudo pacman -S unzip --noconfirm
    echo "> unzip installed successfully. Proceeding with installation."
else
    echo "> unzip already installed, Proceeding with installation."
fi

NERD_FONTS_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip"
FONTS_DIR_TMP="$DOTFILES/tmp_fonts"

echo "> Installing NerdFonts..."
mkdir "$FONTS_DIR_TMP" && cd "$FONTS_DIR_TMP" && echo "> Created temporary .ttf directory"

# get from github
curl -L -o nerd_font.zip "$NERD_FONTS_URL"
echo "> Font files downloaded successfully"

# quiet unzip and remove zip file
unzip -q nerd_font.zip && rm nerd_font.zip
echo "> Font files extracted"

sudo mv "$FONTS_DIR_TMP"/* /usr/share/fonts/ && \
echo "> Nerd font files moved to directory /usr/share/fonts"

cd "$HOME"