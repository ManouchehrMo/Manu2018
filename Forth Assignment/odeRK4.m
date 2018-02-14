function [ t, Y ] = odeRK4( fun, tspan, y0 )

% This function is used to have Runge-Kutta-4th order Method.
dt = tspan(1); % time step

t = 0:dt:tspan(2);

n = length(t);

Y = zeros(length(y0), n);

m1 = 2;      % Mass1-kg
m2 = 1.5;    %Mass2-kg
m3 = 1;      %Mass3-kg     
M = diag([m1,m2,m3]); % Mass Matrice
K = [35000, -15000,0; % Spring constant matrice
     -15000, 25000,-10000;
     0, -10000,10000];

Y(:, 1) = y0(:); % The initial conditions

for i = 2:n
    
    K1 = fun(t(i-1), Y(:, i-1));
    K2 = fun(t(i-1)+dt/2, Y(:, i-1)+0.5*dt*K1);
    K3 = fun(t(i-1)+dt/2, Y(:, i-1)+0.5*dt*K2);
    K4 = fun(t(i), Y(:, i-1)+dt*K3);
    
    Y(:, i) = Y(:, i-1) + dt * (K1+2*K2+2*K3+K4)/6;
end

end