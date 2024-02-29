#!/bin/bash
#SBATCH --nodes 1
#SBATCH -n 1
#SBATCH --time 4:00:00
#SBATCH --job-name mraw-052
#SBATCH --partition RM
#SBATCH -o slurm-%x.out
#SBATCH --mem=200G
 
source activate default
codedir="/hildafs/home/nianyic/AstridData/merger_catalog/codes/raw_merger"
snap="052"

srun python3 $codedir/extract-merger-v2.py "vera" $snap 

