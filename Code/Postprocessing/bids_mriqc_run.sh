#!/bin/bash
#
# This script submits freesurfer jobs
#
#
# Set up variables
# subject directory within BIDS structure

# change to overearching bids directory
indir=$1
logdir=$2
cd $indir
# get the subject files in the directory
filelist=$(find * -maxdepth 1 -type d -name 'UKB*')

# loop and submit fs jobs
for sub in ${filelist} ; do
#for sub in sub-10001 ; do

      if [ -d ${indir}/${sub}/surfaces/${sub} ] #for dataset with single sessions
      then
        echo 'running:' ${sub} 'session:' ${session} 'run: ' ${run}
        sbatch --account=BETHLEHEM-SL2-CPU --partition=skylake-himem \
        --output=${logdir}/${sub}_ENGIMA_SHAPE.log --nodes=1 --ntasks=1 \
        --cpus-per-task=1 --time=02:00:00 --mem=12000 \
        /rds/user/rb643/hpc-work/Code/bids_mriqc_sub.sh ${indir} ${sub} ${sess}
      fi

done
