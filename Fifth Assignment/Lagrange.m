%% Equations of motions
clear 
close all
clc


syms x  xdot xddot
syms theta thetadot thetaddot
syms m c k l

%% Deriving the equations of motion using Lagrange Method
Eq(1)=xddot*(3*m)+k*x+m*l*thetaddot*cos(theta)-m*l*(thetadot^2)*sin(theta)+c*xdot;
Eq(2)=m*xddot*l*cos(theta)+(2/3)*m*(l^2)*thetaddot+m*xdot*l*(thetadot^2)*sin(theta)+2*k*l*theta+c*(l^2)*thetadot;
%% Fiding Jacobian Matrix
M = jacobian(Eq,[xddot, thetaddot]);
K = jacobian(Eq,[x, theta]);
C = jacobian(Eq,[xdot, thetadot]);

matlabFunction(M,'File','SysMass')
matlabFunction(K,'File','SysSpring')
matlabFunction(C,'File','SysDamping')

[M,F] = equationsToMatrix(Eq(1)==0,Eq(2)==0,[xddot, thetaddot]);
EOM = M\F;
matlabFunction(EOM,'File','EOM');