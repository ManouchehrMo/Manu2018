function [T,u,v]=odeSIE(fun_f,fun_g,tspan,u0,v0)

% this function is using semi-implicit Euler method

%time step
T = tspan;
n = length(T);
u = zeros(length(u0),n);
v = zeros(length(v0),n);
u(:,1) = u0;
v(:,1) = v0;
%compute the solution
for i=2:n
     dt = T(i)-T(i-1);
    v(:,i) = v(:,i-1) + dt*fun_g(T(i-1), u(:,i-1));
    u(:,i) = u(:,i-1) + dt*fun_f(T(i-1), v(:,i));
end
end