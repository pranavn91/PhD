library(cluster)
library(factoextra)
library(R.matlab)

set.seed(123)

setwd('D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering')

curedf <- read.csv('cure.csv',header=F)
km.res <- kmeans(curedf, 6, nstart = 25)
# Cluster number for each of the observations
fin <- cbind(curedf,km.res$cluster)
write.csv(fin,"km-cure.csv",row.names=F)

clutodf <- read.csv('cluto.csv',header=F)
kmcluto.res <- kmeans(clutodf, 8, nstart = 25)
# Cluster number for each of the observations
fincluto <- cbind(clutodf,kmcluto.res$cluster)
write.csv(fincluto,"km-cluto.csv",row.names=F)

bananadf <- read.csv('banana.csv',header=F)
kmbanana.res <- kmeans(bananadf, 2, nstart = 25)
# Cluster number for each of the observations
finbanana <- cbind(bananadf,kmbanana.res$cluster)
write.csv(finbanana,"km-banana.csv",row.names=F)

long1df <- read.csv('long1.csv',header=F)
kmlong1.res <- kmeans(long1df, 2, nstart = 25)
# Cluster number for each of the observations
finlong1 <- cbind(long1df,kmlong1.res$cluster)
write.csv(finlong1,"km-long1.csv",row.names=F)

dcdf <- read.csv('2d4c.csv',header=F)
kmdc.res <- kmeans(dcdf, 4, nstart = 25)
# Cluster number for each of the observations
findc <- cbind(dcdf,kmdc.res$cluster)
write.csv(findc,"km-2d-4c.csv",row.names=F)

mydat <- readMat('mydata.mat',header=F)
mydata = lapply(mydat, unlist, use.names=FALSE)
mydatadf <- as.data.frame(mydata)


kmmydatadf.res <- kmeans(mydatadf, 3, nstart = 25)
# Cluster number for each of the observations
finmydatadf <- cbind(mydatadf,kmmydatadf.res$cluster)
#write.csv(finmydatadf,"km-mydata.csv",row.names=F)
write.table(finmydatadf, file="mydata.csv", sep=",", col.names=FALSE, row.names=F)





########### PAM ###########



set.seed(123)

setwd('D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering')

curedf <- read.csv('cure.csv',header=F)
pam.res <- pam(curedf, 6, metric = "euclidean", stand = FALSE)
# Cluster number for each of the observations
fin <- cbind(curedf,pam.res$cluster)
write.table(fin,"D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\pam-cure.csv",row.names=F, sep=",", col.names=FALSE)

clutodf <- read.csv('cluto.csv',header=F)
pamcluto.res <- pam(clutodf, 8, metric = "euclidean", stand = FALSE)
# Cluster number for each of the observations
fincluto <- cbind(clutodf,pamcluto.res$cluster)
write.table(fincluto,"D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\pam-cluto.csv",row.names=F, sep=",", col.names=FALSE)

bananadf <- read.csv('banana.csv',header=F)
pambanana.res <- pam(bananadf, 2, metric = "euclidean", stand = FALSE)
# Cluster number for each of the observations
finbanana <- cbind(bananadf,pambanana.res$cluster)
write.table(finbanana,"D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\pam-banana.csv",row.names=F, sep=",", col.names=FALSE)

long1df <- read.csv('long1.csv',header=F)
pamlong1.res <- pam(long1df, 2, metric = "euclidean", stand = FALSE)
# Cluster number for each of the observations
finlong1 <- cbind(long1df,pamlong1.res$cluster)
write.table(finlong1,"D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\pam-long1.csv",row.names=F, sep=",", col.names=FALSE)

dcdf <- read.csv('2d4c.csv',header=F)
pamdc.res <- pam(dcdf, 4, metric = "euclidean", stand = FALSE)
# Cluster number for each of the observations
findc <- cbind(dcdf,pamdc.res$cluster)
write.table(findc,"D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\pam-2d-4c.csv",row.names=F, sep=",", col.names=FALSE)

mydat <- readMat('mydata.mat',header=F)
mydata = lapply(mydat, unlist, use.names=FALSE)
mydatadf <- as.data.frame(mydata)
pammydatadf.res <- pam(mydatadf, 3, metric = "euclidean", stand = FALSE)
finmydatadf <- cbind(mydatadf,pammydatadf.res$cluster)
write.table(finmydatadf, file="D:\\python-deep learning\\EVOL-CLUST\\YPML101 Evolutionary Clustering\\01 Evolutionary Clustering\\results\\pam-mydata.csv", sep=",", col.names=FALSE, row.names=F)





