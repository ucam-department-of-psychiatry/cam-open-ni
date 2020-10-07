# Shared (open) imaging datasets held on HPC
This repo provides a brief overview of public datasets currently held on the HPC shared imaging drive. Derived data is made available where stated. Unless explicitly stated otherwise, freesurfer was run locally using v6.0.

 * [Individual datasets](#individual-datasets)
    * [ABIDE](#abide)
    * [ADHD200](#adhd200)
    * [Calgary](#calgary)
    * [Cam-CAN](#cam-can)
    * [HBN](#hbn)
    * [NKI](#nki)
    * [NSPN](#nspn)
 * [Human Connectome Project Datasets](#human-connectome-project-datasets)
    * [HCP](#hcp)
    * [HCPa](#hcpa)
    * [HCPd](#hcpd)
 * [OpenNeuro datasets](#openneuro-datasets)
    * [ID1000](#id1000)
    * [PIOP1](#piop1)
    * [PIOP2](#piop2)
    * [Lexicial processing](#lexicial-processing)
    * [Pixar](#pixar)
 * [NIMH Data Archive datasets](#nimh-data-archive-datasets)
    * [IBIS](#ibis)
    * [NIHPD](#nihpd)
    * [UCSD](#ucsd)

# File and folder structure
```{r, echo=TRUE}
# /rds/project/rds-vm5VDLj6Ch8//  
# .
# └── ABIDE
#     ├── BIDS
#     │   └── derivatives
#     │   │   └── freesurfer
#     │   │        └── sub<>
#     │   │            └── ses<>
#     │   │                └── sub<>
#     │   └── sub<>
#     │   │   └──ses<>
#     │   │         └── <sub>
#     │   │             └── anat
#     │   │             └── func
#     └── participants.tsv
#     └── Readme.md
# └── ADHD200
#     ├── BIDS
#     │   └── derivatives
#     │   │   └── freesurfer
#     │   │        └── sub<>
#     │   │            └── ses<>
#     │   │                └── sub<>
#     │   └── sub<>
#     │   │   └──ses<>
#     │   │         └── <sub>
#     │   │             └── anat
#     │   │             └── func
#     └── participants.tsv
#     └── Readme.md
#____________________________
```
# Code
Some generic code is included in this repository that mainly pertains to processing freesurfer on the cluster and or R functions around parsing output and reorganising data.

# Individual datasets
## ABIDE
http://fcon_1000.projects.nitrc.org/indi/abide/   
Autism Brain Imaging Database Exchange, 50/50 autism and neurotypical, mainly young adults, mainly males   
- n: 2000   
- age: 6+   
- modalities: T1, Rest   
- derived: freesurfer
> Access protocol:: Fully open raw data, fully open processed data DUA required for phenotypes (contact rb643 for info)

## ADHD200
http://fcon_1000.projects.nitrc.org/indi/adhd200/
ADHD200, 50/50 adhd and neurotypical, mainly young adults, mainly males   
- n: 800   
- age: 6+   
- modalities: T1, Rest   
- derived: freesurfer
> Access protocol:: Fully open raw data, fully open processed data DUA required for phenotypes (contact rb643 for info)

## Calgary
https://osf.io/axz5r/   
Longitudinal preschool dataset (up to 8 time-points)   
- n: 85   
- age: 2-8 years   
- modalities: T1, DTI, Rest   
- derived: freesurfer, euler   
> Access protocol:: Fully open

## Cam-CAN
- n: 700+   
- age: 18-88 (equally sized 10yr bins)   
- modalities: T1, T2, MT, Rest, Movie, Task, DTI   
- derived: freesurfer, Rest (ICA-AROMA)   
> Access protocol:: Access through Cam-CAN portal, more derived data directly available there.

## HBN
https://data.healthybrainnetwork.org/main.php   
https://github.com/rb643/HBN 
- n: 1592   
- age: 6+ years   
- modalities: T1, DTI, Rest, Movie   
- derived: freesurfer, euler, rest (speedypp), Movie1 (speedypp), Movie2 (speedypp)   
>Access protocol:: Fully open raw data, DUA required for phenotypes (contact rb643 for info)
Notes::
Data was processed by rb643 [@] medschl.cam.ac.uk and thus this folder includes a code repository and qc measures alongside raw data.
No additional freesurfer was run, instead HBN provides QC-d freesurfer data.

## NKI
http://fcon_1000.projects.nitrc.org/indi/enhanced/   
- n: 941   
- age: 18+   
- modalities: T1, DTI, Rest (2-3 acquisitions), Task, Physio   
- derived: freesurfer, euler   
> Access protocol:: Fully open raw data, DUA required for phenotypes (contact rb643 for info)

## NSPN
Longitudinal adolescent dataset (up to 3 time-points)   
- n: 316   
- age: 16-24 years   
- modalities: T1, T2, MT, DTI, Rest   
- derived: freesurfer, euler, Rest (ME-ICA), DTO (Schaeffer connectomes)   
> Access protocol:: Accessible to NSPN collaborators
Notes


# Human Connectome Project Datasets
> Access protocol:: All HCP datasets can be accessed with one DUA through NIMH Data Repository

## HCP
- n: 1113
- modalities: T1, T2, Rest, DTI, Movie    
- derived:  freesurfer, euler  

## HCPa
- n: 689   
- age: 21+   
- modalities: T1, T2, Rest, DTI, Movie   
- derived: freesurfer, euler   

## HCPd
- n: 655   
- age: 6-21   
- modalities: T1, T2, Rest, DTI, Movie   
- derived: freesurfer, euler   

# OpenNeuro datasets
> Access protocol:: All OpenNeuro datasets are openly available

## ID1000
https://openneuro.org/datasets/ds002895 & https://www.biorxiv.org/content/10.1101/2020.06.16.155317v1
- n: 928   
- age: 20-26
- modalities: T1 (3x), DWI, Rest   
- derived: freesurfer  
>Notes

## PIOP1
https://openneuro.org/datasets/ds002785 & https://www.biorxiv.org/content/10.1101/2020.06.16.155317v1
- n: 216   
- age: 20-26  
- modalities: T1, DWI, Rest (6x), Physio  
- derived: freesurfer  
> Notes

## PIOP2
https://openneuro.org/datasets/ds002790 & https://www.biorxiv.org/content/10.1101/2020.06.16.155317v1
- n: 226   
- age: 20-26  
- modalities: T1, DWI, Rest 4x), Task (WM), Physio    
- derived: freesurfer  
> Notes

## Lexicial processing
https://openneuro.org/datasets/ds001894/versions/1.3.1    
Longitudinal Brain Correlates of Multisensory Lexical Processing in Children
- n: 188   
- age: 8-14  
- modalities: T1, T2, DWI, Task   
- derived: euler, mriqc
> Notes

## Pixar
https://openneuro.org/datasets/ds000228    
MRI data of 3-12 year old children and adults during viewing of a short animated film
- n: 155    
- age: 3-12
- modalities: T1, Movie
- derived: freesurfer, euler, mriqc
> Notes


# NIMH Data Archive datasets
## IBIS
https://nda.nih.gov/edit_collection.html?id=19
Longitudinal data autism high risk, up to 3 time-points
- n: 300+
- age: 0-2   
- modalities: T1,  
- derived: freesurfer (infant fs)
> Access protocol:: Access through NIMH Data Repository - Requires MTA

## NIHPD
Longitudinal data, up to 3 time-points
- n: 514
- age: 2-8   
- modalities: T1, T2   
- derived: freesurfer, euler   
> Access protocol:: Access through NIMH Data Repository - Requires MTA

## UCSD
https://nda.nih.gov/edit_collection.html?id=9
Longitudinal data autism high risk, up to 3 time-points
- n: 200+
- age: 0-2   
- modalities: T1,  
- derived: freesurfer (infant fs)
> Access protocol:: Access through NIMH Data Repository - Requires MTA
