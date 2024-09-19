# .dotfiles

[![Hyprland](https://img.shields.io/badge/Hyprland-b7bdf8?style=for-the-badge "Hyprland - A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks")](https://hyprland.org/)
[![Hyprlock](https://img.shields.io/badge/Hyprlock-abd6fd?style=for-the-badge "Hyprlock - Hyprland's GPU-accelerated screen locking utility")](https://github.com/hyprwm/hyprlock)
[![Waybar](https://img.shields.io/badge/Waybar-7dc4e4?style=for-the-badge "Waybar - Highly customizable Wayland bar for Sway and Wlroots based compositors")](https://github.com/Alexays/Waybar)
[![Alacritty](https://img.shields.io/badge/Alacritty-91d7e3?style=for-the-badge "Alacritty - A fast, cross-platform, OpenGL terminal emulator")](https://github.com/alacritty/alacritty)
[![Neovim](https://img.shields.io/badge/Neovim-8bd5ca?style=for-the-badge "Bourne Again SHell")](https://www.gnu.org/software/bash/manual/bash.html)
[![Zathura](https://img.shields.io/badge/Zathura-a6da95?style=for-the-badge "Zathura is a highly customizable and functional document viewer")](https://github.com/pwmt/zathura)
[![Sddm](https://img.shields.io/badge/Sddm-a6e3a1?style=for-the-badge "Simple Desktop Display Manager")](https://github.com/sddm/sddm)


## Contents

- [Waybar]()
- [Neovim]()
- [Installation](#installation)


## Installation

```bash
# clone the repository
git clone https://github.com/FLIVLA/.dotfiles.git $HOME/.dotfiles

# Run install script
$HOME/.dotfiles/.install/install.sh
```

### Firefox CSS

- Go to `about:config`, search for `toolkit.legacyUserProfileCustomizations.stylesheets`, and set to `true`.

- Find and copy the current active profile on the `about:profiles` page, then run the following command:

```bash
$HOME/.dotfiles/firefox/setup.sh <profile_dir>
```