clc             % Clear command window
clear           % Clear workspace
close all       % Close all figure

%% Parameters setting
NFE = 0;                % Number of Fitness Function Evaluations (NFE)
Popsize = 30;           % Population size
Max_It = 100;           % Maximum number of itererations
Pc = 0.5;               % Crossover probability

Pop = repmat (emp, Popsize, 1);    % Building an initial population as empty

for i=1:Popsize
    Pop(i).x = unifrnd(Lower_Boundary,Upper_Boundary);
    Pop(i) = fitness(Pop(i)); 
end

%%
for Iteration = 1:Max_It           % For each iteration
    
    for i=1:Popsize                % For each Solution
        New_Pop = Pop(i);
        x = Pop(i).x;
        Q = [1:i-1 i+1:popsize];
        
        S=randsample(Q,3);
        
        A=S(1);
        B=S(2);
        C=S(3);
        
        % Mutation
        
        beta=unifrnd(BetaLb,BetaUb);
        
        u=pop(A).x+beta.*(pop(B).x-pop(C).x);
        
        
        % Crossover
        
        j1=randi([1 nvar]);
        
        j2=find(rand(1,nvar)<Pcross);
        
        J=[j1 j2];
        
        x(J)=u(J);
        
        New_Pop.x=x;
        New_Pop=fitness(New_Pop,data);
        
        % Update Pop And Global Pop
        
        if New_Pop.fit<pop(i).fit
            pop(i)=New_Pop;
        end
        
        if New_Pop.fit<gpop.fit
            gpop=New_Pop;
        end
        
        
    end
    
    
    BEST(Iteration)=gpop.fit;
    MEAN(Iteration)=mean([pop.fit]);
    
    NO=' Feasible';
    if gpop.SCH>0
        NO=' Infeasible';
    end
    
    disp([ 'Iter = ' num2str(Iteration) ' BEST = ' num2str(BEST(Iteration)) NO ])
    
    
    
end

%% Mutation

Beta = unifrnd(Lower_Boundary,Upper_Boundary);    % Beta is random number between lower and upper boundary
        
U = Pop(A).x + Beta.*(Pop(B).x - Pop(C).x);
