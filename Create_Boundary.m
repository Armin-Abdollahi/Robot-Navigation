function x = Create_Boundary(x,Lb,Ub)

x = max(x,Lb);   % If the variable value is less than the lower boundary, it takes the value of the lower boundary with maximization
x = min(x,Ub);   % If the variable value is greater than the upper boundary, it takes the value of the upper boundary with minimization

end