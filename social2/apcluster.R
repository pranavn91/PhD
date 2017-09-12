library(apcluster)

library(foreign)

df <- read.arff('cure-t2-4k.arff')
df1 <- data.frame(df$x,df$y)

apres <- apcluster(negDistMat(r=2),df1,q=0) 

apresk <- apclusterK(negDistMat(r=2),df1,K=7)

plot(apres,df1)

plot(apresk,df1)

cf <- read.arff('cluto-t8-8k.arff')
cf<- na.omit(cf)
cf1 <- data.frame(cf$x,cf$y)
cf1<-scale(cf1)

apresclu <- apcluster(negDistMat(r=2),cf1,q=0) 

apreskclu <- apclusterK(negDistMat(r=2),cf1,K=7)

plot(apresclu,df1)

plot(apreskclu,df1)

