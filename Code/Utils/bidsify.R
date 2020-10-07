readAseg <- function(demofile, outdir, sourcedir,...){

## assumes that the demofile has the following columns
### participant: with unique subject ID's
### filename: a string that denotes the source filename
### session: with unique session identifiers for each file
### run: a factor/string denoting the run for that file

# load variables
library(stringr)
library(R.utils)

subs <- read.csv(demofile,header=T)

dir.create(outdir, recursive = TRUE)

for (n in 1:nrow(subs)){
  temp <- subs[n,]
  descript <- as.character(temp$filename)
  session <- as.character(temp$session)
  subname <- as.character(temp$participant)
  run <- as.character(temp$run)
  infile <- paste0(sourcedir,'/',descript)

      if(file.exists(infile)){
        print(paste0(subname, " & session: ", session," & run: ", run))
        dest <- paste(outdir,
                    subname,
                    session,
                    run,
                    "anat/",
                    sep = .Platform$file.sep)

        dir.create(dest, recursive = TRUE)

        file.copy(infile,paste0(dest,subname,"_",session,"_",run,"_T1w.nii.gz"))

      }
}
}
