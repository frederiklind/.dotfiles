#!/bin/bash

# =============================================================================
# ------------------------------- Contents ------------------------------------
# =============================================================================
#   
#   1. Variables ..............................................................
#   2. Helper Functions .......................................................
#   |-- 2.1 is_installed ......................................................
#   |-- 2.2 install_package ...................................................
#   3 langs ..................................................................
#   4 dev_tools ..............................................................
#   5 setup_firewall .........................................................
#   6 mk_directories .........................................................
#   7 install ................................................................
#   8. Main ...................................................................


# =============================================================================
# ------------------------------- Variables -----------------------------------
# =============================================================================

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NONE='\033[0m'
CONFIG="${HOME}/.config"
DOTFILES="${HOME}/.dotfiles"
INSTALL_LOG="${HOME}/.dotfiles/.install/install.log"

# =============================================================================
# ----------------------------- Helper Functions ------------------------------
# =============================================================================

function is_installed() {
    pacman -Qi "$1" &> /dev/null
    return $?
}

function install_package() {
    if is_installed "$1"; then
        echo -e "|-${RED}${BOLD}> ${BLUE}${BOLD}${1}${NONE} is already installed"
    else
        echo -e "|-${BLUE}${BOLD}> ${NONE}Installing ${BLUE}${BOLD}${1}${NONE}..."
        sudo pacman -S --noconfirm "$1" &>> $INSTALL_LOG
        echo -e "|-${CYAN}${BOLD}> ${NONE}Successfully installed ${BLUE}${BOLD}${1}${NONE}"
    fi
}

function mk_directories() {
    mkdir "${HOME}/Documents" "${HOME}/Downloads" "${HOME}/Pictures"
    mkdir -p "${HOME}/Source/repos" "${HOME}/Source/aur"
}

# =============================================================================
# ------------------------------- Window Manager ------------------------------
# =============================================================================

function window_manager() {
    echo 
    echo -e "${CYAN}${BOLD}> ${BLUE}${BOLD}Window Manager${NONE}"
    echo "|"
    echo -e "|-${YELLOW}${BOLD}> ${BLUE}Available Options:${NONE}"
    echo -e "|--${CYAN}${BOLD} 1. ${GREEN}Hyprland${NONE}"
    echo -e "|--${CYAN}${BOLD} 2. ${GREEN}bspwm${NONE}"
    echo "|"
    read -p "|--? Choose a window manager: " choice
    echo "|"
    case "$choice" in
        1)
            local hyprpkgs=(
                "hyprland"    \
                "hyprlock"    \ 
                "waybar"      \ 
                "wofi"
            )
            echo -e "|-${CYAN}${BOLD}> ${NONE}Installing ${BLUE}${BOLD}hyprland${NONE}"
            for pkg in "${hyprpkgs[@]}"; do
                install_package "$pkg"
            done

            if [[ -d "${CONFIG}/hypr" ]]; then
                echo -e "|-${CYAN}${BOLD}> ${NONE}Backing up existing ${BLUE}${BOLD}hypr${NONE} configuration"
                mv "${CONFIG}/hypr" "${DOTFILES}/.backup/hypr"
            fi

            mkdir "${CONFIG}/hypr"

            ln -s "${DOTFILES}/hypr/.conf/default.conf" "${CONFIG}/hypr/hyprland.conf"
            echo -e "|-${CYAN}${BOLD}> ${NONE}Symlinked ~/.dotfiles/.conf/default.conf -> ${CYAN}~/.config/hypr/hyprland.conf${NONE}"
            
            ln -s "${DOTFILES}/hypr/hyprlock.conf" "${CONFIG}/hypr/hyprlock.conf"
            echo -e "|-${CYAN}${BOLD}> ${NONE}Symlinked ~/.dotfiles/hypr/hyprlock.conf -> ${CYAN}~/.config/hypr/hyprlock.conf${NONE}"

            if [[ -d "${CONFIG}/waybar" ]]; then
                echo -e "|-${CYAN}${BOLD}> ${NONE}Backing up existing ${BLUE}${BOLD}waybar${NONE} configuration"
                mv "${CONFIG}/waybar" "${DOTFILES}/.backup/waybar"
            fi

            ln -s "${DOTFILES}/hypr/waybar/themes/theme-1" "${CONFIG}/waybar"
            echo -e "|-${CYAN}${BOLD}> ${NONE}Symlinked ~/.dotfiles/hypr/waybar/themes/theme-1 -> ${CYAN}~/.config/waybar${NONE}"
            ;;
        2)
            local bspwmpkgs=(
                "bspwm"         \
                "sxhkd"         \
                "polybar"       \
                "rofi"          \
                "picom"         \
                "dunst"         \
                "feh"           \
                "xorg-xinit"    \
                "xorg-server"   \
                "xorg-xrandr"   \
                "xorg-xset"     \
                "xorg-xsetroot"
            )
            echo -e "|-${CYAN}${BOLD}> ${NONE}Installing ${BLUE}${BOLD}bspwm${NONE}"
            for pkg in "${bspwmpkgs[@]}"; do
                install_package "$pkg"
            done

            if [[ -d "${CONFIG}/bspwm" ]]; then
                echo -e "|-${CYAN}${BOLD}> ${NONE}Backing up existing ${BLUE}${BOLD}bspwm${NONE} configuration"
                mv "${CONFIG}/bspwm" "${DOTFILES}/.backup/bspwm"
            fi

            ln -s "${DOTFILES}/bspwm" "${CONFIG}/bspwm"
            echo -e "|-${CYAN}${BOLD}> ${NONE}Symlinked ~/.dotfiles/bspwm -> ${CYAN}~/.config/bspwm${NONE}"

            if [[ -d "${CONFIG}/sxhkd" ]]; then
                echo -e "|-${CYAN}${BOLD}> ${NONE}Backing up existing ${BLUE}${BOLD}sxhkd${NONE} configuration"
                mv "${CONFIG}/sxhkd" "${DOTFILES}/.backup/sxhkd"
            fi

            ln -s "${DOTFILES}/sxhkd" "${CONFIG}/sxhkd"
            echo -e "|-${CYAN}${BOLD}> ${NONE}Symlinked ~/.dotfiles/sxhkd -> ${CYAN}~/.config/sxhkd${NONE}"

            if [[ -d "${CONFIG}/polybar" ]]; then
                echo -e "|-${CYAN}${BOLD}> ${NONE}Backing up existing ${BLUE}${BOLD}polybar${NONE} configuration"
                mv "${CONFIG}/polybar" "${DOTFILES}/.backup/polybar"
            fi

            ln -s "${DOTFILES}/polybar" "${CONFIG}/polybar"
            echo -e "|-${CYAN}${BOLD}> ${NONE}Symlinked ~/.dotfiles/polybar -> ${CYAN}~/.config/polybar${NONE}"

            if [[ -f "${HOME}/.Xresources" ]]; then
                echo -e "|-${CYAN}${BOLD}> ${NONE}Backing up existing ${BLUE}${BOLD}.Xresources${NONE}"
                mv "${HOME}/.Xresources" "${DOTFILES}/.backup/.Xresources"
            fi

            ln -s "${DOTFILES}/.Xresources" "${HOME}/.Xresources"
            echo -e "|-${CYAN}${BOLD}> ${NONE}Symlinked ~/.dotfiles/.Xresources -> ${CYAN}~/.Xresources${NONE}"
            ;;
        *)
            echo -e "|-${RED}${BOLD}> ${NONE}Invalid option"
            ;;
    esac
}

# =============================================================================
# --------------------------------- AUR-Helper  -------------------------------
# =============================================================================

function aur_helper() {
    echo
    echo -e "${CYAN}${BOLD}> ${BLUE}${BOLD}AUR Helper${NONE}"
    echo "|"
    echo -e "|-${YELLOW}${BOLD}> ${BLUE}Available Options:${NONE}"
    echo -e "|--${CYAN}${BOLD} 1. ${GREEN}yay${NONE}"
    echo -e "|--${CYAN}${BOLD} 2. ${GREEN}paru${NONE}"
    echo "|"
    read -p "|--? Choose an AUR helper: " choice
    echo "|"
    sudo pacman -S --needed base-devel --noconfirm &>> $INSTALL_LOG
    cd "${HOME}/Source/aur"
    case "$choice" in
        1)
            echo -e "|-${CYAN}${BOLD}> ${NONE}Cloning ${BLUE}${BOLD}yay${NONE}"
            git clone https://aur.archlinux.org/yay.git &>> $INSTALL_LOG
            echo -e "|-${CYAN}${BOLD}> ${NONE}Building ${BLUE}${BOLD}yay${NONE} package"
            cd yay && makepkg -si &>> $INSTALL_LOG
            ;;
        2)
            echo -e "|-${CYAN}${BOLD}> ${NONE}Cloning ${BLUE}${BOLD}paru${NONE}"
            git clone https://aur.archlinux.org/paru.git &>> $INSTALL_LOG
            echo -e "|-${CYAN}${BOLD}> ${NONE}Building ${BLUE}${BOLD}paru${NONE} package"
            cd paru && makepkg -si &>> $INSTALL_LOG
            ;;
        *)
            echo -e "|-${RED}${BOLD}> ${NONE}Invalid option"
            aur_helper
            ;;
    esac
    cd "${HOME}"
}


# =============================================================================
# ------------------------------- Languages -----------------------------------
# =============================================================================

function langs() {
    echo
    read -p "Do you want to install a bunch of language packages? (Y/n): " choice
    
    if [[ "$choice" == "n" || "$choice" == "N" ]]; then
        return
    fi

    echo
    echo -e "${CYAN}${BOLD}> ${BLUE}${BOLD}Installing language packages${NONE}"
    echo "|"
    local packages=(
        "dotnet-sdk"      \
        "dotnet-runtime"  \
        "aspnet-runtime"  \
        "nodejs"          \
        "npm"             \
        "go"              \
        "php"             \
        "julia"           \
        "jdk-openjdk"     \
        "python-pip"
    )
    for package in "${packages[@]}"; do
       install_package "$package" 
    done
    
    if [[ ! -d "${HOME}/.venvs" ]]; then
        mkdir "${HOME}/.venvs"
    fi
}

# =============================================================================
# ----------------------------- Development tools -----------------------------
# =============================================================================

function dev_tools() {
    echo
    echo -e "${CYAN}${BOLD}> ${BLUE}${BOLD}Installing development tools${NONE}"
    echo "|"
    local packages=(
        "git"         \
        "github-cli"  \
        "neovim"      \
        "code"        \
        "tmux"        \
    )
    for package in "${packages[@]}"; do
        install_package "$package"
    done
    echo "|"
    read -p "|--? Do you want to install docker? (Y/n): " choice
    if [[ "${choice}" == "y" || "${choice}" == "Y" ]]; then
        install_package "docker"    
    fi

    # neovim stuff
    local nvimpkgs=(
        "mercurial"     \
        "python-pynvim" \
        "luarocks"      \

    )

    sudo npm install -g neovim &>> $INSTALL_LOG
    
    echo "|"
    echo -e "|-${CYAN}${BOLD}> ${BLUE}${BOLD}Setting up symlinks${NONE}"

    if [[ -d "${CONFIG}/nvim" ]]; then
        echo -e "|-${CYAN}${BOLD}> ${NONE}Backing up existing ${BLUE}${BOLD}nvim${NONE}"
        mv "${CONFIG}/nvim" "${DOTFILES}/.backup/nvim"
    fi
    ln -s "${DOTFILES}/nvim" "${CONFIG}/nvim"
    echo -e "|-${CYAN}${BOLD}> ${NONE}Symlinked ${BLUE}${BOLD}nvim${NONE}"

    if [[ -f "${HOME}/.tmux.conf" ]]; then
        echo -e "|-${CYAN}${BOLD}> ${NONE}Backing up existing ${BLUE}${BOLD}tmux${NONE}"
        mv "${HOME}/.tmux.conf" "${DOTFILES}/.backup/tmux.conf"
    fi
    ln -s "${DOTFILES}/tmux.conf" "${HOME}/.tmux.conf"
    echo -e "|-${CYAN}${BOLD}> ${NONE}Symlinked ${BLUE}${BOLD}tmux${NONE}"

    if [[ ! -f "${CONFIG}/pycodestyle" ]]; then
        ln -s "${DOTFILES}/lsp/pycodestyle" "${CONFIG}/pycodestyle"
        echo -e "|-${CYAN}${BOLD}> ${NONE}Symlinked ${BLUE}${BOLD}pycodestyle${NONE}"
    fi
}

# =============================================================================
# --------------------------------- Firewall ----------------------------------
# =============================================================================

function setup_firewall() {
    echo
    echo -e "${CYAN}${BOLD}> ${BLUE}${BOLD}Firewall${NONE}"
    echo "|"
    read -p "|--? Do you want to install firewall (ufw)? (Y/n): " choice
    echo "|"
    if [[ "${choice}" == "y" || "${choice}" == "Y" ]]; then
        if is_installed "ufw"; then
            echo -e "|-${RED}${BOLD}> ${BLUE}${BOLD}${ufw}${NONE} is already installed"
        else
            echo -e "|-${BLUE}${BOLD}> ${NONE}Installing ${BLUE}${BOLD}${ufw}${NONE}..."
            sudo pacman -S --noconfirm "ufw" &>> $INSTALL_LOG
            echo -e "|-${CYAN}${BOLD}> ${NONE}Successfully installed ${BLUE}${BOLD}${ufw}${NONE}"
            
            echo -e "|-${CYAN}${BOLD}> ${NONE}Limiting port 22"
            sudo ufw limit 22/tcp &>> $INSTALL_LOG

            echo -e "|-${CYAN}${BOLD}> ${NONE}Allowing ports 80 and 443"
            sudo ufw allow 80/tcp &>> $INSTALL_LOG
            sudo ufw allow 443/tcp &>> $INSTALL_LOG
            
            echo -e "|-${CYAN}${BOLD}> ${NONE}Setting default rules"
            sudo ufw default deny incoming &>> $INSTALL_LOG
            sudo ufw default allow outgoing &>> $INSTALL_LOG
            
            echo -e "|-${CYAN}${BOLD}> ${NONE}Enabling ufw service"
            sudo systemctl enable ufw &>> $INSTALL_LOG
        fi
    else
        echo -e "|-${CYAN}${BOLD}> ${NONE}Skipping firewall installation"
    fi
}

function install() {
    touch "${INSTALL_LOG}"
    mkdir "${DOTFILES}/.backup"
    # mk_directories
    window_manager
    aur_helper
    langs
    dev_tools
    setup_firewall
}

# =============================================================================
# --------------------------------- Main --------------------------------------
# =============================================================================

if [ "$EUID" -ne 0 ]; then
    echo "This script requires sudo privileges for some operations."
    sudo -v  # Ask for the sudo password to validate
fi

echo -e "${CYAN}"
cat <<"EOF"

█▀▀ █░░ █ █▄░█  ░ █▀▄ █▀█ ▀█▀ █▀▀ █ █░░ █▀▀ █▀
█▀░ █▄▄ █ █░▀█  ▄ █▄▀ █▄█ ░█░ █▀░ █ █▄▄ ██▄ ▄█

Arch linux / hyprland WM installation.

EOF
echo -e "${NONE}"

echo "> Checking internet connection"
ping -c 1 8.8.8.8 > /dev/null 2>&1

if [ $? -eq 0 ]; then
  echo "> Internet is connected."
else
  echo "> No internet connection. Exiting installation..."
  exit 1
fi

# prompt for installation process confirmation
echo "You are about to install the flin dotfiles. Continue at your own risk."
read -p "Do you want to proceed with installation? (Y/n): " choice

case "$choice" in
    y|Y )
        install
        ;;
    n|N )
        echo "> Aborting..."
        exit 1
        ;;
esac
