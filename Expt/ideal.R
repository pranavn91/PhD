library(sna)



dat = read.csv('239.csv', header=TRUE, row.names=1, check.names=FALSE)
m = as.matrix(dat)
# build graph from adjacency matrix
g = graph.adjacency(m,mode="undirected",weighted=NULL)

gadj = as_adjacency_matrix(g)

#gego = delete.vertices(g, V(g)[1])

g_ego <- g - V(g)[1]

wc <- walktrap.community(g_ego, steps=100, modularity=TRUE)





ideal_observed_cors = vector()

num_vertices = nrow(gadj)-1


for (i in 0:(num_vertices-1)) {
    num_comms = (num_vertices - i)
    cat('number of communities: ', num_comms, '\n')
    #community <- community.to.membership(g_ego, wc$merges, i)

    community <- list(cutat(wc, steps=i))
    names(community)=c("membership")
    #print(community)
    idealized_comm_mat <- matrix(nrow=num_vertices, ncol=num_vertices)
 
    for (m in 1:num_vertices) {
        for (n in 1:num_vertices) {
            if (m==n) {
                idealized_comm_mat[m,n] = 0
            } else if (community$membership[m] == community$membership[n]) {
                idealized_comm_mat[m,n] = 1
            } else {
                idealized_comm_mat[m,n] = 0
            }
        }
    }
    #print(idealized_comm_mat) 
 
    if (num_comms > 1 & num_comms < num_vertices) {
        ideal_observed_cors <- append(ideal_observed_cors, (gcor(idealized_comm_mat, gadj)))
        print(ideal_observed_cors[length(ideal_observed_cors)])
    } else {
        ideal_observed_cors <- append(ideal_observed_cors, 0)
        print('unable to calcuate correlation; setting value to 0')
    }
    cat('\n')
}
ideal_observed_cors <- rev(ideal_observed_cors)
#ideal_observed_cors 
 

plot(ideal_observed_cors)
 