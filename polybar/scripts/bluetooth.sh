#!/usr/bin/env bash
set -euo pipefail

# Bluetooth powered?
powered="$(bluetoothctl show 2>/dev/null | awk -F': ' '/Powered/ {print $2; exit}' || true)"

if [[ "$powered" != "yes" ]]; then
  echo "󰂲"
  exit 0
fi

# Connected device (first one)
mac="$(bluetoothctl devices Connected 2>/dev/null | awk '{print $2; exit}' || true)"
if [[ -z "${mac}" ]]; then
  echo "󰂯"
  exit 0
fi

name="$(bluetoothctl info "$mac" 2>/dev/null | awk -F': ' '/Name/ {print $2; exit}' || true)"
name="${name:-Connected}"

# Trim long names
max=18
if ((${#name} > max)); then
  name="${name:0:max}…"
fi

echo "󰂯 ${name}"
