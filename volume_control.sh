#! /bin/bash
# Script to help control volume avoiding to excess the max volume

DIRECTION=$1
DELTA=5
MAX_VOLUME=100

CURRENT_VOLUME=`pactl list sinks | grep -P "\tVolume:*" | cut -d'/' -f2 | tr -d "% "`

if [[ $DIRECTION = "+" ]] ; then
	if [[ $(($CURRENT_VOLUME + $DELTA)) -gt $MAX_VOLUME ]] ; then
		pactl set-sink-volume 0 $MAX_VOLUME%
	else
		pactl set-sink-volume 0 +$DELTA%
	fi
elif [[ $DIRECTION = "-" ]] ; then
	pactl set-sink-volume 0 -$DELTA%
fi

pactl play-sample vol
