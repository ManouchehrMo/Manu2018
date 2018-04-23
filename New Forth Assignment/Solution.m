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

%% %% Displacement and velocity calculations
y0=[1 1.5 2 1.5 3 4];
dt = 10e-5;
tk = 1;
RelTol=1e-6;
AbsTol=1e-9; 
options = odeset('AbsTol',AbsTol,'RelTol',RelTol);
% ode45
[T, Y1] = ode45(@(t,y) DOF3(t,y,M,K), [0:dt:tk], y0,options);
% ode15s
[T, Y2] = ode15s(@(t,y) DOF3(t,y,M,K), [0:dt:tk], y0,options);
% odeRK4
[T, Y3] = odeRK4(@(t,y) DOF3(t,y,M,K), [dt tk], y0);
Y3=Y3';
% Semi- implicit Euler Method
fun_f = @(t,v) v;
fun_g = @(t,u) -1*(M^-1)*K*u;
u0 = y0(1:3); % initial displacement
v0 = y0(4:6); % initial velocity
% [T,u,v] = simEuler(fun_f,fun_g,[0:dt:tk],u0,v0);
[T,u,v] = odeSIE(fun_f,fun_g,[0:dt:tk],u0,v0);
Y4 = [u;v];
Y4 = Y4';

%% Calculate the Modal Coordinates

[T, Y_tilda1] = ode45(@(t,y) modal_coordinates(t,y,M,K), [0:dt:tk], y0);


%% Calculate accuracy with four methods
rmse_ode15 = sqrt(sum(Y2(:,1)-Y1(:,1)).^2/length(Y1(:,1)));
rmse_odeRK4 = sqrt(sum(Y3(:,1)-Y1(:,1)).^2/length(Y1(:,1)));
rmse_odeSemiFE = sqrt(sum(Y4(:,1)-Y1(:,1)).^2/length(Y1(:,1)));
gap1=Y2(:,1)-Y1(:,1);
gap2=Y3(:,1)-Y1(:,1);
gap3=Y4(:,1)-Y1(:,1);
errorV1=Y2(:,4)-Y1(:,4);
errorV2=Y3(:,4)-Y1(:,4);
errorV3=Y4(:,4)-Y1(:,4);

%% Part2- The natural frequency
[V,A]=eig(K,M);
omega= sqrt(diag(A));          %Natural frequency 
wn1=omega(1);                  %Natural frequency for m1
wn2=omega(2);                  %Natural frequency for m2
wn3=omega(3);                  %Natural frequency for m3   


%% Part3- We have removed the spring 1
K_new=[k2 -k2 0;-k2 k2+k3 -k3;0 -k3 k3];

d_1=eig(K_new,M);
omega_new=sqrt(d_1);
wn1_1=omega_new(1);
wn2_1=omega_new(2);
wn3_1=omega_new(3);


%% Part 5- The calculation of M_hat=((eigenvector)^transpose)(Mass Matrix)(eigenvector) and K_hat=((eigenvector)^transpose)(Spring constant Matrix)(eigenvector) 
[v,d]=eig(K,M);
M_hat=v'*M*v;
disp(M_hat); % to verify that M_hat=I
K_hat=v'*K*v;
difference= K_hat-d;
disp(difference);  % to verify that K_hat=eigen values
eig(K_hat,M_hat);

%%Plot the accuracy of velocity the system

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 8 6]);
plot(0:dt:tk,errorV1,'r','LineWidth', 1.3)
hold on
plot(0:dt:tk,errorV2,'b','LineWidth', 1.3)
hold on
plot(0:dt:tk,errorV3,'LineWidth', 1.3)
xlabel('Time','FontUnits','points','interpreter','latex','FontSize',11,'FontName','Times')
ylabel('error','FontUnits','points','interpreter','latex','FontSize',11,'FontName','Times')
legend({'ode45-ode15s','ode45-odeRK4','ode45-odeSemiFE'},'FontUnits','points','interpreter','latex','FontSize',6,'FontName','Times','Location','NorthWest')
grid on
print -depsc2 errorV.eps
hold off







