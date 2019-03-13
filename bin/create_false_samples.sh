#!/bin/bash

# generate negative samples (= all transcript regions that do not overlap with peak regions)
for file in ../peakcalling/*_extended.bed; do
	echo $file 
	sortBed -i $file > $file".sorted"
	bedops --difference transcripts_hg38_sorted.bed $file".sorted" > $file".false"
done
mv ../peakcalling/*.false ../false_samples/



