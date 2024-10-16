#!/bin/bash
#SBATCH -A MED128
#SBATCH -J test
#SBATCH -p gpu_acmhs
#SBATCH -N 1
#SBATCH -t 05:00:00
#SBATCH -o ./%j-multithread-output.txt
#SBATCH -e ./%j-multithread-error.txt




# source activate /gpfs/wolf2/olcf/stf007/8i9/jupyter_env

source ~/miniconda3/etc/profile.d/conda.sh
conda activate fl



srun bash scripts/hf/yelp/generate.sh 

# srun bash scripts/embeddings.sh --yelp 
