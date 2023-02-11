clc             % Clear command window
clear           % Clear workspace
close all       % Close all figure

%=========================== Parameters Setting ===========================
global NFE
NFE = 0;                % Number Of Fitness Function Evaluations
popsize = 30;           % Population Size
Max_It = 100;           % Maximum Number Of Itererations
Pc=0.5                  % Crossover Probability
Lb = 0;                 % Lower Bound
Ub = 10;                % Upper Bound

for i=1:popsize
    pop(i).x=unifrnd(lb,ub);
    pop(i)=fitness(pop(i),data); 
end


% Mutation


beta=unifrnd(BetaLb,BetaUb);
        
u=pop(A).x+beta.*(pop(B).x-pop(C).x);




% Crossover



























%=========================== Initialize agents ===========================
total = 1;          % Number of robots
iterations = 100;   % Number of iterations
%x = [2 4 6 8];
%y = [3 1 5 7];


%======================= Initialize of environment ========================
page = zeros(500,500);       % Size of the environment

x = 0:1:10;
y = 0:1:10;

plot(x,y,'linewidth',5);


axis([0 10 0 10])
%=========================================================================


%============================== First Test ===============================







%============================== Second Test ==============================







%========================= Exists a valid agent? =========================







%================= Move robot to position of best agent ==================







%=========================== Reach the target? ===========================







%============================= Update agents =============================







%================================= Stop ==================================