clc             % Clear command window
clear           % Clear workspace
close all       % Close all figure

%% Parameters setting
popsize = 30;           % Population size
Max_It = 100;           % Maximum number of itererations
Pc = 0.5;               % Crossover probability
Lower_Boundary = 0;     % Lower bound
Upper_Boundary = 10;    % Upper bound

for i=1:popsize
    pop(i).x=unifrnd(Lower_Boundary,Upper_Boundary);
    pop(i)=fitness(pop(i),data); 
end


%% Mutation


beta=unifrnd(BetaLb,BetaUb);
        
u=pop(A).x+beta.*(pop(B).x-pop(C).x);



%% Initialize agents
total = 1;          % Number of robots
iterations = 100;   % Number of iterations
%x = [2 4 6 8];
%y = [3 1 5 7];


%% Initialize of environment
page = zeros(500,500);       % Size of the environment

x = 0:1:10;
y = 0:1:10;

plot(x,y,'linewidth',5);


axis([0 10 0 10])
