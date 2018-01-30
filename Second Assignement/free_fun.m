function [yprime]=free_fun(t,x)

% the main function is mx''+cx'+kx=f(t)
% we defined m=1 kg, k=150 N/m
% Because it is a free system, the damping coefficient is c= 0
% There is no fprce on the system, so f(t)=0
% The equation is like: x''(t)+150x(t)=0
% the equation in a matrix form can be as:
%[x'; x'']=[0 1; -150 0][x; x']+[0; 0]f(t)
% For simplicitiy: A=[0 1; -150 0]
% For simplicitiy: B=[0; 0]
f=0;
    A=[0 1;-150 0];
    B=[0 0]';
yprime=A*x+B*f;
