#!/bin/bash

# Colors
RED="\033[0;31m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

# Fetch script to display system information

# Get OS and Kernel information
OS=$(uname -o)
KERNEL=$(uname -r)

# Get hostname
HOST=$HOSTNAME

# Get uptime
UPTIME=$(uptime -p)

# Get memory usage
MEMORY=$(free -h | awk '/^Mem:/ {print $3 "/" $2}')

# Get disk usage
DISK=$(df -h / | awk 'NR==2 {print $3 "/" $2}')

# Get CPU information
CPU=$(lscpu | grep "Model name" | awk -F: '{print $2}' | sed 's/^[ \t]*//')

# Print information
# echo -e "${BLUE}╭──────────────────────────╮"
# echo -e "${YELLOW}OS ${NC} $OS"
# echo -e "${YELLOW}Kernel:${NC} $KERNEL"
# echo -e "${YELLOW}Hostname:${NC} $HOST"
# echo -e "${YELLOW}Uptime:${NC} $UPTIME"
# echo -e "${YELLOW}Memory:${NC} $MEMORY"
# echo -e "${YELLOW}Disk:${NC} $DISK"
# echo -e "${YELLOW}CPU:${NC} $CPU"
#
# echo -e "${BLUE}╰──────────────────────────╯"


# Define colors from your configuration
colors=(
    "\033[38;2;138;173;244m" # blue
    "\033[38;2;138;173;244m" # blue
    "\033[38;2;138;173;244m" # blue
    "\033[38;2;203;166;247m" # red
    "\033[38;2;242;205;205m" # green
    "\033[38;2;180;190;254m" # yellow
    "\033[38;2;138;173;244m" # blue
    "\033[38;2;203;166;247m" # magenta
    "\033[38;2;139;213;202m" # cyan
    "\033[38;2;184;192;224m" # white
)
NC="\033[0m" # No Color

# ASCII Art
art=(
    "                   ▄"
    "                  ▟█▙"
    "                 ▟███▙"
    "                ▟█████▙"
    "               ▟███████▙"
    "              ▂▔▀▜██████▙"
    "             ▟██▅▂▝▜█████▙"
    "            ▟█████████████▙"
    "           ▟███████████████▙"
    "          ▟█████████████████▙"
    "         ▟███████████████████▙"
    "        ▟█████████▛▀▀▜████████▙"
    "       ▟████████▛      ▜███████▙"
    "      ▟█████████        ████████▙"
    "     ▟██████████        █████▆▅▄▃▂"
    "    ▟██████████▛        ▜█████████▙"
    "   ▟██████▀▀▀              ▀▀██████▙"
    "  ▟███▀▘                       ▝▀███▙"
    " ▟▛▀                               ▀▜▙"
)

# Print ASCII Art with cycling colors
for i in "${!art[@]}"; do
    color=${colors[$((i % ${#colors[@]}))]}
    echo -e "${color}${art[i]}${NC}"
done
