#!/bin/bash

interface="wlan0"

# Get the number of bytes transmitted and received
tx_bytes=$(ip -s link show "$interface" | awk '/TX:/{print $2}')
rx_bytes=$(ip -s link show "$interface" | awk '/RX:/{print $2}')

# Calculate the data transfer rates
tx_rate=$((tx_bytes / 1024))
rx_rate=$((rx_bytes / 1024))

# Output the results
echo "↑ ${tx_rate}KB/s ↓ ${rx_rate}KB/s"