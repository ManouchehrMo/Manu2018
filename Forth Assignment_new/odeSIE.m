function [T,x,y]=odeSIE(fun_g,fun_f,tspan,x0,y0)
%ODE simple integration using semi-implicit Euler
%fun-handle with interface fun (t,x)
%tspan-two element vector with dt and tend
%x0-initial conditions

%time step
dt=tspan(1);
T=0:dt:tspan(2);
n =length (T);

x=zeros (length(x0),n);
y=zeros (length(y0),n);
%populate initial conditions
x(:,1)=x0(:);
y(:,1)=y0(:);
%compute the solution
for i=2:n
 
    y(:,i) = y(:,i-1)+dt*fun_g(T(i-1), x(:, i-1));  
    x(:,i) = x(:,i-1)+dt*fun_f(T(i-1), y(:, i));
     
end
end