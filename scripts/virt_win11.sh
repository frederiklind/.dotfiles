#!/bin/zsh

tmp=$(virsh --connect qemu:///system list --all | grep win11 | awk '{print $3}')
if ([ "x$tmp" == 'x' ] || [ "x$tmp" == 'xrunning' ]); then
    virsh --connect qemu:///system start win11
    echo "win11 vm is starting..."
    exit
else
    echo "Starting xfreerdp..."
    xfreerpd -grab-keyboard /t:"Windows 11" /v:192.168.1.54
    exit
fi:w

