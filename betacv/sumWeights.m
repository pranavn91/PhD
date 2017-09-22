function result = sumWeights(distMat, ind, i, j)


  [cluster_i,c] = find(ind == i);
  if i == j, 
    indices = nchoosek(cluster_i, 2);
	idx = sub2ind(size(distMat), indices(:,1), indices(:,2));  
  else 
    [cluster_j,c] = find(ind == j);
    [first,second] = meshgrid(cluster_i, cluster_j);
	idx = sub2ind(size(distMat), first(:), second(:));  
  end

    result = sum(distMat(idx));

end