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

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

alias ls='eza -a --icons'
alias ll='eza -al --icons'
alias lt='eza -a --tree --level=1 --icons'

# file managers
alias fr="ranger"
alias ft="thunar"

# neovim
alias nv="nvim"

# dotfiles shortcuts
alias dot="cd ~/source/dotfiles"
alias vdot="cd ~/source/dotfiles && nvim"
alias cdot="code ~/source/dotfiles"

# cd to repositories
alias src="cd ~/source/repos"

# web shortcuts 
alias gw="firefox https://www.github.com"
alias yt="firefox https://www.youtube.com"

# update grub config    
alias ugrb="sudo grub-mkconfig -o /boot/grub/grub.cfg"

alias zathura="~/source/dotfiles/scripts/zathura.sh"

# lang
alias py="python3"

# git
alias ngrp="~/source/dotfiles/scripts/ngrp.sh"
alias gqp="~/source/dotfiles/scripts/quickpush.sh"

neofetch

eval "$(starship init bash)"