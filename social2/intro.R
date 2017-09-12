library(cluster)
library(factoextra)
library(dendextend)
library(foreign)
library(clustertend)
libraray(seriation)

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


hopkins(df1, n = nrow(df1)-1, header=T)
df1_dist <- dist(df1) 
dissplot(df1_dist)


d <- dist(df1, method = "euclidean")

# Hierarchical clustering using Ward's method
res.hc <- hclust(d, method = "ward.D2" )
grp <- cutree(res.hc, k = 7)
fviz_cluster(list(data = df1, cluster = grp))

res.hc <- hclust(d, method = "ward.D" )
grp <- cutree(res.hc, k = 7)
fviz_cluster(list(data = df1, cluster = grp))

res.sin <- hclust(d, method = "single" )
grpsin <- cutree(res.sin, k = 7)
fviz_cluster(list(data = df1, cluster = grpsin))

res.com <- hclust(d, method = "complete" )
grpcom <- cutree(res.com, k = 7)
fviz_cluster(list(data = df1, cluster = grpcom))

res.avg <- hclust(d, method = "average" )
grpavg <- cutree(res.avg, k = 7)
fviz_cluster(list(data = df1, cluster = grpavg))

res.cen <- hclust(d, method = "centroid" )
grpcen <- cutree(res.cen, k = 7)
fviz_cluster(list(data = df1, cluster = grpcen))










cf <- read.arff('cluto-t8-8k.arff')
cf<- na.omit(cf)
cf1 <- data.frame(cf$x,cf$y)

cf1_stats <- data.frame(
  Min = apply(cf1, 2, min), # minimum
  Med = apply(cf1, 2, median), # median
  Mean = apply(cf1, 2, mean), # mean
  SD = apply(cf1, 2, sd), # Standard deviation
  Max = apply(cf1, 2, max) # Maximum
  )
cf1_stats <- round(cf1_stats, 1)
head(cf1_stats)

cf1<-scale(cf1)


hopkins(cf1, n = nrow(cf1)-1, header=T)
cf1_dist <- dist(cf1) 
dissplot(cf1_dist)

c <- dist(cf1, method = "euclidean")

# Hierarchical clustering using Ward's method
res.hcluto <- hclust(c, method = "ward.D2" )
clutogrp <- cutree(res.hcluto, k = 9)
fviz_cluster(list(data = cf1, cluster = clutogrp))

res.hcclutowd <- hclust(c, method = "ward.D" )
grpcluwd <- cutree(res.hcclutowd, k = 9)
fviz_cluster(list(data = cf1, cluster = grpcluwd))

res.clutosin <- hclust(c, method = "single" )
grpclutosin <- cutree(res.clutosin, k = 9)
fviz_cluster(list(data = cf1, cluster = grpclutosin))

res.clutocom <- hclust(c, method = "complete" )
grpclutocom <- cutree(res.clutocom, k = 9)
fviz_cluster(list(data = cf1, cluster = grpclutocom))

res.clutoavg <- hclust(c, method = "average" )
grpclutoavg <- cutree(res.clutoavg, k = 9)
fviz_cluster(list(data = cf1, cluster = grpclutoavg))

res.clutocen <- hclust(c, method = "centroid" )
grpclutocen <- cutree(res.clutocen, k = 9)
fviz_cluster(list(data = cf1, cluster = grpclutocen))