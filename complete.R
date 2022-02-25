getwd()

complete<-function(directory, id=1:332){
  lst<-list.files(directory)
  dat<-data.frame()
  for (i in c(id)){
    fileName<-lst[[i]]
    select<-read.csv(paste0("specdata", "/", fileName))
    complete<-complete.cases(select)
    ncomplete<-sum(complete)
    tmp<-data.frame(i, ncomplete)
    dat<-rbind(dat, tmp)
  }
  colnames(dat)<-c("id", "nobs")
  print(dat)
}

id<-10:1
c(id)

complete("specdata", 1)
complete("specdata", c(2,4,8,10,12))
complete("specdata", 30:25)
complete("specdata", 3)

