#!/bin/bash

os=$(uname -o)
distro=$(cat /etc/*-release | grep PRETTY_NAME | cut -d'=' -f2 | tr -d '"')
kernel=$(uname -r)
cpu=$(lscpu | grep 'Model name' | cut -f 2 -d ":" | awk '{$1=$1}1')
ram=$(grep MemTotal /proc/meminfo | awk '{print $2, $3}')

echo "$USER"@$HOSTNAME
echo "----------------------------------------------------"

printf "  %-20s    %-30s\n" "Operating System" "$os"
printf "  %-20s    %-30s\n" "Distribution" "$distro"
printf "  %-20s    %-30s\n" "Kernel Version" "$kernel"
printf "  %-20s    %-30s\n" "CPU" "$cpu"
printf "%-20s | %-30s\n" "Total RAM" "$ram"
