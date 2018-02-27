%% Manouchehr Mohammadi

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
d=eig(K,M);
Omega= sqrt(d);                %Natural frequency 
wn1=Omega(1);                  %Natural frequency for m1
wn2=Omega(2);                  %Natural frequency for m2
wn3=Omega(3);                  %Natural frequency for m3            
wn=[wn1 wn2 wn3];        %Natural frequencies' vector
%% Part3- We have removed the spring 1
K_new=[k2 -k2 0;-k2 k2+k3 -k3;0 -k3 k3];

d_1=eig(K_new,M);
omega_new=sqrt(d_1);
wn1_1=omega_new(1);
wn2_1=omega_new(2);
wn3_1=omega_new(3);
wn_new=[wn1_1 wn2_1 wn3_1];    %New natural frequencies' vector

%% Part4- Solving the system with ode45,ode15s,odeRK4, & odeSIE
tspan=0:1e-3:1;
dt=1e-3;                            %time interval
tk=1;                               %total time
x0=[0.5 0.75 0.75 1.25 0.5 1.5];    %initial conditions
                 
fun_g = @(t,y) y;                   %fun_g needed to compute the solution using odeSIE
fun_f=@(t,x) (M^-1)*K*x;            %fun_f needed to compute the solution using odeSIE


tic
[t1,x1] = odeRK4(@system_eq,[dt tk] ,x0);    % the solution using odeRK4
toc
t1=t1';
x1=x1';

tic
[t2,x2,y2]=odeSIE(fun_g,fun_f,[dt tk] ,[0.5 0.75 0.9],[0.75 1.25 1.6]); % the solution using odeSIE
toc
t2=t2';
x2=x2';

tic
[t3,x3]= ode45(@system_eq,tspan,x0); % the solution using ode45
toc

tic
[t4,x4]= ode15s(@system_eq,tspan,x0); % the solution using ode15s
toc 

rmse_RK45= sqrt(sum(x1(:,1)-x3(:,1)).^2/length(x1(:,1)));        % Root mean sqaure error of odeRK4 vs ode45
rmse_RK15= sqrt(sum(x1(:,1)-x4(:,1)).^2/length(x1(:,1)));        % Root mean sqaure error of odeRK4 vs ode15s

rmse_SIE45= sqrt(sum(x2(:,1)-x3(:,1)).^2/length(x2(:,1)));       % Root mean sqaure error of odeSIE vs ode45
rmse_SIE15= sqrt(sum(x2(:,1)-x4(:,1)).^2/length(x2(:,1)));       % Root mean sqaure error of odeSIE vs ode15s


%% Part 5- The calculation of M_hat=((eigenvector)')(Mass Matrix)(eigenvector) and K_hat=((eigenvector)')(Spring constant Matrix)(eigenvector) 

K_expand=[0 1 0 0 0 0; k1+k2 0 -k2 0 0 0;0 0 0 1 0 0;-k2 0 k2+k3 0 -k3 0;0 0 0 0 0 1;0 0 -k3 0 k3 0];

M_expand=[0 0 0 0 0 0;0 m1 0 0 0 0;0 0 0 0 0 0;0 0 0 m2 0 0;0 0 0 0 0 0;0 0 0 0 0 m3];

[V,EV]=eig(K_expand,M_expand);   %V is the eigenvetors and diagonal of EV corresponds to the eigenvalues
omega=sqrt(V(1,1));
X= V(:,1);
p0=inv(V)*x0';           % modal coordinates p

M_hat= V'*(M_expand*V);
K_hat= V'*(K_expand*V);

fun_g1=@(t,y) y;
fun_f1= @(t,p) -1*(M_hat^-1)*K_hat*p;

%   Solving the equation of modal coordinates

[t5,x5] = odeRK4(@modal_coordinates,[dt tk] ,p0); %odeRK4
t5=t5';
x5=x5';

[t6,x6,y6]=odeSIE(fun_g,fun_f,[dt tk] ,[-2.85e15 -2.54e15 2.85e15],[-3.23e15 3.23315 2.54e15]); %odeSIE
t6=t6';
x6=x6';

[t7,x7]= ode45(@modal_coordinates,tspan,p0); %ode45

[t8,x8]= ode15s(@modal_coordinates,tspan,p0); %ode15s

figure (1)

plot (t3,x3(:,1),'LineWidth',1.3)
hold on
grid on

figure (2)
plot (t7,x7(:,1),'LineWidth',1.3)
grid on







