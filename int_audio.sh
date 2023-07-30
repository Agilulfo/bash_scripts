#! /bin/bash

COMMAND=$1
INTERNAL_CARD="ALC269VC"

if [[ $COMMAND = "on" ]] ; then
    echo 1 | sudo tee /sys/bus/pci/rescan
elif [[ $COMMAND = "off" ]] ; then
    echo 1 | sudo tee /sys/class/sound/card0/device/remove
else
    echo "USAGE: $1 on|off"
fi
