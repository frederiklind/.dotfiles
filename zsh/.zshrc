#
#  ░ ▀█ █▀ █░█ █▀█ █▀▀
#  ▄ █▄ ▄█ █▀█ █▀▄ █▄▄
#
#  

[[ $- != *i* ]] && return

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

export TERM=xterm-256color

export XDG_CONFIG_HOME="$HOME/.config"
export LUA_PATH="/usr/share/lua/5.4/?.lua;/usr/share/lua/5.4/?/init.lua;$HOME/.luarocks/share/lua/5.4/?.lua;$HOME/.luarocks/share/lua/5.4/?/init.lua;;"
export LUA_CPATH="/usr/lib/lua/5.4/?.so;$HOME/.luarocks/lib/lua/5.4/?.so;;"
export PATH=/opt/cuda/bin:$PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

# export PATH="$HOME/.pyenv/shims:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

PS1='[\u@\h \W]\$ '                               # custom prompt     

# navigation ---------------------------------------------------------------------

alias ..="cd .."                                  # go up one directory
alias ...="cd ../.."                              # go up two directories
alias 3.="cd ../../.."                            # go up three directories
alias 4.="cd ../../../.."                         # go up four directories
alias 5.="cd ../../../../.."                      # go up five directories

alias dot="cd ~/.dotfiles"                        # go to dotfiles directory
alias cf="cd ~/.config"                           # go to config directory
alias src="cd ~/Source/repos"                     # go to repos directory
alias doc="cd ~/Documents"                        # go to documents

# ls commands --------------------------------------------------------------------

alias ls='ls --color=auto'                        # color ls
alias grep='grep --color=auto'                    # color grep
alias ls='eza -a --icons'                         # list all files with icons
alias ll='eza -al --icons'                        # list all files with icons 
alias lt='eza -a --tree --level=3 --icons'        # list tree view with icons
alias l.='eza -d .* --color=auto'                 # list hidden files

# pacman & paru -----------------------------------------------------------------

alias pacman="sudo pacman"                        # pacman alias
alias pacsyu="sudo pacman -Syu"                   # update system
alias pacsc="sudo pacman -Scc"                    # clean package cache

pacclean() {                                      # remove orphaned packages
    sudo pacman -Rns $(pacman -Qtdq)
}

alias parup="paru -Syu"                           # update system
alias parsc="paru -Scc"                           # clean package cache

paruclean() {                                     # remove orphaned packages
    paru -Rns $(paru -Qtdq)
}

# dev ---------------------------------------------------------------------------

alias gqp="~/.dotfiles/scripts/quickpush.sh"      # quick git push
alias status="git status"                         # git status
alias pull="git pull"                             # git pull
alias fetch="git fetch"                           # git fetch
alias push="git push"                             # git push
alias add="git add"                               # git add
alias commit="git commit"                         # git commit
alias clone="git clone"                           # git clone
alias checkout="git checkout"                     # git checkout
alias branch="git branch"                         # git branch
alias merge="git merge"                           # git merge
alias switch="git switch"                         # git switch
alias gcfu="~/.dotfiles/gitconfig/mk-gitconfig.sh"  # update gitconfig

alias ncpp="~/.dotfiles/templates/cpp-proj.sh"    # run c++ project wizard

alias nv="nvim"                                   # open neovim
alias snv="sudo -E nvim"                          # nvim with sudo priveliges
alias vdot="cd ~/.dotfiles && nvim"               # open neovim in dotfiles directory
alias cdot="cd ~/.dotfiles && code ./"            # open vscode in dotfiles directory
alias py="python3"                                # python3 alias
alias .vac="source .venv/bin/activate"            # activate virtual environment
alias c="clear"                                   # clear terminal (primarily for tmux)

alias tmux="tmux -2"                                        # tmux alias - use 256 colors
alias ts="~/.dotfiles/scripts/tmux-session.sh"              # tmux session (takes name param)
alias tmuxsrc="tmux source-file ~/.config/tmux/tmux.conf"   # source tmux config
alias tma="tmux attach"                                     # attach to tmux session   
alias sesh="tmux new -s"                                    # create new tmux session

alias gpt="~/.dotfiles/scripts/chatgpt.sh"            # open native chatgpt
alias ugpt="~/.dotfiles/scripts/update-gpt-native.sh" # update native chatgpt

# network -----------------------------------------------------------------------

alias ports="netstat -tuln"                       # list open ports

 # get public ip address
alias ipp="wget -qO- http://ifconfig.me 2>/dev/null | tr -d '%' | awk 'NF {print $1}'"

# get local ip address
alias ipl="ip -4 addr show scope global | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1"

# utilities ---------------------------------------------------------------------

alias cp="cp -i"                                    # prompt before overwrite
alias fr="ranger"                                   # open ranger file manager  
alias ft="thunar"                                   # open thunar file manager
alias zathura="~/.dotfiles/scripts/zathura.sh"      # open zathura
alias settings="~/.dotfiles/.settings/settings.sh"  # open settings.sh
alias ff="fastfetch"                                # fastfetch alias (sys info)

alias ugrb="sudo grub-mkconfig -o /boot/grub/grub.cfg" # update grub
alias vpn="nordvpn"                                    # nordvpn alias

# archived file extraction function easy mode
# example usage: ex <file>
ex() {
    if [ -f $1 ]; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar x $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via ex()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# -------------------------------------------------------------------------------

fastfetch                     # run fastfetch
echo
eval "$(starship init zsh)"   # setup starship prompt

# source zsh-syntax-highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bun completions
[ -s "/home/flin/.bun/_bun" ] && source "/home/flin/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
