#!/bin/bash


SSID=(iwgetid -r)
IP=(ip addr show wlan0 | grep 'inet ' | awk '{print $2}' | cut -d'/' -f1)
DG=(ip route show | grep 'default via' | awk '{print $3}')


