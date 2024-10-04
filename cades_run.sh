#!/bin/bash

#SBATCH -A birthright
#SBATCH -p burst
#SBATCH -N 1
#SBATCH -n 1
#SBATCH -c 1
#SBATCH --ntasks-per-node=1
#SBATCH -J multithread-test-job
#SBATCH --mem=32g
#SBATCH -t 00:60:00
#SBATCH -o ./%j-multithread-output.txt
#SBATCH -e ./%j-multithread-error.txt
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=w7j@ornl.gov
##SBATCH -q debug

source ~/miniconda3/etc/profile.d/conda.sh
conda activate FedLLM

srun bash scripts/hf/yelp/generate.sh