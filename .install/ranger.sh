#!/bin/bash

# install ranger-devicons2
echo "> Installing ranger-devicons2..."
mkdir "$DOTFILES/ranger/plugins" && echo "> Created ranger-plugins dir."
git clone https://github.com/cdump/ranger-devicons2 "$DOTFILES/ranger/plugins/ranger-devicons2"