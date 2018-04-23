%% Clearing the matlab workspace
%%
clear;
clear;
close all;
clc;

%% Defining symbolic variables
%%
syms m k c L g real
syms x(t) theta(t)
assumeAlso(m > 0);
assumeAlso(k > 0);
assumeAlso(c > 0);

%% Writing Equation of Motion

xdot = diff(x, t);
xddot = diff(xdot, t);

thetadot = diff(theta, t);
thetaddot = diff(thetadot, t);

Eq1 = (3*m)*xddot + (3*k)*x + (2*k*L)*theta + (2*c)*xdot + (c*L)*thetadot == 0;
Eq2 = (m*L^2/3)*thetaddot + (2*k*L)*x + (2*k*L^2)*theta + (c*L)*xdot + (c*L^2)*thetadot - 2*m*g== 0;

symvar(Eq1);
symvar(Eq2);
RequiredJacobian = [3*k 2*k*L; 2*k*L 2*k*L^2]

%% Appllying Backward Euler to derived Jacobian

pInitial = 0.707;
pdotInitial = 0;

tspan=[0 10];
p0=[pInitial; pdotInitial];

sInitial = 0.04;
sdotInitial = 0;
s0=[sInitial; sdotInitial];

[t1,q1]=ode15s('MassSpringDamper',tspan,s0);
[t2,q2]=ode15s('MassSpringDamper',tspan,p0);