#!/bin/bash
#$ -N Download
#$ -cwd
#$ -pe smp 10
#$ -l h_vmem=1G
#$ -o /scratch/bi03/heylf/Snakemake_Cluster_Logs/
#$ -e /scratch/bi03/heylf/Snakemake_Cluster_Logs/
#$ -M heylf@informatik.uni-freiburg.de
#$ -m a
#$ -R y

URL_LIST="downloads.txt"
cat $URL_LIST | xargs -n 1 -P 10 wget -q

# will pass one argument at a time (-n 1) to wget, 
# and execute at most 8 parallel wget processes at a time (-P 8). 
# xarg returns after the last spawned process has finished, 
# which is just what we wanted to know. No extra trickery needed.