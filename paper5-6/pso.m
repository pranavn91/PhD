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

clc;  %clear screen
clear;  %clear workspace
close all;  %close other windows

%% Problem Definition


%ecolidat.csv - 8; irisdat.csv - 3; winedat.csv - 3; wiscdat.csv - 2; yeastdat.csv - 10;

data = load('wiscdat.csv'); 
X = data;
k = 2;

CostFunction=@(m) ClusteringCost(m, X, k);     % Cost Function is a function of m which returns ClusteringCost(m,X)

VarSize=[k size(X,2)];  % Decision Variables Matrix Size,we get matrix of size 1 * 2 for three centroids with 2 dimensions (x,y) each
%size(X,2) = no. of columns of X
nVar=prod(VarSize);     % Number of Decision Variables / unknown variables / dimensions

VarMin= repmat(min(X),k,1);      % Lower Bound of Variables
VarMax= repmat(max(X),k,1);      % Upper Bound of Variables

%% PSO Parameters

MaxIt=200;      % Maximum Number of Iterations

nPop=50;        % Population Size (Swarm Size)

 w=1;            % Inertia Weight
 wdamp=0.99;     % Inertia Weight Damping Ratio 
 c1=2;           % Personal Learning Coefficient / acceleration coedd
 c2=2;           % Global Learning Coefficient / social global acceleration coeeff

% Constriction Coefficients
phi1=2.05;
phi2=2.05;
phi=phi1+phi2;
chi=2/(phi-2+sqrt(phi^2-4*phi));

w=chi;          % Inertia Weight
wdamp=1;        % Inertia Weight Damping Ratio
c1=chi*phi1;    % Personal Learning Coefficient
c2=chi*phi2;    % Global Learning Coefficient

% Velocity Limits
VelMax=0.1*(VarMax-VarMin);
VelMin=-VelMax;

%% Initialization

empty_particle.Position=[];
empty_particle.Cost=[];
empty_particle.Out=[];
empty_particle.Velocity=[];
empty_particle.Best.Position=[];
empty_particle.Best.Cost=[];
empty_particle.Best.Out=[];

particle=repmat(empty_particle,nPop,1); %repmat = repeat matrix
%repmat(A,4,3) means A = [1 2;3 4] gives 4 repeatitions of A vertically an d 3 horizontally
BestSol.Cost=inf; %global value which should be worst possible as we have to minimize we set to infinity but if we had to maximize we would set to -inf

for i=1:nPop
    
    % Initialize Position
    particle(i).Position=unifrnd(VarMin,VarMax,VarSize);
    
    % Initialize Velocity
    particle(i).Velocity=zeros(VarSize);
    
    % Evaluation
    [particle(i).Cost, particle(i).Out]=CostFunction(particle(i).Position);
    
    % Update Personal Best
    particle(i).Best.Position=particle(i).Position;
    particle(i).Best.Cost=particle(i).Cost;
    particle(i).Best.Out=particle(i).Out;
    
    % Update Global Best to best particle cost so far
    if particle(i).Best.Cost<BestSol.Cost
        
        BestSol=particle(i).Best;
        
    end
    
end

BestCost=zeros(MaxIt,1);
%array to hold best cost value in each iteration

%% PSO Main Loop

for it=1:MaxIt
    
    for i=1:nPop
        
        % Update Velocity
        particle(i).Velocity = w*particle(i).Velocity ...
            +c1*rand(VarSize).*(particle(i).Best.Position-particle(i).Position) ...
            +c2*rand(VarSize).*(BestSol.Position-particle(i).Position);
        
        % Apply Velocity Limits
        particle(i).Velocity = max(particle(i).Velocity,VelMin);
        particle(i).Velocity = min(particle(i).Velocity,VelMax);
        
        % Update Position
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        
        % Velocity Mirror Effect
        IsOutside=(particle(i).Position<VarMin | particle(i).Position>VarMax);
        particle(i).Velocity(IsOutside)=-particle(i).Velocity(IsOutside);
        
        % Apply Position Limits
        particle(i).Position = max(particle(i).Position,VarMin);
        particle(i).Position = min(particle(i).Position,VarMax);
        
        % Evaluation
        [particle(i).Cost, particle(i).Out] = CostFunction(particle(i).Position);
        
        % Update Personal Best
        if particle(i).Cost<particle(i).Best.Cost
            
            particle(i).Best.Position=particle(i).Position;
            particle(i).Best.Cost=particle(i).Cost;
            particle(i).Best.Out=particle(i).Out;
            
            % Update Global Best
            if particle(i).Best.Cost<BestSol.Cost
                
                BestSol=particle(i).Best;
                
            end
            
        end
        
    end
    
       BestCost(it)=BestSol.Cost;
    
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    
    % Plot Solution
   % figure(1);
    finalanswer = [X BestSol.Out.ind];
    pause(0.01);
    
    w=w*wdamp;
    
end


%csvwrite('pso-ecoli-results.csv', finalanswer);
 %csvwrite('pso-iris-results.csv', finalanswer); 
 %csvwrite('pso-wine-results.csv', finalanswer);
%csvwrite('pso-wisc-results.csv', finalanswer);
% csvwrite('pso-yeast-results.csv', finalanswer);


