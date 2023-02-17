function Solution = Fitness(Solution, Create_Data)



end







%%
disp('=======================================================')
disp('                     Best Solution                     ')
disp('=======================================================')
plot(Solution)
disp('Number Of Function Evaluations = ',num2str(NFE))



%%
global NFE
if NFE==0
    xx = linspace(X_Start, X_Target, n+2);
    yy = linspace(Y_Start, Y_Target, n+2);

end

%% Robot steps
X_Start = [X_Start X X_Target];
Y_Start = [Y_Start Y Y_Target];

CS = numel(X_Start);       % Counting steps
TS = linespace(0,1,CS);
tt=linespace(0,1,100);
xx=spline(TS,X_Start,tt);
yy=spline(TS,Y_Start,tt);


dx=diff(xx);
dy=diff(yy);












