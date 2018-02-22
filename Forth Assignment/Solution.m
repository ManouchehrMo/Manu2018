%% ASSIGNMENT 5- Manouchehr Mohammadi

close all
clear all
clc
%% Part1 - The equation of motion for three masses connected by three springs
syms m1 m2 m3 real;
assumeAlso(m1 > 0); % mass 1
assumeAlso(m2 > 0); % mass 2
assumeAlso(m3 > 0); % mass 3
syms k1 k2 k3;
assumeAlso(k1 > 0); % spring constant 1
assumeAlso(k2 > 0); % spring constant 2
assumeAlso(k3 > 0); % spring constant 3
syms X1(t) X2(t) X3(t)
% The numerical values for masses & spring constants
m1=2;
m2=1.5;
m3=1;
k1=20e3;
k2=15e3;
k3=10e3;
% the mass, spring constant, and force matrices are created as below
Xp1(t)=diff(X1);
Xpp1(t)=diff(Xp1);
Xp2(t)=diff(X2);
Xpp2(t)=diff(Xp2);
Xp3(t)=diff(X3);
Xpp3(t)=diff(Xp3);
X=[X1;X2;X3];
Xpp=[Xpp1;Xpp2;Xpp3];
M=[m1 0 0;0 m2 0;0 0 m3];               %mass matrice
K=[k1+k2 -k2 0;-k2 k2+k3 -k3;0 -k3 k3]; % spring matrice
F=[0;0;0];                              % Force martice
% Equation of motion 
Eq=M*Xpp+K*X-F;

%% Part2- The natural frequency
Nf= sqrt(eig(K,M));              % Natural Frequency in presence of spring1

%% Part3- We have removed the spring 1
% K_new=[k2 -k2 0;-k2 k2+k3 -k3;0 -k3 k3];
K_new=[15e3 -15e3 0; -15e3 25e3 -10e3;0 -10e3 10e3];
Nf_new=sqrt(eig(K_new,M));       % Natural frequency in absence of spring1

%% Part4- Solving the system with ode45,ode15s,odeRK4, & odeSIE
dt = 0.0015; 
tk = 1;
tspan=[0 1];
x0=[0 0 0 0 0 0];
y0=[0.25 1 0.5 1.25 0.75 1.5]; % initial conditions for positions and velocities for three masses.
[t1,y1]=ode45(@f_model,tspan,y0);     % the solution using ODE45

[t2,y2]=ode15s(@f_model,tspan,y0);  % the solution using ODE15s


[t3,y3] = odeRK4(@(t,x) DOF3(t,x,M,K) ,[dt tk] ,y0); % the solution using ODERK4
y3=y3';
t3=t3';

figure()
plot(t1,y1(:,3),'r','LineWidth',0.5);
hold on
plot(t2,y2(:,3),'k','LineWidth',0.5)
plot(t3,y3(:,3),'-b','LineWidth',0.5)
grid on
print('\\maa1.cc.lut.fi\home\h17111\Desktop\Greg\Forth Assignment\ye mesal\plots','-dmeta')
%% Part 5- The calculation of M_hat=((eigenvector)^transpose)(Mass Matrix)(eigenvector) and K_hat=((eigenvector)^transpose)(Spring constant Matrix)(eigenvector) 
[v,d]=eig(K,M);
M_hat=v'*M*v;
disp(M_hat); % to verify that M_hat=I
K_hat=v'*K*v;
difference= K_hat-d;
disp(difference);  % to verify that K_hat=eigen values
eig(K_hat,M_hat);

%% Error
% rmse_RK45= sqrt(sum(y1(:,1)-y3(:,1)).^2/length(y1(:,1)))
% rmse_RK15= sqrt(sum(x1(:,1)-x4(:,1)).^2/length(x1(:,1)))








