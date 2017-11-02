%
% Copyright (c) 2015, Yarpiz (www.yarpiz.com)
% All rights reserved. Please read the "license.txt" for license terms.
%
% Project Code: YPML101
% Project Title: Evolutionary Clustering in MATLAB
% Publisher: Yarpiz (www.yarpiz.com)
% 
% Developer: S. Mostapha Kalami Heris (Member of Yarpiz Team)
% 
% Contact Info: sm.kalami@gmail.com, info@yarpiz.com
%

function [z, out] = ClusteringCost(m, X, k)
    % m is the matrix of the three centroids so [3*2] size, X is 300*2 of the data points
    % Calculate Distance Matrix = calculates euclidean distance.
    d = pdist2(X, m);
    %d is 300*3 size matrix with d[1,1] gives distance of point X[1] from midpoint m[1].
    % Assign Clusters and Find Closest Distances
    [dmin, ind] = min(d, [], 2);
	
	max_clust = max(ind);
	[row, col] = size(unique(ind));
	
	if row != k
	    WCD = inf;
		z = WCD;
		out.d=d;
		out.dmin=dmin;
		out.ind=ind;
		out.WCD=WCD;    
	    return 
	end 
	
	%M = min(A,[],dim) returns the smallest elements along dimension dim. 
	%For example, if A is a matrix, then min(A,[],2) is a column vector containing the minimum value of each row.
    
    % Sum of Within-Cluster Distance
    WCD = sum(dmin);
    
    z=WCD;

    out.d=d;
    out.dmin=dmin;
    out.ind=ind;
    out.WCD=WCD;
    
end