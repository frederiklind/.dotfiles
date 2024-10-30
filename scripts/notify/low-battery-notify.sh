#!/bin/bash

CRITICAL_LEVEL=20
FLAG_FILE="$XDG_RUNTIME_DIR/low_battery_notified"
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
BATTERY_STATUS=$(cat /sys/class/power_supply/BAT0/status)

ICON="${HOME}/.dotfiles/dunst/icons/warning.png"

if [ "$BATTERY_LEVEL" -le "$CRITICAL_LEVEL" ] && [ "$BATTERY_STATUS" = "Discharging" ]; then
    if [ ! -f "$FLAG_FILE" ]; then
        notify-send "Battery Low" "Battery level is at ${BATTERY_LEVEL}%.\nPlease plug in the charger." -t 0 -i "$ICON"
        touch "$FLAG_FILE"
    fi
else
    [ -f "$FLAG_FILE" ] && rm "$FLAG_FILE"
fi
