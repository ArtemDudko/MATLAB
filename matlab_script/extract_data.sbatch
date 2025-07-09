#!/bin/bash

#SBATCH -J matlab
#SBATCH --account=hindcastra
#SBATCH --time=4:00:00
#SBATCH --ntasks=12
#SBATCH --mem=200gb
#SBATCH --output=output.%j
#SBATCH -e error.%j
#SBATCH --mail-type=END,FAIL
#SBATCH --mail-user=preston.spicer@pnnl.gov


# Clean up then load the necessary modules
module purge
module load matlab/R2020b

# Unlimit system resources (recommended by Matlab)
ulimit -u 63536

# Execute the code
matlab -nodisplay -nosplash -softwareopengl < /lustre/eaglefs/scratch/spicerps/PIR/matlab/pull_tide.m > /lustre/eaglefs/scratch/spicerps/PIR/matlab/pull_tide_out.txt
date