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
#d=gorder(g_ego)


wc <- multilevel.community(g_ego)

df <- data.frame(node=wc$names, group=wc$membership, stringsAsFactors=FALSE)
    }


output <- do.call(rbind, all.files)

files <- sub(".csv","",files)

train <- cbind(files,output)

write.csv(train,"D:/r/social/userTemp/subs/spin.csv",row.names=F)


