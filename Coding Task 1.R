getwd()
pollutantmean<-function(directory, pollutant, id=1:332, na.rm=TRUE){
  
  data<-read.csv(directory/id.csv)
  mean(data$"pollutant", na.rm=TRUE)
}

pollutantmean("specdata", "sulfate", 332)

X001<-read.csv("specdata/001.csv")
mean(X001$"nitrate", na.rm=TRUE)