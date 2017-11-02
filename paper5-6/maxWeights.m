function result = maxWeights(distMat, ind, i, j)


  [cluster_i,c] = find(ind == i);
  if i == j, 
    
		if size(cluster_i,1) == 1 && size(cluster_i,2) == 1
		   idx = sub2ind(size(distMat), cluster_i(:,1), cluster_i(:,1));		   
		else   
		   indices = nchoosek(cluster_i, 2);
		   idx = sub2ind(size(distMat), indices(:,1), indices(:,2));  
		end    

  else 
    [cluster_j,c] = find(ind == j);
    [first,second] = meshgrid(cluster_i, cluster_j);
	idx = sub2ind(size(distMat), first(:), second(:));  
  end

    result = max(distMat(idx));

end