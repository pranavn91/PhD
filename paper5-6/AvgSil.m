function [result, out] = AvgSil(m, X, k)


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
	
	s = calcSilhouette(X,ind);
	
	
	
    result = mean(s);
    out.d=d;
    out.dmin=dmin;
    out.ind=ind;
    out.result=result;	
	

end