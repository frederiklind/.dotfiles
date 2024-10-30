#!/bin/bash

ICON="${HOME}/.dotfiles/dunst/icons/volume.png"
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -o '[0-9]\+%' | head -n1 | tr -d '%')

MUTE_STATUS=$(pactl get-sink-mute @DEFAULT_SINK@)

if [ "$MUTE_STATUS" == "Mute: yes" ]; then
    VOLUME_BAR="Muted"
else
    FILLED_DOTS=$((VOLUME / 10))
    if [ "$FILLED_DOTS" -ge 10 ]; then
        FILLED_DOTS=10  
    fi

    if [ "$FILLED_DOTS" -eq 0 ]; then
        VOLUME_BAR=$(printf '  %.0s' $(seq 1 10))
    else
        EMPTY_DOTS=$((10 - FILLED_DOTS))
        VOLUME_BAR="$(printf '  %.0s' $(seq 1 $FILLED_DOTS))"
        if [ "$EMPTY_DOTS" -gt 0 ]; then
            VOLUME_BAR+=$(printf '  %.0s' $(seq 1 $EMPTY_DOTS))
        fi
    fi 
fi

notify-send -a "Volume" -i "$ICON" -r 9999 -t 900 "$VOLUME_BAR"
