#!/bin/bash

PROFILE_DIR=$1
DOT_USR_CHROME="${HOME}/.dotfiles/firefox/userChrome.css"
DOT_USR_CONTENT="${HOME}/.dotfiles/firefox/userContent.css"

if [ ! -d "$PROFILE_DIR" ]; then
    echo "invalid firefox profile. Aborting..."
    exit 1
else
    EXS_USR_CHROME=0
    EXS_USR_CONTENT=0
    if [ ! -d "${PROFILE_DIR}/chrome" ]; then
        mkdir "${PROFILE_DIR}/chrome" && echo "> Created directory: ${PROFILE_DIR}/chrome"
    else
        echo "> Existing chrome folder detected in profile dir. Checking for existing css files..."
        if [ -f "${PROFILE_DIR}/chrome/userChrome.css" ]; then
            EXS_USR_CHROME=1
        fi
        if [ -f "${PROFILE_DIR}/chrome/userContent.css" ]; then
            EXS_USR_CONTENT=1
        fi
    fi
    echo
    if [[ "$EXS_USR_CHROME" -eq 1 || "$EXS_USR_CONTENT" -eq 1 ]]; then
        echo "Existing css files detected. Do you want to replace existing files? (Y/n): "
        read choice
        case "$choice" in
            [yY])
                echo "> Deleting existing CSS files..."
                rm -r "${PROFILE_DIR}/chrome/"
                ;;
            [nN])
                echo "> Installation cancelled. Exiting..."
                exit 0
                ;;
            *)
                echo "invalid input. Please enter 'y' or 'n'"
                ;;
        esac
    fi

    ln -s "$DOT_USR_CHROME" "${PROFILE_DIR}/chrome/userChrome.css" && \
    echo "> Created symlink: userChrome.css -> ${DOT_USR_CHROME}"
    ln -s "$DOT_USR_CONTENT" "${PROFILE_DIR}/chrome/userContent.css" && \
    echo "> Created symlink: userContent.css -> ${DOT_USR_CONTENT}"
    echo "Firefox css successfully installed in ${PROFILE_DIR}"
fi
