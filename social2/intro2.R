library(cluster)
library(factoextra)
library(dendextend)
library(foreign)
library(clustertend)
library(seriation)

setwd('G:/')

df <- read.arff('cure-t2-4k.arff')
df<- na.omit(df)
df1 <- data.frame(df$x,df$y)

desc_stats <- data.frame(
  Min = apply(df1, 2, min), # minimum
  Med = apply(df1, 2, median), # median
  Mean = apply(df1, 2, mean), # mean
  SD = apply(df1, 2, sd), # Standard deviation
  Max = apply(df1, 2, max) # Maximum
  )
desc_stats <- round(desc_stats, 1)
head(desc_stats) 

res.fanny <- cmeans(df1,7, m=2,dist="euclidean")

fviz_cluster(list(data=df1,cluster=res.fanny$cluster))




cf <- read.arff('cluto-t8-8k.arff')
cf<- na.omit(cf)
cf1 <- data.frame(cf$x,cf$y)

c_stats <- data.frame(
  Min = apply(cf1, 2, min), # minimum
  Med = apply(cf1, 2, median), # median
  Mean = apply(cf1, 2, mean), # mean
  SD = apply(cf1, 2, sd), # Standard deviation
  Max = apply(df1, 2, max) # Maximum
  )
desc_stats <- round(desc_stats, 1)
head(desc_stats)

rescluto.fanny <- cmeans(cf1,9, m=2,dist="euclidean")

fviz_cluster(list(data=cf1,cluster=rescluto.fanny$cluster))

