#!/bin/bash

function mk_gitconfig() {
    local RED='\033[0;31m'
    local GREEN='\033[0;032m'
    local BLUE='\033[0;34m'
    local BOLD='\033[1m'
    local NONE='\033[0m'

    local CONF="${HOME}/.dotfiles/gitconfig/.gitconfig.public"
    local PRIV_CONF="${HOME}/.dotfiles/gitconfig/.gitconfig.private"
    local DEST="${HOME}/.gitconfig"

    echo
    if [[ -f $DEST ]]; then
        echo -e "${BOLD}${BLUE}> ${NONE}Clearing contents of existing file."
        > $DEST
    else
        echo -e "${BOLD}${BLUE}> No gitconfig found. Creating one now."
        touch $DEST
    fi

    if [[ -f $PRIV_CONF ]]; then
        echo -e "${BOLD}${BLUE}> ${NONE}Appending private config to file."
        cat $PRIV_CONF >> $DEST
    else
        echo -e "${BOLD}${RED}> ${NONE}No private config found. Skipping this step."
    fi

    echo -e "${BOLD}${BLUE}> ${NONE}Appending global config to file."
    cat $CONF >> $DEST

    echo -e "\n${GREEN}✓ ${NONE}.gitconfig updated!"
}

read -p "Are you sure you wish to rewrite your gitconfig? (Y/n) " choice

if [[ $choice == "Y" || $choice == "y" ]]; then
    mk_gitconfig
    unset -f mk_gitconfig
elif [[ $choice == "N" || $choice == "n" ]]; then
    unset -f mk_gitconfig
    exit
else
    echo "Invalid option\n"
    unset -f mk_gitconfig
    exit 
fi
