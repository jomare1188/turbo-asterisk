library(igraph, lib.loc="/Storage/data1/jorge.munoz/NRGSC.new/libraries")


# parser the file from conekt

network_file="../data/Hoang2017_mcl_out.txt"

adjacency_list <- read.table(network_file, header = F)
colnames(adjacency_list) <- c("V1", "V2", "weight")

G <- simplify(graph_from_data_frame(adjacency_list, directed = F), remove.multiple = T)


#names <- V(G)[order(degree(G), decreasing = TRUE)]
#hub <- degree(G)[names]
#names(hub) <- names(degree(G)[names])
#hub <- as.data.frame(hub)
#write.table(rownames(hub), "../results/degree.tsv", col.names = F, quote = F, row.names = F)

names_b <- V(G)[order(estimate_betweenness(G, cutoff = 2), decreasing = TRUE)]
hub_b <- estimate_betweenness(G, cutoff = 2)[names]
names_b(hub_b) <- names(estimate_betweenness(G, cutoff = 2)[names_b])
hub_b <- as.data.frame(hub_b)
write.table(rownames(hub_b), "../results/estimate_betweenness.tsv", col.names = F, quote = F, row.names = F)


