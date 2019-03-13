#!/bin/bash

# script to just get the sequence of the peak regions
for file in ../motif_detection/*.fa; do
	echo $file
	cat $file | awk '!/^>/ {print $0}' > $file".txt"
done


