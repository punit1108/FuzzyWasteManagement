TSP_GA Traveling Salesman Problem (TSP) Genetic Algorithm (GA) 
  Finds a (near) optimal solution to the TSP by setting up a GA to search 
  for the shortest route (least distance for the salesman to travel to 
  each city exactly once and return to the starting city) 
Summary: 
1. A single salesman travels to each of the cities and completes the 
   route by returning to the city he started from 
2. Each city is visited by the salesman exactly once

Input: 
USERCONFIG (structure) with zero or more of the following fields: 
- XY (float) is an Nx2 matrix of city locations, where N is the number of cities 
- DMAT (float) is an NxN matrix of point to point distances/costs 
- POPSIZE (scalar integer) is the size of the population (should be divisible by 4) 
- NUMITER (scalar integer) is the number of desired iterations for the algorithm to run 
- SHOWPROG (scalar logical) shows the GA progress if true 
- SHOWRESULT (scalar logical) shows the GA results if true 
- SHOWWAITBAR (scalar logical) shows a waitbar if true

Input Notes: 
1. Rather than passing in a structure containing these fields, any/all of 
   these inputs can be passed in as parameter/value pairs in any order instead. 
2. Field/parameter names are case insensitive but must match exactly otherwise.

Output: 
RESULTSTRUCT (structure) with the following fields: 
    (in addition to a record of the algorithm configuration) 
- OPTROUTE (integer array) is the best route found by the algorithm 
- MINDIST (scalar float) is the cost of the best route

Usage: 
tsp_ga 
  -or- 
tsp_ga(userConfig) 
  -or- 
resultStruct = tsp_ga; 
  -or- 
resultStruct = tsp_ga(userConfig); 
  -or- 
[...] = tsp_ga('Param1',Value1,'Param2',Value2, ...);

Example: 
% Let the function create an example problem to solve 
tsp_ga;

Example: 
% Request the output structure from the solver 
resultStruct = tsp_ga;

Example: 
% Pass a random set of user-defined XY points to the solver 
userConfig = struct('xy',10*rand(50,2)); 
resultStruct = tsp_ga(userConfig);

Example: 
% Pass a more interesting set of XY points to the solver 
n = 100; 
phi = (sqrt(5)-1)/2; 
theta = 2*pi*phi*(0:n-1); 
rho = (1:n).^phi; 
[x,y] = pol2cart(theta(:),rho(:)); 
xy = 10*([x y]-min([x;y]))/(max([x;y])-min([x;y])); 
userConfig = struct('xy',xy); 
resultStruct = tsp_ga(userConfig);

Example: 
% Pass a random set of 3D (XYZ) points to the solver 
xyz = 10*rand(50,3); 
userConfig = struct('xy',xyz); 
resultStruct = tsp_ga(userConfig);

Example: 
% Change the defaults for GA population size and number of iterations 
userConfig = struct('popSize',200,'numIter',1e4); 
resultStruct = tsp_ga(userConfig);

Example: 
% Turn off the plots but show a waitbar 
userConfig = struct('showProg',false,'showResult',false,'showWaitbar',true); 
resultStruct = tsp_ga(userConfig);