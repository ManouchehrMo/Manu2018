function [T,X]=odeRK4(fun,tspan,x0)
%ODE simple integration using Runge Kutta method
%fun-handle with interface fun (T,x)
%tspan-two element vector with dt and tend
%x0-initial conditions

%time step
dt=tspan(1);
T=0:dt:tspan(2);
n =length (T);

X=zeros (length(x0),n);

%populate initial conditions
X(:,1)=x0(:);

%computing the solution

for i=2:n
    K1 = fun(T(i-1), X(:, i-1));
    K2 = fun(T(i-1)+dt/2, X(:, i-1)+0.5*dt*K1);
    K3 = fun(T(i-1)+dt/2, X(:, i-1)+0.5*dt*K2);
    K4 = fun(T(i), X(:, i-1)+dt*K3);
    X(:, i) = X(:, i-1) + dt * (K1+2*K2+2*K3+K4)/6;
    
end

end