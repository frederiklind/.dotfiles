#!/bin/bash

# ============================================================== #
#                                                                #
#         F L I N U X  -  I N S T A L L  S C R I P T             #
#                                                                # 
# -------------------------------------------------------------- #
#                                                                #
#  install.sh - Dotfiles installer for Arch Linux / BSPWM        #
#                                                                #
#  Sets up packages, symlinks for config files, and enables      #
#  services for a kickass dev workstation.                       #
#                                                                #
#  Usage:                                                        #
#   ./install.sh                                                 #
#                                                                #
#  Author: Frederik Lind                                         #
#  Repo: https://github.com/frederiklind/.dotfiles               #
#                                                                #
# ============================================================== #

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

# Global variables

HOME="/home/$USER"
DOTFILES="/home/$USER/.dotfiles"
CONFIG="/home/$USER/.config"
INSTALL_LOG="$DOTFILES/.setup/install.log"

# Track errors and warnings during installation

WARNING_COUNT=0
ERROR_COUNT=0

# ------------------------ HELPERS ----------------------------- #

install_pkg() {
    local pkg="${1}"
}

# 
install_pkgs() {

} 

#
# log [LEVEL] [MESSAGE]
#
# Prints a colorized log message to stdout and appends
# the plain version to the install log file.
#
# Levels:
#   1 = INFO   (blue)
#   2 = WARN   (yellow)
#   3 = ERROR  (red)
#
# Example:
#   log 1 "Installing packages"
#   log 2 "Already installed"
#   log 3 "Something broke"
#   log 4 "herp derp"
#
log() {
    local lvl="$1"; shift   # log level (number)
    local msg="$*"          # log message
    local slvl              # log level tag string
    
    local clr               # color of log level tag
    local nclr='\033[0m'    # color reset

    case "$lvl" in 
        1)
            slvl="[INFO ]"
            clr='\033[1m'
            ;;
        2)
            slvl="[WARN ]"
            clr='\033[1;33m'
            ;;
        3)
            slvl="[ERROR]"
            clr='\033[1;31m'
            ;;
        4)
            slvl="[DERP ]"
            clr='\033[1;36m'
            ;;
        *)
            slvl="[?!*$%]"
            clr='\033[1m'
    esac

    # output print, and write to log file

    echo -e "${clr}${slvl}${nclr} ${msg}"
    echo "${slvl} ${msg}" >> "$INSTALL_LOG"
}

#
# link [SOURCE_DIR] [DEST_DIT] [NAME/DESC]
# 
# Silently creates symbolic link, and logs result
#
# 
link() {
    local src="$1"
    local dst="$2"
    local name="$3"

    if ln --symbolic --force "$src" "$dst" >/dev/null 2>&1; then
        log 1 "Linked $name"
    else
        log 3 "Failed to link $name"
    fi
}

run() {
  : "${INSTALL_LOG:?INSTALL_LOG not set}"
  log 1 "RUN: $*"
  if "$@" >> "$INSTALL_LOG" 2>&1; then
    return 0
  else
    log 3 "FAILED: $* (see $INSTALL_LOG)"
    return 1
  fi
}

try() {
  : "${INSTALL_LOG:?INSTALL_LOG not set}"
  log 1 "TRY: $*"
  if "$@" >>"$INSTALL_LOG" 2>&1; then
    return 0
  else
    log 2 "FAILED (continuing): $* (see $INSTALL_LOG)"
    return 0
  fi
}

create_dirs() {
    local downloads_dir="$HOME/Downloads"
    local pictures_dir="$HOME/Picures"
    local documents_dir="$HOME/Documents"
    local src_dir="$HOME/Source/repos"

    mkdir 
    mkdir -p "$HOME/Source/repos"
}

setup_xorg() {
    return
}

# --------------------- DISPLAY MANAGER ------------------------

setup_window_manager() {
    local -a pkgs=(
        "bspwm"     \
        "some other bs"
    )
}

display_manager() {
    sudo pacman -S --no-confirm "ly"
    log 1 "Successfully installed ly display manager"
    
    log 1 "Enabling ly@tty2.service"
    sudo systemctl enable "ly@tty2.service"
}

# ------------------ SETUP ZSH (OPTIONAL) ----------------------

# Sets up zsh as default shell. Installs a variety of zsh 
# plugins, such as syntax highlighting, and ... for that extra
# crispiness of the terminal. This step is optional.

setup_terminal() {
    local pkgs=(
        "alacritty"               \   # Terminal emulator
        "zsh"                     \   # ZSH for awesomeness
        "zsh-syntax-highlighting" \   # Syntax highlights for zsh
        "eza"                     \   # Modern 'ls' output 
    ) 

    # Set zsh as default shell

    local zsh_path
    zsh_path="$(command -v zsh)"

    if ! grep -qxF "$zsh_path" /etc/shells; then
        log 3 "zsh path not in /etc/shells: $zsh_path"
        log 2 "Add it manually, then run: chsh -s $zsh_path"
        return 
    fi

    if [[ "${SHELL:-}" == "$zsh_path" ]]; then
        log 1 "zsh is already the default shell"
        return 
    fi

    if chsh -s "$zsh_path" "$USER" >/dev/null 2>&1; then
        log 1 "Default shell set to zsh (relogin required)"
    else
        log 3 "Failed to set default shell to zsh"
        return 
    fi

    # Install starship cross shell prompt

    curl -sS https://starship.rs/install.sh | sh &>> "$INSTALL_LOG"


    # Create synlinks
    link "$DOTFILES/bashrc/.bashrc" "$HOME/.bashrc" "'.bashrc'"
    link "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc" "'.zshrc"
    link "$DOTFILES/eza" "$HOME/eza" "eza config"
    link "$DOTFILES/starship/starship.toml" "$CONFIG/starship.toml" "starship.toml"
}

setup_git() {
    local git_username
    local git_email 
    read -p "Enter Github username: " git_username
    read -p "Enter Github email: " git_email

    git config ...
    git config ...
}

# setup_utils
#
# 
#
setup_utils() {
    local pkgs=(
        "polybar"                  # Status bar
        "zathura"                  # PDF viewer
        "zathura-pdf-poppler"      # some mumbo jumbo for zathura
        "feh"                      # image viewer, wallpaper engine
        "thunar"                   # GUI file manager
        "ranger"                   # TUI file manager
        "btop"                     # System monitoring
    )

    # Install BTOP theme
    local btop_theme_dir="$DOTFILES/btop/themes"

    if [[ ! -d "$btop_theme_dir" ]]; then
        mkdir "$btop_theme_dir"
    fi

    git clone "https://github.com/catppuccin/btop.git" "$HOME/Source" &>/dev/null

    # Copy btop theme to config directory
    cp "$HOME/Source/btop/themes/catppuccin_macchiato" \
       "$btop_theme_dir/"

    # Destroy repo
    rm --recursive --force "$HOME/Source/btop"

    # Symlinks
    link "$DOTFILES/polybar" "$CONFIG/polybar" "polybar config"
    link "$DOTFILES/zathura" "$CONFIG/zathura" "zathura config"
    link "$DOTFILES/ranger" "$CONFIG/ranger" "ranger config"

}

#
# setup_docker
#
# This function is part of the 'setup_dev_stuff'. Sets up
# Docker, and sets desired behavior of the docker service.
#
setup_docker() {
    local opt
    read -p "Enter option number [1-2]: " opt

    case $opt in
        1)  
            # auto-start 
            sudo systemctl enable docker.service docker.socket
            ;;
        2)  
            # manual
            sudo systemctl disable docker.service docker.socket
            ;;
        *)  
            # and if user can't understand simple instructions
            echo -e "\033[1;33m Invalid input.\033[0m Please enter a number [1-2]\n"
            setup_docker
            ;;
    esac
}

#
# setup_dev_stuff
#
# Installs a bunch of developer tools and utilities necessary
# for every self respecting software dev. This includes
# Neovim and VSCode editors. TMUX, for multiplexing, and
# a variety of compilers and programming languages.
#
# Furthermore, this will install and optionally set the docker as 
# auto start or manually started system service. 
# 
setup_dev_stuff() {
    local pkgs=(
        "nvim"                 # neovim
        "code"                 # OSS VSCode
        "tmux"                 # Terminal multiplexer (super important)
        "python-pip"           # Python package manager
        "docker"               # Docker - containerization
        "dotnet-sdk"           # .NET sdk
        "dotnet-runtime"       # .NET runtime  
        "aspnet-runtime"       # ASP.NET runtime
        "cargo"                # Rust compiler
        "node"                 # JavaScript stuff
        "github-cli"           # Version control
    )

    # Install TPM (TMUX package manager)
    local tpm_dir="$DOTFILES/tmux/plugins"

    # check TMUX plugins directory
    if [[ ! -d "$tpm_dir" ]]; then
        mkdir "$tpm_dir"
    fi
    
    # Clone TPM git repository 
    git clone "https://github.com/tmux-plugins/tpm" "$tpm_dir/tpm"

    # Symlink a bunch of stuff, while breaking whatever
    # that might be in the way for my configurations.

    link "$DOTFILES/nvim" "$CONFIG/nvim" "nvim config"
    link "$DOTFILES/tmux" "$CONFIG/tmux" "tmux config"

    # Configure docker service
    echo -e "\n How would you like to configure the behavior of Docker?\n"
    echo -e " 1. Auto-start of boot   (Enabled)"
    echo -e " 2. Manual start         (Disabled)\n"

    # call actual setup function
    setup_docker 
    
    # TODO: symlink python lsp config
}

# ------------------------ MAIN!! ----------------------------

main() {
    local yn
    read -p " Do You wish to continue? (Y/n): " yn

    case $yn in
        Y|y)
            # Check install log
            if [[ ! -f "$INSTALL_LOG" ]]; then
                # Create new
                touch "$INSTALL_LOG"
            else
                # Wipe clean
                echo "" > "$INSTALL_LOG"
            fi

            create_dirs


            ;;
        N|n)
            # Cold feet
            echo " OK... Goodbye!"
            exit 0
            ;;
        *)
            # In case user has poor typing skills
            echo -e "\033[1;33m Invalid input.\033[0m Please input (Y/n)\n"
            main
            ;;
    esac
}

echo -e "\n##########################################################\n"

echo -e "\033[1;34m F L I N U X  -  D O T F I L E S  I N S T A L L A T I O N\033[0m\n" 
echo " Author:   Frederik Lind"
echo " Git Repo: https://github.com/frederiklind/.dotfiles"

echo -e "\n##########################################################\n"

cat <<EOF
 If you run this script on a pre-configured system
 Everything will probably break. This script will
 disregard any existing configurations that might
 overlap with what these dotfiles contain. Proceed
 at your own risk.

EOF

# call main!
main

# Clean up environment
#
unset -f log link main 
unset $CONFIG $DOTFILES
