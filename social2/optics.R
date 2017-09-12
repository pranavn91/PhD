library(cluster)
library(factoextra)
library(dendextend)
library(foreign)
library(clustertend)
library(seriation)
library(dbscan)

setwd('G:/')

df <- read.arff('cure-t2-4k.arff')
df<- na.omit(df)
df1 <- data.frame(df$x,df$y)

res.optics <- optics(df1,10,minPts=10,search="dist")

plot(res.optics)


res.optics <- extractDBSCAN(res.optics, eps_cl= 0.06)

plot(df1, col=res.optics$cluster)

fviz_cluster(list(data=df1,cluster=res.optics$cluster))


cf <- read.arff('cluto-t8-8k.arff')
cf<- na.omit(cf)
cf1 <- data.frame(cf$x,cf$y)
cf1<-scale(cf1)

ces.optics <- optics(cf1,10,minPts=10,search="dist")

plot(ces.optics)


ces.optics <- extractDBSCAN(ces.optics, eps_cl= 0.07)

plot(cf1, col=ces.optics$cluster)

fviz_cluster(list(data=cf1,cluster=ces.optics$cluster))





