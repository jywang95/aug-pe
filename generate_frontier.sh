#!/bin/bash
#SBATCH -A med117
#SBATCH -p batch
#SBATCH -N 1
#SBATCH -J synthetic-data-task
#SBATCH -t 02:00:00
#SBATCH -o ./%j-multithread-output.txt
#SBATCH -e ./%j-multithread-error.txt
#SBATCH --mail-type=FAIL,END
#SBATCH --mail-user=w7j@ornl.gov
#SBATCH -q debug






module unload darshan-runtime
module unload hsi
module unload lfs-wrapper
module unload tmux

module load cray-hdf5-parallel
module load rocm/6.0.0
module load craype-accel-amd-gfx90a

source ~/miniconda3/etc/profile.d/conda.sh

conda activate fpfllms

export MASTER_ADDR=$(hostname -i)
export MASTER_PORT=3442
export NCCL_SOCKET_IFNAME=hsn0


export HF_HOME="/lustre/orion/med117/scratch/jaywang67/huggingface_cache"
export TRANSFORMER_CACHE="/lustre/orion/med117/scratch/jaywang67/huggingface_cache"
export HF_DATASETS_CACHE="/lustre/orion/med117/scratch/jaywang67/huggingface_cache"
export TRANSFORMERS_OFFLINE=1
export HF_DATASETS_OFFLINE=1

srun bash scripts/embeddings.sh --yelp  