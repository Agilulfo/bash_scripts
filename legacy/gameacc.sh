#! /bin/bash

# Use accelerometer of hp dv6 to press arrow keys
SX="0"
DX="0"
UP="0"
DN="0"
IDLESD="1"
IDLEUD="1"

while true ; do
	XYZ=`cat /sys/devices/platform/lis3lv02d/position | grep -o -E "[-1234567890,]*"`
	#echo "$XYZ"
	X=`echo $XYZ | cut -d "," -f 1 `
	Y=`echo $XYZ | cut -d "," -f 2 `
	Z=`echo $XYZ | cut -d "," -f 3 `
	#echo "x=$X y=$Y z=$Z"



	if [ $Y -lt "-150" ] ; then
		if [ $SX = "0" ] ; then
			#echo "premo tasto sx"
			xdotool keydown Left
		fi

		SX="1"
		DX="0"
		IDLESD="0"
	elif [ $Y -gt "90" ] ; then
		if [ $DX = "0" ] ; then
			#echo "premo tasto dx"
			xdotool keydown Right
		fi

		SX="0"
		DX="1"
		IDLESD="0"
	else
		if [ $DX = "1" ] ; then
			#echo "rilascio il tasto destro"
			xdotool keyup Right
		fi
		if [ $SX = "1" ] ; then
			#echo "rilascio il tasto sinistro"
			xdotool keyup Left
		fi

		SX="0"
		DX="0"
		IDLESD="1"
	fi

	if [ $X -lt "0" ] ; then
		if [ $UP = "0" ] ; then
			#echo "premo tasto su"
			xdotool keydown Up
		fi

		UP="1"
		DN="0"
		IDLEUD="0"
	elif [ $X -gt "130" ] ; then
		if [ $DN = "0" ] ; then
			#echo "premo tasto giu"
			xdotool keydown Down
		fi

		UP="0"
		DN="1"
		IDLEUD="0"
	else
		if [ $UP = "1" ] ; then
			#echo "rilascio il tasto su"
			xdotool keyup Up
		fi
		if [ $DN = "1" ] ; then
			#echo "rilascio il tasto giu"
			xdotool keyup Down
		fi

		UP="0"
		DN="0"
		IDLEUD="1"
	fi

done
