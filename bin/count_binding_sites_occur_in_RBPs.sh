#!/bin/bash
#$ -N count_binding_sites_occur_in_RBPs
#$ -cwd
#$ -pe smp 1
#$ -l h_vmem=10G
#$ -o /scratch/bi03/heylf/Snakemake_Cluster_Logs/
#$ -e /scratch/bi03/heylf/Snakemake_Cluster_Logs/

# use script to count how often a binding site appears in different RBPs
INPATH="/scratch/bi03/heylf/Dinh/peakcalling"
OUT="/scratch/bi03/heylf/Dinh/RBPs_count"
FILES=" "

for i in {1..167}; do
	FILES="$FILES $INPATH/Protein_rep"$i"_peaks_extended.bed" 
done

for j in {1..167}; do
	echo $j 
	bedtools intersect -a "$INPATH/Protein_rep"$j"_peaks_extended.bed" -b $FILES -s -c > "$OUT/Protein_rep"$j"_RBP_count.bed"
done



