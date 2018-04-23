function yprime = f_model(t,y)

% this function is used for ODE45 and ODE15s methods.
m1 = 2;
m2 = 1.5;
m3 = 1;
% k1=20000;
% k2=15000;
% k3=10000;

M = diag([m1,m2,m3]); % Mass Matrix
K = [35000, -15000,0; % Spring constant matrix
     -15000, 25000,-10000;
     0, -10000,10000];
VecX = [y(1);y(2);y(3)]; 

eom = M\(-K*VecX); % Equation of motion

yprime(1) = y(4);
yprime(2) = y(5);
yprime(3) = y(6);
yprime(4) = eom(1);
yprime(5) = eom(2);
yprime(6) = eom(3);

yprime = yprime(:);



