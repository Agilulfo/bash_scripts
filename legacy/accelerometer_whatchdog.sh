#! /bin/bash
# Use internal accelerometer of hp dv6 laptops to detect
# unauthorized person touching the laptop.

#valori in piano

TIMES="15"
SOGLIA="70"

echo "calibrazione! aspettare $TIMES secondi"

COUNT=1;

IDLEX="0"
IDLEY="0"
IDLEZ="0"

while [ $COUNT -le $TIMES ] ; do
	sleep 1
	IDLEXYZ=`cat /sys/devices/platform/lis3lv02d/position | grep -o -E "[-1234567890,]*"`

	let "IDLEX+= `echo $IDLEXYZ | cut -d "," -f 1 `"
	let "IDLEY+= `echo $IDLEXYZ | cut -d "," -f 2 `"
	let "IDLEZ+= `echo $IDLEXYZ | cut -d "," -f 3 `"
	echo "$COUNT $IDLEXYZ"
	let "COUNT+= 1"
done

let "IDLEX= $IDLEX / $TIMES"
let "IDLEY= $IDLEY / $TIMES"
let "IDLEZ= $IDLEZ / $TIMES"
echo "calibrazione effettuata: X=$IDLEX Y=$IDLEY Z=$IDLEZ"

#-----SOGLIE-----
let "SX= $IDLEY -$SOGLIA"
let "DX= $IDLEY +$SOGLIA"
let "UP= $IDLEX -$SOGLIA"
let "DN= $IDLEX +$SOGLIA"
let "ALZ= $IDLEZ -$SOGLIA"
let "ABS= $IDLEZ +$SOGLIA"

while true ; do
	sleep 1
	XYZ=`cat /sys/devices/platform/lis3lv02d/position | grep -o -E "[-1234567890,]*"`
	#echo "$XYZ"
	X=`echo $XYZ | cut -d "," -f 1 `
	Y=`echo $XYZ | cut -d "," -f 2 `
	Z=`echo $XYZ | cut -d "," -f 3 `
	#echo "x=$X y=$Y z=$Z"
	STOP="YES"

	if [ $Y -lt $SX ] ; then
		echo -n "SX←"
		STOP="NO"
	fi
	if [ $Y -gt $DX ] ; then
		echo -n "DX→"
		STOP="NO"
	fi
	if [ $X -lt $UP ] ; then
		echo -n "UP↑"
		STOP="NO"
	fi
	if [ $X -gt $DN ] ; then
		echo -n "DN↓"
		STOP="NO"
	fi

	if [ $Z -lt $ALZ ] ; then
		echo -n "↑"
		STOP="NO"
	fi
	if [ $Z -gt $ABS ] ; then
		echo -n "↓"
		STOP="NO"
	fi

	if [ $STOP = "NO" ] ; then
		echo
		#gedit > "/dev/null" &
		echo "lascia stare il mio compiuter" | espeak -v it -a 15 -s 250 > "/dev/null" 2> "/dev/null" &
		fswebcam -q -S 30  ladro.jpeg
	fi
	STOP="YES"
done
