#!/bin/bash
#SBATCH -A MED128
#SBATCH -J test
#SBATCH -p gpu_acmhs
#SBATCH -N 1
#SBATCH -t 00:20:00
#SBATCH -o ./%j-multithread-output.txt
#SBATCH -e ./%j-multithread-error.txt



# source activate /gpfs/wolf2/olcf/stf007/8i9/jupyter_env

source ~/miniconda3/etc/profile.d/conda.sh
conda activate fl
export CUDA_VISIBLE_DEVICES=0 

srun bash ./scripts/embeddings.sh --yelp  