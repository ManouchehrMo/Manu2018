function [yprime]=forced_fun(t,x)

% the main function is mx''+cx'+kx=f(t)
% we defined m=1 kg, k=3
% Because it is a damped-forced system, the damping coefficient is c= -0.8
% The equation is like: x''(t)+150x(t)+0.8x'(t)=asin(wt)
% Lets assume a=5, and w=1
% the equation in a matrix form can be as:
%[x'; x'']=[0 1; -150 0][x; x']+[0; 2]f(t)
% For simplicitiy: A=[0 1; -150 0]
% For simplicitiy: B=[0; 2]
a=5; % domain of the force function
%T=t/2;
w=t+1;
% The forced function is as below
f=-a*sin(w*t);
    A=[0 1;-150 -0.8];
    B=[0 1]';
yprime=A*x+B*f;
