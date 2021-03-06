#!/bin/bash
bids_root_dir=$1
session=$2

module load singularity/current
module load fsl/6.0.1
module load matlab/r2019b
module load afni/17.0.00
module load freesurfer/6.0.0
module load ants/2.1.0

nthreads=1
mem=12 #gb#docker or singularity

#Run MRIQC
echo ""
echo "Running MRIQC on whole group for session $session"
echo ""

singularity run /rds/user/rb643/hpc-work/Tools/mriQC/mriqc15.simg \
  $bids_root_dir $bids_root_dir/derivatives/mriqc/${subj} \
  group \
  --session-id $session \
  --n_proc $nthreads \
  --mem_gb $mem \
  --float32 \
  --no-sub \
  --ants-nthreads $nthreads \
