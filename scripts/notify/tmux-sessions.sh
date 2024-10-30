#!/bin/bash

# Define the icon path
ICON_PATH="${HOME}/.dotfiles/dunst/icons/terminal.png"  # replace with your actual path

# Check for active tmux sessions
SESSIONS=$(tmux list-sessions -F "#{session_name}" 2>/dev/null)

# Set the message based on whether there are active sessions
if [ -z "$SESSIONS" ]; then
    MESSAGE="No Active tmux sessions"
else
    MESSAGE="Active tmux sessions:\n$SESSIONS"
fi

# Send notification with custom icon
notify-send -a "tmux" -i "$ICON_PATH" -r 9999 -t 3000 "TMUX Status" "$MESSAGE"
