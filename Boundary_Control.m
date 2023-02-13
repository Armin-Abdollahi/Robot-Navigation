function x = Boundary_Control(x,Lower_Boundary,Upper_Boundary)

x = max(x,Lower_Boundary);   % If the variable value is less than the lower boundary, it takes the value of the lower boundary with maximization
x = min(x,Upper_Boundary);   % If the variable value is greater than the upper boundary, it takes the value of the upper boundary with minimization

end