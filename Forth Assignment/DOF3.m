function dx = DOF3(t,x,M,K)

% This function is used to have the Runge-kutta-4th order method, based on
% its functin (odeRK4).
dx=zeros(6,1);
dx(1:3)=x(4:6);
dx(4:6)=-(M^-1)*K*x(1:3);

end







