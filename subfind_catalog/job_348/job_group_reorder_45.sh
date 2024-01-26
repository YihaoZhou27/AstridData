#!/bin/bash 
#SBATCH -p RM
#SBATCH --time=40:00:00
#SBATCH --nodes 8
#SBATCH --mem=200GB
#SBATCH --job-name=wseed2
#SBATCH --output=slurm-group-reorder-4-5.out

snap=348
dataroot="/hildafs/datasets/Asterix"
tabfile="fof_subhalo_tab_$snap.hdf5"
grpfile="snap-groupordered_$snap.hdf5"
subroot="$dataroot/subfind/subfind_$snap"
pigfile="$dataroot/PIG2/PIG_$snap"
dest="$dataroot/PIG2/PIG_348_subfind"

mpirun -n 224 python3 ../group_reorder.py --pigfile $pigfile --dest $dest --gstart 0 --gend 3000000 --blocknames "4/Mass" "4/Metallicity" "4/Position" "4/StarFormationTime" "4/Velocity" "5/BlackholeAccretionRate" "5/BlackholeMass" "5/BlackholeMseed" "5/ID" "5/Position" "5/Velocity" "5/StarFormationTime"

mpirun -n 224 python3 ../group_reorder.py --pigfile $pigfile --dest $dest --gstart 3000000 --gend 30000000 --blocknames "4/Mass" "4/Metallicity" "4/Position" "4/StarFormationTime" "4/Velocity" "5/BlackholeAccretionRate" "5/BlackholeMass" "5/BlackholeMseed" "5/ID" "5/Position" "5/Velocity" "5/StarFormationTime"
