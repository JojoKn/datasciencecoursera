outcome<-read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv")
head(outcome)
str(outcome)

outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[, 11])
best<-function(state, outcome) {
  library(dplyr)
  library(gtools)
  data<-read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv")
  states<-unique(data$State)
  if(!state%in%states){
    stop('invalid state')
  }
  if(!outcome %in% c("heart attack", "heart failure", "pneumonia")){
    stop('invalid outcome')
  }
  data<-filter(data, data$State==state)
  if (outcome%in%c("heart attack")){
    data<-data[mixedorder(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),]
    return(data[,"Hospital.Name"][1])
  }
  if (outcome%in%c("heart failure")){
    data<-data[mixedorder(data$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),]
    return(data[,"Hospital.Name"][1])
  }
  if (outcome%in%c("pneumonia")){
    data<-data[mixedorder(data$Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),]
    return(data[,"Hospital.Name"][1])
  }
}
  
best("TX", "heart attack")
best("TX", "heart failure")
best("MD", "heart attack")
best("MD", "pneumonia")
best("BB", "heart attack")
best("NY", "hert attack")