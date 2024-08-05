#!/bin/bash

status=$(nordvpn status)

if [[ $status == *"Disconnected"* ]]; then
    echo "Not Connected"
else
    echo "Connected"
fi
