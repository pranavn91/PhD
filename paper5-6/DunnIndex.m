

function [result, out] = DunnIndex(m, X, k)


	distMat = pdist2(X, X);
    d = pdist2(X, m);
    [dmin, ind] = min(d, [], 2);
	
	max_clust = max(ind);
	[row, col] = size(unique(ind));
	
	if row != k
	    result = -inf;
		out.d=d;
		out.dmin=dmin;
		out.ind=ind;
		out.result=result;    
	    return 
	end 
	
	minInter = 10000;
	
	for i = 1:(max_clust - 1)
			
			for j = (i+1):max_clust 
				
				temp = minWeights(distMat, ind, i, j);
				
				if temp < minInter
				
					minInter = temp;
					
				end
			end
	end
	
	maxIntra = -1;
    for i = 1:max_clust
      temp = maxWeights(distMat, ind, i, i);
      if temp > maxIntra
          maxIntra = temp;
	  end
	end
  
  result = minInter / maxIntra;
  out.d=d;
  out.dmin=dmin;
  out.ind=ind;
  out.result=result;
	
	



end