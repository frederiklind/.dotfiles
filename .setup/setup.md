# Contents

### Arch Installation

- [1. Connecting to wifi](#1-connecting-to-wifi)
- [2. Synchronize package databases](#2-synchronize-package-databases)
- [3. Partitioning](#3-partitioning)
- [4. Archinstall](#4-archinstall-script)

### Post Install

- [General](setup.md/#general)
    - [Paru - AUR Helper](#paru---aur-helper)
    - [Zathura]()
- [Terminal](./terminal/terminal-wiki.md/#terminal)
    - [General](./md/terminal.md/#general)
    - [NerdFont]()
    - [Alacritty Terminal Emulator](./md/terminal.md/#alacritty-terminal-emulator)
    - [Starship Cross Shell Prompt](./md/terminal.md/#starship-cross-shell-prompt) 
- [Code Editors]()
    - [Neovim](./md/neovim.md)
    - [VisualStudio Code]()
- [Developer](#developer)
    - [Git](#git)
    - [Languages and Tools](#languages-and-tools)
- [Browser]()
    - [Firefox]()
- [Privacy and Security]()
    - [Firewall]()
    - [VPN]()

# Arch Installation

### 1. Connecting to wifi

Connect to wifi (if not conected by ethernet cable):

```bash
# enter iwd shell mode
$ iwctl

# list devices
$ device list

# connect to specified wifi network.
# followed by a passphrase prompt
$ station $device connect $ssid

# exit iwd mode
$ exit

# verify connection
$ ping $url
```

### 2. Synchronize package databases

```bash
$ pacman -Sy
$ pacman -Sy archlinux-keyring
$ pacman -Sy archinstall
```

### 3. Partitioning

List all drives connected to device.

```bash
$ lsblk
```

Enter formatting and partitioning interface

```bash
$ cfdisk /dev/$drive    # most likely nvme0n1
```

Create partitions, EFI (EFI System), root (Linux filesystem) partition, and swap partition (optional).

```bash
# format EFI partition
$ mkfs.fat -F32 /dev/nvme0n1p<n>

# format root partition
$ mkfs.ext4 /dev/nvme0n1p<n>

# format swap partition (optional)
$ mkswap...
```

Mount the partitions using the following commands:

```bash
# mount root partition
$ mount /dev/nvme0n1p<n> /mnt

# create directory for efi partition
$ mkdir /mnt/boot

# mount efi partition
$ /dev/nvme0n1p<n> /mnt/boot

# verify correct mount of partitions
$ lsblk
```

### 4. Archinstall script

Run the archinstall script using the following command

```bash
$ archinstall
```

My recommended options for these dotfiles:

| | |
|-|-|
| Archinstall Language | English (100%) |
| Display Manager | sddm |
| Audio Server | pipewire |
| Network Configuration | NetworkManager |
| Additional Packages | git, nvim |

**NOTE:** do not forget to use network manager, as you will be stuck without access to internet after installation.

### 5. Bootloader



<br/>



# Post Install Setup


<br/>
<br/>

# General

To prevent issues with git, see [git section](#)


```bash
$ mkdir -p ~/Source/repos
$ mkdir ~/Documents ~/Downloads ~/Pictures
```

## Paru - AUR Helper

Paru can be installed using the Paru install script, using the following commands:

```bash
$ ./dotfiles/.install/paru.sh
```

To manually install Paru, use the following steps:

```bash
# create directory for paru source code
$ mkdir -p ~/Source/aur && cd ~/Source/aur

# clone paru git repo
$ git clone https://aur.archlinux.org/paru.git

# install from source
$ cd paru && makepkg -si
```

## Zathura

```bash
# install packages
$ sudo pacmam -S zathura zathura-pdf-poppler

# remove default config
$ rm -rf ~/.config/zathura

# create config symlink
$ ln -s ~/.dotfiles/zathura ~/.config/zathura
```

## Photo viewer


# Terminal

## Bashrc

Create symlink for custom bashprofile.

```bash
$ ln -sf ~/.dotfiles/bashrc/.bashrc ~/.bashrc

# to apply changes
$ source ~/.bashrc
```

For the bashprofile to work correctly, a few additional packages are necessary to be installed. Neofetch for initial sessions, and eza for color-ls.

```bash
# install neofetch
$ sudo pacman -S neofetch eza

# remove default config directory
$ rm -rf ~/.config/neofetch

# create config symlink
$ ln -sf ~/.dotfiles/neofetch ~/.config/neofetch
```

## Alacritty Terminal Emulator

To install alacritty and use the custom configuration, run the following commands manually:

```bash
# Install via pacman
$ sudo pacman -S alacritty

# remove default config directory
$ rm -rf ~/.config/alacritty

# setup config symlink
$ ln -sf ~/.dotfiles/alacritty
```

## Starship Cross-Shell Prompt

Install starship on system using command:

```bash
# install using curl
$ curl -sS https://starship.rs/install.sh | sh

# create config symlink
$ ln -sf ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
```

In case of using the default bash profile, add the following line to the end of the `.bashrc` file:

```bash
# ~/.bashrc
eval "$(starship init bash)"
```

## TMUX - Terminal Multiplexer

# Developer

## Git


## Languages and tools

```bash
# install dotnet
sudo pacman -S dotnet-runtime aspnet-runtime dotnet-sdk

# install java
sudo pacman -S 
```


# Code Editors

## Neovim

Install Neovim

```bash
# install via pacman
$ sudo pacman -S nvim

# remove default config
$ rm -rf ~/.config/nvim

# create config symlink
$ ln -sf ~/.dotfiles/nvim ~/.config/nvim
```

Then open nvim to let Lazy.nvim work its magic. When plugins are installed, a few extra steps is needed in order for the editor to work optimally with lsp support, and syntax highlighting.

### LSP support

### Syntax highlighting

```
# Install language in treesitter
:TSInstall <lang>

```

## VisualStudio Code


# Browser

## Firefox


# Privacy and Security

## Firewall

## VPN