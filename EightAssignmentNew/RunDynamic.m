%% Task 8 - Computer methods in mechanics
% Manouchehr Mohammadi

clear all
close all
clc
%% initial data
% model definition
syms m1 m2 m3 m4 real  %%% defintions of mass's symbols
syms l1 l2 l3 l4 real  %%% definition of length's symbols
syms x1 y1 phi1 x2 y2 phi2 x3 y3 phi3 x4 y4 phi4 real

%%
g = -9.81; % gravity
%%

% Data regarding links
Body_1.type = 'Linkage';
Body_1.m = 4;
Body_1.l = 3;
Body_1.uix = -1;
Body_1.uiy = 0;
Body_1.ujx = 1;
Body_1.ujy = 0;

Body_2.type = 'Linkagek';
Body_2.m = 3;
Body_2.l = 4;
Body_2.uix = -2;
Body_2.uiy = 0;
Body_2.ujx = 2;
Body_2.ujy = 0;

Body_3.type = 'Linkage';
Body_3.m = 2.5;
Body_3.l = 4.7;
Body_3.uix = -1.5;
Body_3.uiy = 0;
Body_3.ujx = 1.5;
Body_3.ujy = 0;

Body_4.type = 'Linkage';
Body_4.m = 2;
Body_4.l = 2;
Body_4.uix = -1;
Body_4.uiy = 0;
Body_4.ujx = 1;
Body_4.ujy = 0;

model_def.bodies = [Body_1, Body_2, Body_3, Body_4];

%% Data regarding constarints among linkages
Constraint_1.type = 'revolute';
Constraint_1.ibody = 0;
Constraint_1.jbody = 1;

Constraint_2.type = 'revolute';
Constraint_2.ibody = 1;
Constraint_2.jbody = 2;

Constraint_3.type = 'revolute';
Constraint_3.ibody = 2;
Constraint_3.jbody = 3;

Constraint_4.type = 'revolute';
Constraint_4.ibody = 3;
Constraint_4.jbody = 4;

model_def.Constraint=[Constraint_1,Constraint_2,Constraint_3,Constraint_4];

%% initial condition of the system
% Positions
yy0 = [2 0 0 3 0 0 5 0 0 9 0 0];                        

% velocity 
dy0 = zeros (1,length(yy0)); 

y0 = [yy0 dy0]';

[C] = CONS( y0, model_def);  % Constrints

[Cq,Cp] = C_q( y0, model_def);

[G] = G_jac( y0, model_def);


%%
% Solution for the system
y0 = [yy0 dy0]';
gamma= 0.9;
zeta= 0.9;
tspan = linspace(0, 1, 1001);
n = length(model_def.bodies);
odefun2 = @(t, y) [y(3*n+1:6*n)
    Acc( y, model, gamma, zeta)];