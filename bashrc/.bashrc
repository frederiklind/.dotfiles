#
#  ░ █▄▄ ▄▀█ █▀ █░█ █▀█ █▀▀
#  ▄ █▄█ █▀█ ▄█ █▀█ █▀▄ █▄▄
#  
#  ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CONFIG_HOME="$HOME/.config"
export LUA_PATH="/usr/share/lua/5.4/?.lua;/usr/share/lua/5.4/?/init.lua;$HOME/.luarocks/share/lua/5.4/?.lua;$HOME/.luarocks/share/lua/5.4/?/init.lua;;"
export LUA_CPATH="/usr/lib/lua/5.4/?.so;$HOME/.luarocks/lib/lua/5.4/?.so;;"

export PATH="$HOME/.pyenv/shims:$PATH"
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

alias nv="nvim"                                   # open neovim
alias vdot="cd ~/.dotfiles && nvim"               # open neovim in dotfiles directory
alias cdot="code ~/.dotfiles"                     # open vscode in dotfiles directory
alias py="python3"                                # python3 alias
alias c="clear"                                   # clear terminal (primarily for tmux)

alias tmux="tmux -2"                                        # tmux alias - use 256 colors
alias tmuxsrc="tmux source-file ~/.config/tmux/tmux.conf"   # source tmux config
alias tma="tmux attach"                                     # attach to tmux session   

# utilities ---------------------------------------------------------------------

alias cp="cp -i"                                    # prompt before overwrite
alias cat='bat'                                     # syntax highlighting for cat
alias fr="ranger"                                   # open ranger file manager  
alias ft="thunar"                                   # open thunar file manager
alias zathura="~/.dotfiles/scripts/zathura.sh"      # open zathura
alias settings="~/.dotfiles/.settings/settings.sh"  # open settings.sh

alias ugrb="sudo grub-mkconfig -o /boot/grub/grub.cfg" # update grub

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

echo
fastfetch

eval "$(starship init bash)"
