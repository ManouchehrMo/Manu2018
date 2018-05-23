%% TASK 7 - Computer Methods In Mechanics
%% Manouchehr Mohammadi 
%%
clear all
clc
% Defining The symbolic parameters
syms q1 q2 q3 dphinia1 t d_1 d_2 d_3 
syms s_1 s_2 al_1 dq1 dq2 dq3
%%
q = [q1 q2 q3];
dq = [dq1 dq2 dq3];
C = [l1*cos(q1)+l2*cos(q2)-l3*cos(q3)-d1;
       l1*sin(q1)+l2*sin(q2)-l3*sin(q3)-d2;
       q1-phinia1-dphinia1*t];
%%  
% Jacobian Matrix and its derivations
Cq = jacobian(C,q);
Cqq=Cq*dq.';
Cqdq = jacobian(Cqq,q);
Cqqq = Cqdq*dq.';
ct = ConsTime(q);
Ctt = ConsTimeTime(q);