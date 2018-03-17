#! /bin/bash/

# preso un pdf viene diviso in vari files da hop pagine e poi per ognuno 
# di questi file viene creato un file per le pagine pari ed uno per 
# quelle dispari


#lanciare dalla cartella dove si trova il file


PDFFILE=$1
NPAGES=`pdftk $PDFFILE dump_data | tail -1 | grep -o -E "[1-9]*"`
echo "$NPAGES"
HOP=20 #modificare per la propria comodità (DEVE ESSERE PARI)
START=1
END=$HOP
TIME=1
 
while [ $START -le $NPAGES ] ; do
	
	mkdir $TIME	
	
	if [ $END -gt $NPAGES ] ; then
		let "END= $NPAGES" 
	fi
	
	pdftk A=$PDFFILE shuffle A$START-$END output $TIME.pdf 
	mv $TIME.pdf $TIME
	
	
	cd $TIME 
	
	pdftk $TIME.pdf burst
	
	PARI=`ls | grep -o -E "^pg_.*[02468]\.pdf" | tr "\n" " "`
	DISPARI=`ls | grep -o -E "^pg_.*[13579]\.pdf" | tr "\n" " "`
	
	pdftk $PARI cat output pari.pdf
	pdftk $DISPARI cat output dispari.pdf
	
	rm pg*.pdf
	rm doc_data.txt
	cd ../
	
	let "TIME+= 1"
	let "START+= $HOP"
	let "END+= $HOP"
	
done
