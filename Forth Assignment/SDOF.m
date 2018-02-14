clear all
close all
clc
%% Defining the time period and initial conditions
syms x t
xp= diff(x,t);
xpp= diff(xp,t);
tspan=0:0.01:10;
m=2;
k=100;
dt=1e-5;
tk=5;
y0=[0.5 1];

Eq= xpp-(k/m)*x;

%% Solving the equation by odeFE

[T,Y]=odeFE(Eq, [dt, tk],y0);

%% Solving the equation by odeRK4

% [t2,y2]= odeRK4(@Ms,tspan,y0)

%% Plotting the solution




