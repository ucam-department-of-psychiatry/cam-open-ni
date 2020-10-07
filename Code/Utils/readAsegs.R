readAseg <- function(demoin, demoout,...){
require(stringr)

    
df <- read.csv(demoin)

out <- matrix(NA,nrow = nrow(df),ncol =4)


for (i in 1:nrow(df)){
  #file <- paste0(gsub("sub-","",as.character(df$participant[i])),'/stats/aseg.stats')
  file <- as.character(df$filedir[i])
  if(file.exists(file)){
    print(as.character(df$participant[i]))
  tryCatch({
    gmv <- grep("Total cortical gray matter volume,",readLines(file),value=TRUE)
    wmv <- grep("Total cerebral white matter volume,",readLines(file),value=TRUE)
    sgmv <- grep("Subcortical gray matter volume,",readLines(file),value=TRUE)
    ventr <- grep("Volume of ventricles and choroid plexus,",readLines(file),value=TRUE) 
    
    out[i,1] <- as.numeric(as.character(str_split_fixed(gmv, ",", 5)[4]))
    out[i,2] <- as.numeric(as.character(str_split_fixed(wmv, ",", 5)[4]))
    out[i,3] <- as.numeric(as.character(str_split_fixed(sgmv, ",", 5)[4]))
    out[i,4] <- as.numeric(as.character(str_split_fixed(ventr, ",", 5)[4]))
  })
  }
}

colnames(out) <- c("GMV","WMV","sGMV","Ventricles")
df <- cbind(df,out)

write.csv(df,demoout,row.names = F)
}