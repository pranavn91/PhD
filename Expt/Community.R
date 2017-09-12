
library(igraph)
# read graph from csv file
setwd('D:/r/social/userTemp')

files <- list.files(pattern = "*.csv")
#files <- c("239.csv")
all.files <- lapply(files, readFn)

readFn <- function(i) {


dat = read.csv(i, header=TRUE, row.names=1, check.names=FALSE)
m = as.matrix(dat)
# build graph from adjacency matrix
g = graph.adjacency(m,mode="undirected",weighted=NULL)

g_ego = g - V(g)[1]
#g_nn = delete_vertices(g, V(g)[degree(g)==0])

ptm <- proc.time()
wc <- infomap.community(g_ego)
proc.time() - ptm

#deg = degree(g_ego, mode="all")

#k = modularity(wc)
#temp = wc[1:length(wc)]

#t = paste(sapply(temp, function(x) {paste(x, collapse=" ")}, simplify=T), collapse=";")

#dt = paste(sapply(deg, function(x) {paste(x, collapse=" ")}, simplify=T), collapse=" ")

    }

output <- do.call(rbind, all.files)

degs = paste(sapply(all.files, function(x) {paste(x, collapse=" ")}, simplify=T), collapse=" ")

deg1 = as.factor(degs)
deg2 = as.numeric(levels(deg1))
deg3 = as.integer(unlist(strsplit(deg2," ")))

hist(deg3,main="histogram for degree distribution", xlab="degrees", xlim=c(0,350))


files <- sub(".csv","",files)

train <- cbind(files,output)
colnames(train) <- c('UserId','Predicted')

colnames(train) <- c('UserId','Modularity')
write.csv(train,"D:/r/social/userTemp/subs/multilev.csv",row.names=F)


write.csv(train,"D:/r/social/userTemp/subs/fastgreedy.csv",row.names=F)
 
write.csv(train,"D:/r/social/userTemp/subs/deg1.csv",row.names=F)

dendPlot(wc,mode="hclust", rect=5)

plot(wc,g) 

plot(rev(wc$modularity), xlab='Number of clusters', ylab='Modularity value')

which.max(rev(wc$modularity))



















dat = read.csv('239.csv', header=TRUE, row.names=1, check.names=FALSE)
m = as.matrix(dat)
# build graph from adjacency matrix
g = graph.adjacency(m,mode="undirected",weighted=NULL)


 
# plots the graph
E(g)$color <- rgb(0,0,0,alpha=.2)
ego <- names(which.max(degree(g)))
V(g)[V(g) != ego]$color = 'blue'
V(g)[ego]$color = 'red'
 
windows()
plot(g, vertex.label=NA, vertex.size=5, layout=layout.fruchterman.reingold)



 wc <- walktrap.community(g)

write.csv(wc,"train.csv")

 modularity(wc)
wc



 


 wc <- fastgreedy.community(g)
 modularity(wc)


 wc <- edge.betweenness.community(g)
 modularity(wc)


 wc <- spinglass.community(g)
 modularity(wc)


 wc <- leading.eigenvector.community(g)
 modularity(wc)


 wc <- label.propagation.community(g)
 modularity(wc)

plot(g, vertex.label=NA, vertex.size=5, vertex.color=membership(wc),
     layout=layout.fruchterman.reingold)
