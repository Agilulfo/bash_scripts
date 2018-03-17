#!/bin/bash
# Not sure about what this script is supposed to do.
# Seems it rename jgp files assigning a random name

for file in *.jpg; do
	mv $file $(dd if=/dev/urandom count=1 2>/dev/null | md5sum | cut -b 1-32).jpg;
done
