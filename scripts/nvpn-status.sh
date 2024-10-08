#!/bin/bash

status=$(nordvpn status)

if [[ $status == *"Disconnected"* ]]; then
    echo ""
else
    echo ""
fi
