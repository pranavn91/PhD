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

Choices = {'Genetic Algorithm (GA)', 'Particle Swarm Optimization (PSO)', 'Differential Evolution (DE)'};

ANSWER = questdlg('Select the algorithm to perform clustering.', ...
                  'Evolutionary Clutsreing', ...
                  Choices{1}, Choices{2}, Choices{3}, ...
                  Choices{1});

if strcmpi(ANSWER, Choices{1})
    ga;
    return;
end

if strcmpi(ANSWER, Choices{2})
    pso;
    return;
end

if strcmpi(ANSWER, Choices{3})
    de;
    return;
end
