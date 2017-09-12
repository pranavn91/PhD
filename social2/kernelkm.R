library(cluster)
library(factoextra)
library(dendextend)
library(foreign)
library(clustertend)
library(seriation)
library(dbscan)
library(kernlab)

setwd('G:/')

df <- read.arff('cure-t2-4k.arff')
df<- na.omit(df)
df1 <- data.frame(df$x,df$y)

res.kernkm <- kkmeans(as.matrix(df1),centers=7,kernel="rbfdot")

plot(df1, col=res.kernkm)



cf <- read.arff('cluto-t8-8k.arff')
cf<- na.omit(cf)
cf1 <- data.frame(cf$x,cf$y)
cf1<-scale(cf1)

res.kernkmcluto <- kkmeans(as.matrix(cf1),centers=9,kernel="rbfdot",na.action=na.omit)

plot(cf1, col=res.kernkmcluto)

