clear all
clc

%% Using Gauss - Seidel Method to solve system of lin. equation
A=[1,0.5;1,-1];
y=[3,1]';

%Choosing Q for Gauss Seidel

Q=triu(A);
Qinv = inv(Q);

tol=10e-6;
maxit=1000;
p=0.1;
q=0.1

for i=1:maxit
    p(i+1) = 3 - 0.5*q(i);
    q(i+1) = p(i+1) - 1;
    dp = p(i+1) - p(i);
    if norm(dp,1)<tol break
    end
end

disp(['The equilibrium price is ', num2str(p(end)), ' and the equilibrium quantity is ', num2str(q(end))])
disp(['The number of iteration is ', num2str(i)])
disp(' ')

%% 1.6 Using Successive Over Relaxation

lambda=0.1:0.1:0.9;
l=size(lambda,2);
maxit1=100000;

for j=1:l
    x1=[0,0]';
    for ii = 1:maxit1
            dx1 = Qinv*(y - A*x1);
            x1 = x1 + lambda(j)*dx1;
            if norm(dx1,1) < tol break
            end
            if ii>=maxit1
                disp('No Convergence')
            end
    end
    disp(['For lambda ', num2str(lambda(j)), ' ', ...
        ', price is ', num2str(x1(1)),', quantity is ', num2str(x1(2)),...
        ', iteration is ', num2str(ii)])
end








