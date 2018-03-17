#! /bin/bash
# convert quality of files (images?) in current directory

FOLDER=`pwd`/$1
OUTFOLDER=$2
QUALITY=$3
FORMAT=$4

cd $FOLDER
mkdir $OUTFOLDER

for FILE in `ls` ; do
	convert $FILE -quality $QUALITY $OUTFOLDER/$FILE
	echo "file $FILE done!"
done
