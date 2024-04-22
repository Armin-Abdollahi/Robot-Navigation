clc
clear
close all
format ShortG

%% Parameters Setting

global NFE
NFE=0;
data=load('data.mat');
nvar=data.nvar;
lb=data.LB; % Lower Bound
ub=data.UB;    % Upper Bound   


popsize=30;        % Population Size

maxiter=100;      % Maximum Number of itererations

BetaLb=-0.3*ones(1,nvar);   % Lower Bound of Beta
BetaUb= 0.9*ones(1,nvar);   % Upper Bound of Beta

Pcross=0.5;       % Crossover Probabilitery

data.lb=lb;data.ub=ub;

%% Initial Population
tic
emp.x=[];
emp.fit=[];
emp.info=[];
emp.SCH=[];
pop=repmat(emp,popsize,1);

for i=1:popsize
    pop(i).x=unifrnd(lb,ub);
    pop(i)=fitness(pop(i),data);
    
end


[~,ind]=min([pop.fit]);
gpop=pop(ind);



%%  Main Loop

BEST=zeros(maxiter,1);
MEAN=zeros(maxiter,1);


for iter=1:maxiter
    
    for i=1:popsize
        newpop=pop(i);
        x=pop(i).x;
        
        Q=[1:i-1 i+1:popsize];
        
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
        
        newpop.x=x;
        newpop=fitness(newpop,data);
        
        % Update Pop And Global Pop
        
        if newpop.fit<pop(i).fit
            pop(i)=newpop;
        end
        
        if newpop.fit<gpop.fit
            gpop=newpop;
        end
        
        
    end
    
    
    BEST(iter)=gpop.fit;
    MEAN(iter)=mean([pop.fit]);
    
    NO=' Feasible';
    if gpop.SCH>0
        NO=' Infeasible';
    end
    
    disp([ 'Iter = ' num2str(iter) ' BEST = ' num2str(BEST(iter)) NO ])
    
    
    
end

%%  Results
disp([ ' Best Fitness = '  num2str(gpop.fit)])
disp([ ' Time = '  num2str(toc)])

figure(1)
plot(BEST,'r')

xlabel(' iteration ')
ylabel(' fitness')
legend( 'BEST')
title('Differential Evolutionary')




RES(gpop,data)
