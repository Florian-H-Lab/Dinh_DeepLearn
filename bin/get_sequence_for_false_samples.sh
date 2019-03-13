#!/bin/bash
#$ -N get_seq
#$ -cwd
#$ -pe smp 1
#$ -l h_vmem=4G
#$ -o /scratch/bi03/heylf/Snakemake_Cluster_Logs/
#$ -e /scratch/bi03/heylf/Snakemake_Cluster_Logs/

source activate python3
for file in ../false_samples/*.false; do
	echo $file
        awk -v OFS="\t" 'BEGIN{srand(123)} $1 ~ /^chr/ {min=$2; max=$3; start=int(min + (rand() * (max-min+1))); end=start+100; print $1, start, end}' $file > $file".random"	
	python ../../SalamiSnake_CLIP/scripts/fetch_DNA_sequence.py -o $file".fa" $file".random" ../../genomes/hg38/hg38.fa
	awk '!/^>chr/ {print $0}' $file".fa" > $file".sequence.fa"
done 
source deactivate
