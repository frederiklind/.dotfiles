#!/bin/bash

# remove old
rm -rf ~/.local/share/ChatGPT-linux-x64

# Update GPT-3 Nativefier app
nativefier https://chat.openai.com --name "ChatGPT" --inject ~/.dotfiles/nativefier-css/chatgpt.css

# move
mv ./ChatGPT-linux-x64 ~/.local/share/
