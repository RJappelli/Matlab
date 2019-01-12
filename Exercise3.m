% Bisection Method
clear
clc
%% Tolerance
tol = 1.e-10;
% Function
myFunction = @(x) 0.5*x + sqrt(x) - 2;
% Initial Values
x_lower = -100;
x_upper = 100;

x_mid = (x_lower + x_upper)/2;

while abs(myFunction(x_mid))>tol
    if (myFunction(x_mid)*myFunction(x_lower)) < 0 
        x_upper = x_mid;
    else
        x_lower = x_mid;
    end
    x_mid = (x_lower + x_upper)/2;
end
fprintf ('The root is %g\n', x_mid)