#!/bin/bash

# Get the current working directory of the active pane
pane_cwd=$(tmux display-message -p '#{pane_current_path}')

# Check if the active pane's CWD is a Git repository root
if [[ "$(git -C "$pane_cwd" rev-parse --show-toplevel 2>/dev/null)" == "$pane_cwd" ]]; then
    echo "#[fg=#74c7ec] "
else
    echo ""
fi

