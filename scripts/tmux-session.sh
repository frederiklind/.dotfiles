#!/bin/zsh

if [ -z "$1" ]; then
    echo "Usage: $0 <session-name>"
    exit 1
fi

tmux new -s $1
