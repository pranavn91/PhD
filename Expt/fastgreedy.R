library(igraph)
# read graph from csv file
setwd('D:/r/social/userTemp')

files <- list.files(pattern = "*.csv")
files <- c("239.csv")
all.files <- lapply(files, readFn1)

readFn1 <- function(i) {


dat = read.csv(i, header=TRUE, row.names=1, check.names=FALSE)
m = as.matrix(dat)
# build graph from adjacency matrix
g = graph.adjacency(m,mode="undirected",weighted=NULL)

g_ego = delete.vertices(g, V(g)[1])

wc <- fastgreedy.community(g_ego,modularity=TRUE)
temp = wc[1:length(wc)]

t = paste(sapply(temp, function(x) {paste(x, collapse=" ")}, simplify=T), collapse=";")


    }

output <- do.call(rbind, all.files)
files <- sub(".csv","",files)

train <- cbind(files,output)
colnames(train) <- c('UserId','Predicted')
write.csv(train,"D:/r/social/userTemp/subs/fastgreedy.csv",row.names=F)
 


dendPlot(wc,mode="hclust", rect=5)

plot(wc,g) 

plot(rev(wc$modularity), xlab='Number of clusters', ylab='Modularity value')

which.max(rev(wc$modularity))