systemctl --user daemon-reload
systemctl --user enable lowbat.timer
systemctl --user start lowbat.timer
