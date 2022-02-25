getwd()

corr<-function(directory, threshold=0){
  lst<-list.files(directory)
  lengthlst<-length(lst)
  vcorr<-c()
  for(i in 1:lengthlst){
    fileName<-lst[[i]]
    select<-read.csv(paste0("specdata", "/", fileName))
    complete<-complete.cases(select)
    ncomplete<-sum(complete)
    
    if (ncomplete>threshold) {
      tmp<-cor(select$sulfate, select$nitrate, use="pairwise.complete.obs")
      vcorr<-rbind(vcorr, tmp)
    }
  }
  rownames(vcorr)<-c()
  print(vcorr)
}

cori<-corr("specdata")
head(cori)
summary(cori)
length(cori)