function [si] = calcSilhouette(X, clust, metric)




  if (size(X, 1) != size(clust, 1))
    error("First dimension of X <%d> doesn't match that of clust <%d>",...
      size(X, 1), size(clust, 1));
  endif
  

  if (! exist('metric', 'var'))
    metric = 'sqEuclidean';
  endif
  

  function [dist] = EuclideanDist(x, y)
    dist = sqrt((x - y) * (x - y)');
  endfunction
  
  function [dist] = sqEuclideanDist(x, y)
    dist = (x - y) * (x - y)';
  endfunction
  
  function [dist] = cosineDist(x, y)
    cosineValue = dot(x,y)/(norm(x,2)*norm(y,2));
    dist = 1 - cosineValue;
  endfunction

  si = zeros(size(X, 1), 1);
 
  for iii = 1:length(si)
    
    %%% distance of iii to all others
    iii2all = zeros(size(X, 1), 1);
    for jjj = 1:size(X, 1)
        switch (metric)
          case 'Euclidean'
            iii2all(jjj) = EuclideanDist(X(iii, :), X(jjj, :));
          case 'sqEuclidean'
            iii2all(jjj) = sqEuclideanDist(X(iii, :), X(jjj, :));
          case 'cosine'
            iii2all(jjj) = cosineDist(X(iii, :), X(jjj, :));
          otherwise
            error('Invalid metric.');
        endswitch
    end

    clusterIDs = unique(clust); % eg [1; 2; 3; 4]
    groupedValues = {};
    for jjj = 1:length(clusterIDs)
      groupedValues{clusterIDs(jjj)} = [iii2all(clust == clusterIDs(jjj))];
    end
    %%% end allocation
    
    
	if size(groupedValues{clust(iii)}) == 1,
			
			% dist of object iii to all other objects in the same cluster
			a_iii = groupedValues{clust(iii)};
			% average distance of iii to all other objects in the same cluster
			a_i = a_iii ;
	 
	
	else
			% dist of object iii to all other objects in the same cluster
			a_iii = groupedValues{clust(iii)};
			% average distance of iii to all other objects in the same cluster
			a_i = sum(a_iii) / (size(a_iii, 1) - 1);
    end
    
    
  
    clusterIDs_new = clusterIDs;
    % remove the cluster iii in
    clusterIDs_new(find(clusterIDs_new == clust(iii))) = [];
    % average distance of iii to all objects of another cluster
    a_iii_2others = zeros(length(clusterIDs_new), 1);
    for jjj = 1:length(clusterIDs_new)
      values_another = groupedValues{clusterIDs_new(jjj)};
      a_iii_2others(jjj) = mean(values_another);
    end
	
    b_i = min(a_iii_2others);

    si(iii) = (b_i - a_i) / max([a_i; b_i]);

    
  end
  
end