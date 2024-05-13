#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
##SBATCH --cpus-per-task=128
#SBATCH --time 2:00:00
#SBATCH --job-name d2d-539
#SBATCH --partition small
#SBATCH -o slurm-%x.out
##SBATCH --mem=200G
source ~/.bashrc
conda activate default
codedir="$HOME/AstridData/bhdetails"

for snap in 539
do
echo "processing $snap"
ifile="$HOME/scratch3/Astrid/bhdetails-chopped"
ofile="$HOME/scratch3/Astrid/bhdetails-dict"
srun python3 $codedir/detail_to_dict.py --idx $snap --srcdir $ifile --outdir $ofile 

ofile="$HOME/scratch3/Astrid/bhdetails-dict-2"
srun python3 $codedir/detail_to_dict2.py --idx $snap --srcdir $ifile --outdir $ofile

done