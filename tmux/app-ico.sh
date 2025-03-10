#!/bin/bash

app=$(tmux display-message -p '#{pane_current_command}')

case $app in
    "vim")
        icon=""
        color="green"
        title="Vim"
        ;;
    "nvim")
        icon=""
        color="cyan"
        title="Neovim"
        ;;
    "ssh")
        icon="󰢹"
        color="yellow"
        title="SSH"
        ;;
    "htop")
        icon="󰘓"
        color="red"

        title=""
        ;;
    "python"|"python3")
        icon=""
        color="cyan"
        title="Python"
        ;;
    "bash")
        icon=""
        color="#fab387"
        title="bash"
        ;;
    *)
        icon=""
        color="#cba6f7"
        title=Tmux
        ;;
esac

echo "#[fg=$color,bg=#181926,bold]$icon #[fg=blue,bg=#181926]$title"

