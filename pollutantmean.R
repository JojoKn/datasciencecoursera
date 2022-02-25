getwd()

X001<-read.csv("specdata/001.csv")
mean(X001$"nitrate", na.rm=TRUE)

pollutantmean<-function(directory, pollutant, id=1:332, na.rm=TRUE){
  library(dplyr)
  fileNames<-paste0(directory, "/", formatC(id, width=3, flag="0"), ".csv")
  lst<-lapply(fileNames, data.table::fread)
  dt<-rbindlist(lst)
  col<-select(dt, pollutant)
  colMeans(col, na.rm=TRUE)
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
