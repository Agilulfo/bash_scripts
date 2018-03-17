#! /bin/bash/

#pulisci testo

TESTO=$1

COUNT=0

for LINE in `cat $TESTO` ; do
	echo "$COUNT $LINE"
	let "COUNT+=1"
	if echo -n $LINE | grep -q -E "[?.!]$"  ; then
		#~ echo "if"
		LINE=`echo $LINE`
	fi
	#~ echo "for"
	#~ echo -n "$LINE"
done
