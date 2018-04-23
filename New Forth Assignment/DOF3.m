function dy = DOF3(t,y,M,K)

% This function is used to have the Runge-kutta-4th order method, based on
% its functin (odeRK4).
dy=zeros(6,1);
dy(1:3)=y(4:6);
dy(4:6)=-(M^-1)*K*y(1:3);

end







