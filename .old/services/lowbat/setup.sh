#!/bin/bash

ln -sf "$HOME/.dotfiles/services/lowbat/lowbat.service" "$HOME/.config/systemd/user/lowbat.service"
ln -sf "$HOME/.dotfiles/services/lowbat/lowbat.timer" "$HOME/.config/systemd/user/lowbat.timer"

systemctl --user daemon-reload
systemctl --user enable lowbat.timer
systemctl --user start lowbat.timer

echo -e "\nLowbat service installed and started"
