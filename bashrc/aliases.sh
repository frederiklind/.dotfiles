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

# custom apps
alias zathura="~/source/dotfiles/scripts/zathura.sh"
alias books="py ~/source/repos/book-lib-tui/src/main.py"
alias nvpn="py ~/source/repos/nvpn-tui/src/main.py"

# lang
alias py="python3"

# git
alias ngrp="~/source/dotfiles/scripts/ngrp.sh"
alias gqp="~/source/dotfiles/scripts/quickpush.sh"
alias np="python3 ~/source/repos/dev-wizard/src/devwiz.py"