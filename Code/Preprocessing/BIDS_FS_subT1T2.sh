#!/bin/bash
#
# This script runs freesurfer on the High Performance Cluster
# this is the subject specific script that can be called by SBATCH and only requires the subject ID as input
# assumes you have freesurfer set up (but otherwise you can add `module load freesurfer` to the top of this script
#
# By:
# Richard A.I. Bethlehem
# University of Cambridge
# ©rb643 2020
#
module load freesurfer/6.0.0
# subject directory within BIDS structure
subject=$1
run=$2
infile=$3
infile2=$4
outdir=$5
session=$6

echo $subject
# change to overearching bids directory
# change to your subject list
surfdir=${outdir}/${subject}/${session}/${run}/surfaces/
# also fix a tmpDIR to avoid using the system default tmpDIR that other users might access at the same time
tmpDIR=/home/rb643/TempDir/${subject}_${session}_${run}

# set up and make necessary subfolders
mkdir -p ${surfdir}
mkdir -p ${tmpDIR}

echo "exporting directories"
export SUBJECTS_DIR=${surfdir}
export TMPDIR=${tmpDIR}

# Run freesurufer
echo "running freesurfer"
recon-all -subject ${subject} -i ${infile} -T2 ${infile2} -T2pial -all -no-isrunning

rm -R ${tmpDIR}
