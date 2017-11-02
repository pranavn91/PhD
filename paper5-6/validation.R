library(factoextra)
library(fpc)
library(NbClust)
set.seed(123)

art_ban <- read.csv('E:\\01 Evolutionary Clustering\\results\\art2-banana.csv', header=F)

art_ban_ds <- cbind(art_ban$V1,art_ban$V2)

art_ban_dist <- dist(art_ban_ds)

cluster.stats(d = art_ban_dist, art_ban$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)



art_clu <- read.csv('E:\\01 Evolutionary Clustering\\results\\art2-cluto.csv', header=F)

art_clu_ds <- cbind(art_clu$V1,art_clu$V2)

art_clu_dist <- dist(art_clu_ds)

cluster.stats(d = art_clu_dist, art_clu$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = FALSE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


art_cure <- read.csv('E:\\01 Evolutionary Clustering\\results\\art2-cure.csv', header=F)

art_cure_ds <- cbind(art_cure$V1,art_cure$V2)

art_cure_dist <- dist(art_cure_ds)

cluster.stats(d = art_cure_dist, art_cure$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)




art_dc <- read.csv('E:\\01 Evolutionary Clustering\\results\\art2-dc.csv', header=F)


art_dc_ds <- cbind(art_dc$V1,art_dc$V2)

art_dc_dist <- dist(art_dc_ds)

cluster.stats(d = art_dc_dist, art_dc$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)



art_long1 <- read.csv('E:\\01 Evolutionary Clustering\\results\\art2-long1.csv', header=F)

art_long1_ds <- cbind(art_long1$V1,art_long1$V2)

art_long1_dist <- dist(art_long1_ds)

cluster.stats(d = art_long1_dist, art_long1$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


art_mydata <- read.csv('E:\\01 Evolutionary Clustering\\results\\art2-mydata.csv', header=F)

art_mydata_ds <- cbind(art_mydata$V1,art_mydata$V2)

art_mydata_dist <- dist(art_mydata_ds)

cluster.stats(d = art_mydata_dist, art_mydata$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


de_2d <- read.csv('E:\\01 Evolutionary Clustering\\results\\de-2d-results.csv', header=F)

de_2d_ds <- cbind(de_2d$V1, de_2d$V2)

de_2d_dist <- dist(de_2d_ds)

cluster.stats(d = de_2d_dist, de_2d$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)



de_banana <- read.csv('E:\\01 Evolutionary Clustering\\results\\de-banana-results.csv', header=F)

de_banana_ds <- cbind(de_banana$V1, de_banana$V2)

de_banana_dist <- dist(de_banana_ds)

cluster.stats(d = de_banana_dist, de_banana$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)




de_cluto <- read.csv('E:\\01 Evolutionary Clustering\\results\\de-cluto-results.csv', header=F)

de_cluto_ds <- cbind(de_cluto$V1, de_cluto$V2)

de_cluto_dist <- dist(de_cluto_ds)

cluster.stats(d = de_cluto_dist, de_cluto$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)



de_cure <- read.csv('E:\\01 Evolutionary Clustering\\results\\de-cure-results.csv', header=F)

de_cure_ds <- cbind(de_cure$V1, de_cure$V2)

de_cure_dist <- dist(de_cure_ds)

cluster.stats(d = de_cure_dist, de_cure$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)

de_long1 <- read.csv('E:\\01 Evolutionary Clustering\\results\\de-long1-results.csv', header=F)

de_long1_ds <- cbind(de_long1$V1, de_long1$V2)

de_long1_dist <- dist(de_long1_ds)

cluster.stats(d = de_long1_dist, de_long1$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


de_mydata <- read.csv('E:\\01 Evolutionary Clustering\\results\\de-mydata-results.csv', header=F)

de_mydata_ds <- cbind(de_mydata$V1, de_mydata$V2)

de_mydata_dist <- dist(de_mydata_ds)

cluster.stats(d = de_mydata_dist, de_mydata$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)










ga_2d <- read.csv('E:\\01 Evolutionary Clustering\\results\\ga-2d-results.csv', header=F)

ga_2d_ds <- cbind(ga_2d$V1, ga_2d$V2)

ga_2d_dist <- dist(ga_2d_ds)

cluster.stats(d = ga_2d_dist, ga_2d$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)



ga_banana <- read.csv('E:\\01 Evolutionary Clustering\\results\\ga-banana-results.csv', header=F)

ga_banana_ds <- cbind(ga_banana$V1, ga_banana$V2)

ga_banana_dist <- dist(ga_banana_ds)

cluster.stats(d = ga_banana_dist, ga_banana$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)




ga_cluto <- read.csv('E:\\01 Evolutionary Clustering\\results\\ga-cluto-results.csv', header=F)

ga_cluto_ds <- cbind(ga_cluto$V1, ga_cluto$V2)

ga_cluto_dist <- dist(ga_cluto_ds)

cluster.stats(d = ga_cluto_dist, ga_cluto$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)



ga_cure <- read.csv('E:\\01 Evolutionary Clustering\\results\\ga-cure-results.csv', header=F)

ga_cure_ds <- cbind(ga_cure$V1, ga_cure$V2)

ga_cure_dist <- dist(ga_cure_ds)

cluster.stats(d = ga_cure_dist, ga_cure$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)

ga_long1 <- read.csv('E:\\01 Evolutionary Clustering\\results\\ga-long1-results.csv', header=F)

ga_long1_ds <- cbind(ga_long1$V1, ga_long1$V2)

ga_long1_dist <- dist(ga_long1_ds)

cluster.stats(d = ga_long1_dist, ga_long1$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


ga_mydata <- read.csv('E:\\01 Evolutionary Clustering\\results\\ga-mydata-results.csv', header=F)

ga_mydata_ds <- cbind(ga_mydata$V1, ga_mydata$V2)

ga_mydata_dist <- dist(ga_mydata_ds)

cluster.stats(d = ga_mydata_dist, ga_mydata$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)














pso_2d <- read.csv('E:\\01 Evolutionary Clustering\\results\\pso-2d-results.csv', header=F)

pso_2d_ds <- cbind(pso_2d$V1, pso_2d$V2)

pso_2d_dist <- dist(pso_2d_ds)

cluster.stats(d = pso_2d_dist, pso_2d$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)



pso_banana <- read.csv('E:\\01 Evolutionary Clustering\\results\\pso-banana-results.csv', header=F)

pso_banana_ds <- cbind(pso_banana$V1, pso_banana$V2)

pso_banana_dist <- dist(pso_banana_ds)

cluster.stats(d = pso_banana_dist, pso_banana$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)




pso_cluto <- read.csv('E:\\01 Evolutionary Clustering\\results\\pso-cluto-results.csv', header=F)

pso_cluto_ds <- cbind(pso_cluto$V1, pso_cluto$V2)

pso_cluto_dist <- dist(pso_cluto_ds)

cluster.stats(d = pso_cluto_dist, pso_cluto$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)



pso_cure <- read.csv('E:\\01 Evolutionary Clustering\\results\\pso-cure-results.csv', header=F)

pso_cure_ds <- cbind(pso_cure$V1, pso_cure$V2)

pso_cure_dist <- dist(pso_cure_ds)

cluster.stats(d = pso_cure_dist, pso_cure$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)

pso_long1 <- read.csv('E:\\01 Evolutionary Clustering\\results\\pso-long1-results.csv', header=F)

pso_long1_ds <- cbind(pso_long1$V1, pso_long1$V2)

pso_long1_dist <- dist(pso_long1_ds)

cluster.stats(d = pso_long1_dist, pso_long1$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


pso_mydata <- read.csv('E:\\01 Evolutionary Clustering\\results\\pso-mydata-results.csv', header=F)

pso_mydata_ds <- cbind(pso_mydata$V1, pso_mydata$V2)

pso_mydata_dist <- dist(pso_mydata_ds)

cluster.stats(d = pso_mydata_dist, pso_mydata$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)
















km_ban <- read.csv('E:\\01 Evolutionary Clustering\\results\\km-banana.csv', header=F)


km_ban_ds <- cbind(km_ban$V1, km_ban$V2)

km_ban_dist <- dist(km_ban_ds)

cluster.stats(d = km_ban_dist, km_ban$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)

km_clu <- read.csv('E:\\01 Evolutionary Clustering\\results\\km-cluto.csv', header=F)

km_clu_ds <- cbind(km_clu$V1, km_clu$V2)

km_clu_dist <- dist(km_clu_ds)

result <- cluster.stats(d = km_clu_dist, km_clu$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


km_cure <- read.csv('E:\\01 Evolutionary Clustering\\results\\km-cure.csv', header=F)



km_cure_ds <- cbind(km_cure$V1, km_cure$V2)

km_cure_dist <- dist(km_cure_ds)

cluster.stats(d = km_cure_dist, km_cure$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)




km_dc <- read.csv('E:\\01 Evolutionary Clustering\\results\\km-2d-4c.csv', header=F)

km_dc_ds <- cbind(km_dc$V1, km_dc$V2)

km_dc_dist <- dist(km_dc_ds)

cluster.stats(d = km_dc_dist, km_dc$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)



km_long1 <- read.csv('E:\\01 Evolutionary Clustering\\results\\km-long1.csv', header=F)

km_long1_ds <- cbind(km_long1$V1, km_long1$V2)

km_long1_dist <- dist(km_long1_ds)

cluster.stats(d = km_long1_dist, km_long1$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


km_mydata <- read.csv('E:\\01 Evolutionary Clustering\\results\\km-mydata.csv', header=F)

km_mydata_ds <- cbind(km_mydata$V1, km_mydata$V2)

km_mydata_dist <- dist(km_mydata_ds)

cluster.stats(d = km_mydata_dist, km_mydata$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)












pam_ban <- read.csv('E:\\01 Evolutionary Clustering\\results\\pam-banana.csv', header=F)

pam_ban_ds <- cbind(pam_ban$V1, pam_ban$V2)

pam_ban_dist <- dist(pam_ban_ds)

cluster.stats(d = pam_ban_dist, pam_ban$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)

pam_clu <- read.csv('E:\\01 Evolutionary Clustering\\results\\pam-cluto.csv', header=F)

pam_clu_ds <- cbind(pam_clu$V1, pam_clu$V2)

pam_clu_dist <- dist(pam_clu_ds)

cluster.stats(d = pam_clu_dist, pam_clu$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


pam_cure <- read.csv('E:\\01 Evolutionary Clustering\\results\\pam-cure.csv', header=F)


pam_cure_ds <- cbind(pam_cure$V1, pam_cure$V2)

pam_cure_dist <- dist(pam_cure_ds)

cluster.stats(d = pam_cure_dist, pam_cure$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)




pam_dc <- read.csv('E:\\01 Evolutionary Clustering\\results\\pam-2d-4c.csv', header=F)

pam_dc_ds <- cbind(pam_dc$V1, pam_dc$V2)

pam_dc_dist <- dist(pam_dc_ds)

cluster.stats(d = pam_dc_dist, pam_dc$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)



pam_long1 <- read.csv('E:\\01 Evolutionary Clustering\\results\\pam-long1.csv', header=F)
pam_long1_ds <- cbind(pam_long1$V1, pam_long1$V2)

pam_long1_dist <- dist(pam_long1_ds)

cluster.stats(d = pam_long1_dist, pam_long1$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


pam_mydata <- read.csv('E:\\01 Evolutionary Clustering\\results\\pam-mydata.csv', header=F)

pam_mydata_ds <- cbind(pam_mydata$V1, pam_mydata$V2)

pam_mydata_dist <- dist(pam_mydata_ds)

cluster.stats(d = pam_mydata_dist, pam_mydata$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)












psom_ban <- read.csv('psom-banana-results.csv', header=F)

psom_ban_ds <- cbind(psom_ban$V1, psom_ban$V2)

psom_ban_dist <- dist(psom_ban_ds)

cluster.stats(d = psom_ban_dist, psom_ban$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)

psom_clu <- read.csv('psom-cluto-results.csv', header=F)

psom_clu_ds <- cbind(psom_clu$V1, psom_clu$V2)

psom_clu_dist <- dist(psom_clu_ds)

cluster.stats(d = psom_clu_dist, psom_clu$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


psom_cure <- read.csv('psom-cure-results.csv', header=F)


psom_cure_ds <- cbind(psom_cure$V1, psom_cure$V2)

psom_cure_dist <- dist(psom_cure_ds)

cluster.stats(d = psom_cure_dist, psom_cure$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)




psom_dc <- read.csv('psom-2d-results.csv', header=F)

psom_dc_ds <- cbind(psom_dc$V1, psom_dc$V2)

psom_dc_dist <- dist(psom_dc_ds)

cluster.stats(d = psom_dc_dist, psom_dc$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)



psom_long1 <- read.csv('psom-long1-results.csv', header=F)
psom_long1_ds <- cbind(psom_long1$V1, psom_long1$V2)

psom_long1_dist <- dist(psom_long1_ds)

cluster.stats(d = psom_long1_dist, psom_long1$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)


psom_mydata <- read.csv('psom-mydata-results.csv', header=F)

psom_mydata_ds <- cbind(psom_mydata$V1, psom_mydata$V2)

psom_mydata_dist <- dist(psom_mydata_ds)

cluster.stats(d = psom_mydata_dist, psom_mydata$V3, alt.clustering = NULL,
                           noisecluster=FALSE,
                              silhouette = TRUE, G2 = FALSE, G3 = FALSE,
                              wgap=TRUE, sepindex=TRUE, sepprob=0.1,
                              sepwithnoise=FALSE,
                              compareonly = FALSE,
                              aggregateonly = FALSE)
