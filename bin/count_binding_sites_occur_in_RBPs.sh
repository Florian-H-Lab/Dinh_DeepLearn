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
#FILES=" "

echo "Generate First Intersect"
for i in {1..167}; do
	#FILES="$FILES $INPATH/Protein_rep"$i"_peaks_extended.bed" 
	echo $i 
	bedtools intersect -a "$INPATH/Protein_rep"$i"_peaks_extended.bed" -b "$INPATH/Protein_rep1_peaks_extended.bed" -s -c -f 0.5 > "$OUT/Protein_rep"$i"_RBP_count.bed"
done

for i in {1..167}; do
	for j in {2..167}; do
		echo $i
		echo $j 
		bedtools intersect -a "$OUT/Protein_rep"$i"_RBP_count.bed" -b "$OUT/Protein_rep"$j"_RBP_count.bed" -s -c -f 0.5 > "$OUT/Protein_rep"$i"_RBP_count_tmp.bed"
		mv "$OUT/Protein_rep"$i"_RBP_count_tmp.bed" "$OUT/Protein_rep"$i"_RBP_count.bed"
	done
done