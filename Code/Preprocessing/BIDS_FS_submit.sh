#!/bin/bash
#
# This script submits freesurfer jobs
#
#
# Set up variables
# subject directory within BIDS structure

# change to overearching bids directory
indir=$1
codedir=$2
outdir=${indir}/derivatives/freesurfer
cd $indir
# get the subject files in the directory
filelist=$(find * -maxdepth 1 -type d -name 'sub-*')
# setup some directories while we are Here
mkdir -p ${outdir}
mkdir -p ${outdir}/logs

# loop and submit fs jobs
for sub in ${filelist} ; do
#for sub in sub-OAS31157 ; do
cd ${indir}/${sub}/
sesslist=$(find * -maxdepth 1 -type d -name 'ses-*')

for session in ${sesslist}; do
  #cd ${indir}/${sub}/${session}/anat
  run='run-1'
  infile0=${indir}/${sub}/${session}/${run}/anat/${sub}_${session}_${run}_T1w.nii.gz

  #echo ${infile}
  if [[ -e ${infile0} ]]; then

    echo 'running:' ${sub} ${session} 'without multiple runs'
    sbatch --account=BETHLEHEM-SL2-CPU --partition=skylake-himem --output=${outdir}/logs/${sub}_${session}_${run}_fslog.log --nodes=1 --ntasks=1 --cpus-per-task=1 --time=20:00:00 --mem=12000 ${codedir}/BIDS_FS_subT1.sh ${sub} ${run} ${infile0} ${outdir} ${session}
  fi

  done
done
