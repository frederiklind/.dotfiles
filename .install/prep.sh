#!/bin/bash

echo "> Setting up necessary directories..."

if [ ! -d "${CONFIG}" ]; then
    echo "> No .config directory detected. Creating directory."
    mkdir "${CONFIG}" && echo "> Created directory: ${CONFIG}"
else
    echo "> Existing .config directory found. Skipping this step."
fi

# setup dotfiles backup directory
if [ ! -d "${DOTFILES}/backup" ]; then
    mkdir "${DOTFILES}/backup" && echo "> config backup directory created."
else
    echo "> Existing dotfiles backup dir detecting. Skipping this step."
fi

# setup downloads directory
if [ ! -d "${HOME}/Downloads" ]; then
    mkdir "${HOME}/Downloads" && echo "> Created directory ${HOME}/Downloads"
else
    echo "> Existing downloads directory detected. Skipping this step"
fi

# setup books directory
if [ ! -d "${HOME}/Books" ]; then
    mkdir "${HOME}/Books" && echo "> Created directory ${HOME}/Books"
else
    echo "> Existing books directory detected. Skipping this step"
fi

# setup pictures dorectory
if [ ! -d "${HOME}/Pictures" ]; then
    mkdir "${HOME}/Pictures" && echo "> Created directory ${HOME}/Pictures"
else
    echo "> Existing pictures directory detected. Skipping this step"
fi

# setup documents directory
if [ ! -d "${HOME}/Documents" ]; then
    mkdir "${HOME}/Documents" && echo "> Created directory ${HOME}/Documents"
else
    echo "> Existing documents directory detected. Skipping this step"
fi

# setup repos directory
if [ ! -d "${HOME}/source" ]; then
    mkdir "${HOME}/Source" && echo "> Created directory ${HOME}/source/repos"
else
    echo "> Existing documents directory detected. Skipping this step"
fi
echo