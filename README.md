# FLIN .dotfiles
These dotfiles are setup for arch-linux with hyprland WM.

**Note:** The current dotfiles install-script and configuration is setup to work on post to running the archinstall-script with desktop profile and hyprland preinstalled. In the future this will work with minimal arch installations. 



## Contents

- [-]()
- [-]()
- [Installation](#Installation)
- [Post Installation Configuration](#post-installation-configuration)
    - [Firefox CSS]()



## Installation

Install dotfiles preferably on a minimal arch installlation, by running following commands:

```bash
# create source dir
$ mkdir "$HOME/source"

# clone git repo
$ git clone https://github.com/FLIVLA/dotfiles.git "$HOME/source/dotfiles"

# change working directory 
$ cd "$HOME/source/dotfiles"

# run install script
$ ./install.sh 
```

The installation consists of multiple steps requiring user input. Most steps use `gum` for wasy selection of available options in the different steps. For steps with multi-selection, use SPACE-key to select each option before proceeding with RETURN-key.

### Paru - AUR Helper

Paru can be installed using the Paru install script, using the following commands:

```bash
$ ./dotfiles/.install/paru.sh
```

To manually install Paru, use the following steps:

```bash
# create directory for paru source code
$ mkdir <source-dir>

# change current working directory
$ cd <source-dir>

# clone paru git repo
$ git clone https://aur.archlinux.org/paru.git

# install from source
$ cd paru && makepkg -si
```


### Graphics card driver

For devices with NVIDIA cards, it might be best to select the Nouveau open source driver, as selecting the proprietary driver might cause instability in hyprland.


### Hyprland installation

After installing hyprland, the installation script will prompt you for selecting whether to install hyprlock as your screen lock. This is recommended, as you will have no way to lock your screen if proceeding without this step.


### Text/code editors 

The install script is able to install a selection of code editors (VSCode, Neovim, Vim, Emacs), however if these packages are already installed on the system while running the install script, these steps will be automatically skipped.

**NOTE:** For Emacs, Neovim and Vim, the script will delete any existing configurations you might have stored on your system. Therefore be sure to backup these if you want to save them, before running the installation script.


### Development Packages

These should probaby be done individually after installation.

```bash
# install java
$ sudo pacman -S jre----openjdk?

# install dotnet packages
$ sudo pacman -S dotnet-runtime dotnet-sdk aspnet-runtime

# install nodejs
$ sudo pacman -S nodejs

# install npm package manager
$ sudo pacman -S npm
```


## Post Installation Configuration

### github-cli

If you use the provided `.bashrc` file, there are some useful gh-cli aliases setup. To utilize these, you need to authenticate the application.

Login in to your github account by following these steps:

```bash
$ gh auth login

# set global git username and email
$ git config --global user.name "<USERNAME>"
$ git config --global user.email "<EMAIL_ADDRESS>"
```


### Visual Studio Code

Not sure if this is strictly a NVIDIA-GPU issue, however i usually experience blurriness in the VSCode user interface. I Have managed to resolve this by using a `code-flags.conf` file.


### Neovim - LaTeX

To use the Latex compiler in Neovim, a pdf is required. Zathura is installed during as part of the installation script, and will be the default pdf viever. This option can be changed in the Neovim configuration, in `.dotfiles/nvim/lua/plugins/vimtex.lua`. Following packages will need to be installed on the system:

```bash
$ sudo pacman -S zathura
$ sudo pacman -S zathura-pdf-poppler
$ sudo pacman -S 
```


### Firefox CSS

To use the included firefox css, a few steps are required for this to work.

1. Open a new Firefox browser and navigate to `about:config`.
2. Search for `toolkit.legacyUserProfileCustomizations.stylesheets`, and double-click it until it displays `True`.
3. Navigate to `about:profiles` to check for the current profile in use. This will display the directory of the profile under `Root Directory` field.


#### Install with setup-script

The setup script will detect and warn you about any existing CSS files in the firefox profile. If you want to save them, back them up before proceeding with the final steps of the setup-script.

```bash
$ cd "$HOME/source/dotfiles/firefox-config"

# run script (replace <profile_dir> with actual profile dir noted in step 3)
$ ./setup.sh <profile_dir>
```
