#!/bin/bash

ICON="${HOME}/.dotfiles/dunst/icons/nordvpn-2.png"
VPN_STATUS=$(nordvpn status)

STATUS=$(echo "$VPN_STATUS" | grep -o "Status: [a-zA-Z]*" | cut -d " " -f 2)

if [ "$STATUS" == "Disconnected" ]; then
    notify-send -a "NordVPN" -i "$ICON" -r 9999 -t 0 "NordVPN" "Disconnected"
else
    COUNTRY=$(echo "$VPN_STATUS" | grep -o "Country: [a-zA-Z]*" | cut -d " " -f 2)
    CITY=$(echo "$VPN_STATUS" | grep -o "City: [a-zA-Z]*" | cut -d " " -f 2)
    notify-send -a "NordVPN" -i "$ICON" -r 9999 -t 0 "NordVPN" "Connected to ${CITY}, ${COUNTRY}"
fi
