#!/bin/bash

killall picom
pkill picom
sleep 0.2

picom --config ~/.config/picom/picom.conf
