#!/bin/bash

~/.local/share/ChatGPT-linux-x64/ChatGPT \
    --force-device-scale-factor=1.3 \
    --inject "~/.dotfiles/nativefier-css/chatgpt.css" \
> /dev/null 2>&1 & disown
