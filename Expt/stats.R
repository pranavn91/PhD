
library(igraph)
# read graph from csv file
setwd('D:/r/social/userTemp')

files <- list.files(pattern = "*.csv")
all.files <- lapply(files, readFn)

readFn <- function(i) {


dat = read.csv(i, header=TRUE, row.names=1, check.names=FALSE)
m = as.matrix(dat)
# build graph from adjacency matrix
g = graph.adjacency(m,mode="undirected",weighted=NULL)

g_ego = g - V(g)[1]

ans = gorder(g_ego)

dt = paste(sapply(ans, function(x) {paste(x, collapse=" ")}, simplify=T), collapse=" ")

    }


degs = paste(sapply(all.files, function(x) {paste(x, collapse=" ")}, simplify=T), collapse=" ")

deg1 = as.factor(degs)
deg2 = as.numeric(levels(deg1))
deg3 = as.integer(unlist(strsplit(deg2," ")))

hist(deg3,main="histogram for degree distribution", xlab="degrees", xlim=c(0,350))

