#!/bin/sh
# properties = {"type": "single", "rule": "rna_structure_prediction", "local": false, "input": ["/scratch/bi03/heylf/Dinh/ELAVL1/Murkherjee/motif_detection/ELAVL1_rep1_peaks.fa"], "output": ["/scratch/bi03/heylf/Dinh/ELAVL1/Murkherjee/structure_prediction/ELAVL1_rep1_structures.txt"], "wildcards": {"sample": "ELAVL1", "replicate": "rep1"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 1, "cluster": {"jobname": "Structure", "cores": "smp 4", "mem": "h_vmem=5G", "out": "/scratch/bi03/heylf/Snakemake_Cluster_Logs", "err": "/scratch/bi03/heylf/Snakemake_Cluster_Logs"}}
cd /scratch/bi03/heylf/SalamiSnake_CLIP_2 && \
/scratch/bi01/heylf/miniconda3/envs/snakemake5.3/bin/python3.6 \
-m snakemake /scratch/bi03/heylf/Dinh/ELAVL1/Murkherjee/structure_prediction/ELAVL1_rep1_structures.txt --snakefile /scratch/bi03/heylf/SalamiSnake_CLIP_2/Snakefile.py \
--force -j --keep-target-files --keep-remote \
--wait-for-files /scratch/bi03/heylf/SalamiSnake_CLIP_2/.snakemake/tmp._bjf1e0q /scratch/bi03/heylf/Dinh/ELAVL1/Murkherjee/motif_detection/ELAVL1_rep1_peaks.fa /scratch/bi03/heylf/salamisnake_conda/7203c8da --latency-wait 60 \
 --attempt 1 --force-use-threads \
--wrapper-prefix https://bitbucket.org/snakemake/snakemake-wrappers/raw/ \
--directory /scratch/bi03/heylf/SalamiSnake_CLIP_2   --nocolor \
--notemp --no-hooks --nolock --mode 2  --use-conda  --conda-prefix /scratch/bi03/heylf/salamisnake_conda  --allowed-rules rna_structure_prediction  && touch "/scratch/bi03/heylf/SalamiSnake_CLIP_2/.snakemake/tmp._bjf1e0q/1.jobfinished" || (touch "/scratch/bi03/heylf/SalamiSnake_CLIP_2/.snakemake/tmp._bjf1e0q/1.jobfailed"; exit 1)

