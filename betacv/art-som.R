library('RSNNS')
library(R.matlab)

set.seed(123)
setwd('D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering')


curedf <- read.csv('cure.csv',header=F)
curemodel <- art2(curedf, f2Units = 6, maxit = 100,
  initFunc = "ART2_Weights", initFuncParams = c(0.9, 2),
  learnFunc = "ART2", learnFuncParams = c(0.98, 10, 10, 0.1, 0),
  updateFunc = "ART2_Stable", updateFuncParams = c(0.98, 10, 10, 0.1, 0),
  shufflePatterns = TRUE)
curepch=encodeClassLabels(curemodel$fitted.values)
fincure <- cbind(curedf,curepch)
write.table(fin,"D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\art2-cure.csv",row.names=F, sep=",", col.names=FALSE)


clutodf <- read.csv('cluto.csv',header=F)
clutomodel <- art2(clutodf, f2Units = 8, maxit = 100,
  initFunc = "ART2_Weights", initFuncParams = c(0.9, 2),
  learnFunc = "ART2", learnFuncParams = c(0.98, 10, 10, 0.1, 0),
  updateFunc = "ART2_Stable", updateFuncParams = c(0.98, 10, 10, 0.1, 0),
  shufflePatterns = TRUE)
clutopch=encodeClassLabels(clutomodel$fitted.values)
fincluto <- cbind(clutodf,clutopch)
write.table(fincluto,"D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\art2-cluto.csv",row.names=F, sep=",", col.names=FALSE)




bananadf <- read.csv('banana.csv',header=F)
bananamodel <- art2(bananadf, f2Units = 2, maxit = 100,
  initFunc = "ART2_Weights", initFuncParams = c(0.9, 2),
  learnFunc = "ART2", learnFuncParams = c(0.98, 10, 10, 0.1, 0),
  updateFunc = "ART2_Stable", updateFuncParams = c(0.98, 10, 10, 0.1, 0),
  shufflePatterns = TRUE)
bananapch=encodeClassLabels(bananamodel$fitted.values)
finbanana <- cbind(bananadf,bananapch)
write.table(finbanana,"D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\art2-banana.csv",row.names=F, sep=",", col.names=FALSE)




long1df <- read.csv('long1.csv',header=F)
long1model <- art2(long1df, f2Units = 2, maxit = 100,
  initFunc = "ART2_Weights", initFuncParams = c(0.9, 2),
  learnFunc = "ART2", learnFuncParams = c(0.98, 10, 10, 0.1, 0),
  updateFunc = "ART2_Stable", updateFuncParams = c(0.98, 10, 10, 0.1, 0),
  shufflePatterns = TRUE)
long1pch=encodeClassLabels(long1model$fitted.values)
finlong1 <- cbind(long1df,long1pch)
write.table(finlong1,"D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\art2-long1.csv",row.names=F, sep=",", col.names=FALSE)



dcdf <- read.csv('2d4c.csv',header=F)
dcmodel <- art2(dcdf, f2Units = 4, maxit = 100,
  initFunc = "ART2_Weights", initFuncParams = c(0.9, 2),
  learnFunc = "ART2", learnFuncParams = c(0.98, 10, 10, 0.1, 0),
  updateFunc = "ART2_Stable", updateFuncParams = c(0.98, 10, 10, 0.1, 0),
  shufflePatterns = TRUE)
dcpch=encodeClassLabels(dcmodel$fitted.values)
findc <- cbind(dcdf,dcpch)
write.table(findc,"D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\art2-dc.csv",row.names=F, sep=",", col.names=FALSE)


mydat <- readMat('mydata.mat',header=F)
mydata = lapply(mydat, unlist, use.names=FALSE)
mydatadf <- as.data.frame(mydata)
mydatamodel <- art2(mydatadf, f2Units = 3, maxit = 100,
  initFunc = "ART2_Weights", initFuncParams = c(0.9, 2),
  learnFunc = "ART2", learnFuncParams = c(0.98, 10, 10, 0.1, 0),
  updateFunc = "ART2_Stable", updateFuncParams = c(0.98, 10, 10, 0.1, 0),
  shufflePatterns = TRUE)
mydatapch=encodeClassLabels(mydatamodel$fitted.values)
finmydata <- cbind(mydatadf,mydatapch)
write.table(finmydata,"D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\art2-mydata.csv",row.names=F, sep=",", col.names=FALSE)


