#! /bin/bash

COMMAND=$1
INTERNAL_CARD="ALC269VC"

if [[ $COMMAND = "off" ]] ; then
    if aplay -l | grep -q "$INTERNAL_CARD" ; then
        CARD_NUMBER=`aplay -l | grep "$INTERNAL_CARD" | cut -d " "  -f 2 | cut -d ":" -f 1`
        echo "disabling card #$CARD_NUMBER"
        if echo 1 | sudo tee "/sys/class/sound/card${CARD_NUMBER}/device/remove" > /dev/null ; then
            echo "card disabled"
            exit 0
        fi
        echo "failed to disable card"
        exit 1
    fi
    echo "card not found."
    exit 1
elif [[ $COMMAND = "on" ]] ; then
    echo 1 | sudo tee /sys/bus/pci/rescan
else
    echo "USAGE: $1 on|off"
fi
