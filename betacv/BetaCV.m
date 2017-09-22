

function [result, out] = BetaCV(m, X)
   
    distMat = pdist2(X, X);
    d = pdist2(X, m);
    [dmin, ind] = min(d, [], 2);
	
	max_clust = max(ind);
	Win = 0;
	for i = 1:max_clust
		   Win = Win + sumWeights(distMat, ind, i, i);
	end
	
	Wout = 0;
   for i = 1:(max_clust-1)    
    for j = (i+1):max_clust		
      Wout = Wout + sumWeights(distMat, ind, i, j);
	end	
  end
	
	Nin = 0;
  for i = 1:max_clust
    n = sum(ind == i);
    Nin = Nin + (n * (n-1) / 2);
  end
  # number of intercluster edges
  Nout = 0;
  for i = 1:(max_clust - 1) 
    for j = (i+1):max_clust 
      Nout = Nout + sum(ind == i) * sum(ind == j);
    end
  end
    result = (Win / Nin) / (Wout / Nout);
    out.d=d;
    out.dmin=dmin;
    out.ind=ind;
    out.result=result;
    
end


