#!/bin/bash


for file in $(cat lista.txt); do

	echo $file
	#sleep 0.5
	rm -f $file

done
