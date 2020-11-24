#!/bin/bash

module load singularity/current
module load fsl/6.0.1
module load matlab/r2019b
module load afni/17.0.00
module load freesurfer/6.0.0
module load ants/2.1.0

#User inputs:
subj=$1
bids_root_dir=$2
session=$3
nthreads=1
mem=12 #gb#docker or singularity

#Make mriqc directory and participant directory in derivatives folder
if [ ! -d $bids_root_dir/derivatives/mriqc ]; then
mkdir $bids_root_dir/derivatives/mriqc
fi

if [ ! -d $bids_root_dir/derivatives/mriqc/${subj} ]; then
mkdir $bids_root_dir/derivatives/mriqc/${subj}
fi

#Run MRIQC
echo ""
echo "Running MRIQC on participant $subj"
echo ""

singularity run /rds/user/rb643/hpc-work/Tools/mriQC/mriqc15.simg \
  $bids_root_dir $bids_root_dir/derivatives/mriqc/${subj} \
  participant \
  --session-id $session \
  --participant_label ${subj} \
  --n_proc $nthreads \
  --hmc-fsl \
  --correct-slice-timing \
  --mem_gb $mem \
  --float32 \
  --no-sub \
  --ants-nthreads $nthreads \
