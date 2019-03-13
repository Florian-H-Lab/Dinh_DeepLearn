#!/bin/bash
# script to get the structual data of the peak regions obtained from RNAfold
for file in ../structure_prediction/*.txt; do
	echo $file
	cat $file | awk -v FS=" " '/\)$/ {print $1}' > $file"_MFE.txt"
	cat $file | awk -v FS=" " '/\]$/ {print $1}' > $file"_square.txt"
	cat $file | awk -v FS=" " '/d=/ {print $1}' > $file"_dinfo.txt"
	cat $file | awk -v FS=" " '/MEA/ {print $1}' > $file"_MEA.txt"
done
mv ../structure_prediction/*_MFE.txt ../MFE/
mv ../structure_prediction/*_square.txt ../square/
mv ../structure_prediction/*_dinfo.txt ../dinfo/
mv ../structure_prediction/*_MEA.txt ../MEA/


