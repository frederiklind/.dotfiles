#
#  ░ █▄▄ ▄▀█ █▀ █░█ █▀█ █▀▀
#  ▄ █▄█ █▀█ ▄█ █▀█ █▀▄ █▄▄
#  
#  ~/.bashrc
#
#  By Frederik Lind (2024)
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CONFIG_HOME="$HOME/.config"
export LUA_PATH="/usr/share/lua/5.4/?.lua;/usr/share/lua/5.4/?/init.lua;$HOME/.luarocks/share/lua/5.4/?.lua;$HOME/.luarocks/share/lua/5.4/?/init.lua;;"
export LUA_CPATH="/usr/lib/lua/5.4/?.so;$HOME/.luarocks/lib/lua/5.4/?.so;;"

# GTK scaling settings
export GDK_SCALE=0.5
export GDK_DPI_SCALE=0.5

# Qt scaling for high DPI monitors
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_SCALE_FACTOR=0.5
export QT_CURSOR_SIZE=24

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

alias pacman="sudo pacman" 

alias cat='bat'
alias c="clear"
alias fr="ranger"
alias ft="thunar"
alias nv="nvim"
alias dot="cd ~/.dotfiles"
alias vdot="cd ~/.dotfiles && nvim"
alias cdot="code ~/.dotfiles"
alias settings="~/.dotfiles/.settings/settings.sh"
alias src="cd ~/Source/repos"
alias cf="cd ~/.config"
alias gw="firefox https://www.github.com"
alias yt="firefox https://www.youtube.com"
alias ugrb="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias zathura="~/.dotfiles/scripts/zathura.sh"
alias py="python3"
alias ngrp="~/.dotfiles/scripts/ngrp.sh"
alias gqp="~/.dotfiles/scripts/quickpush.sh"
alias gs="git status"
alias gp="git pull"
alias tmux="tmux -2"
alias tmuxsrc="tmux source-file ~/.config/tmux/tmux.conf"

echo
fastfetch

eval "$(starship init bash)"

export PATH=$PATH:/home/flin/.spicetify
