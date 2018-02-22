function yprime=my_model(t,y)
% Gravitational acceleration
g=9.81; % N/kg
% Mass of pendulum and cart
% syms m
% % spring constant & damping constant
% syms k c
% % Length of the pendulum
% syms l
m=5;
k=100;
c=10;
l=0.25;
% yprime(1,1)=x'=v         - Velocity
% yprime(2,1)=(theta)'=w   - Angular velocity
% yprime(3,1)=x''=v'       - Acceleration
% yprime(4,1)=(theta)''=w' - Angular acceleration
% y(1)=x
% y(2)=theta
% y(3)=v
% y(4)=w

Eq = EOM(c,k,l,m,y(4),y(2),y(1),y(3));

yprime(1,1)=y(3);
yprime(2,1)=y(4);
yprime(3:4,1) = Eq;

% 
% yprime(1,1)=y(3);
% yprime(2,1)=y(4);
% yprime(3,1)=(c*y(3)+k*y(1)-m*l*y(4)*sin(y(2))-c*l*y(4)-2*k*l*y(4)+(3/4)*y(4)*c*l*(cos(y(2))^2)+(3/4)*k*l*y(2)*(cos(y(2))^2)+(3/2)*m*g*sin(y(2))*cos(y(2)))/(-3*m+(3/2)*m*(cos(y(2))^2));
% yprime(4,1)=((c/3)*cos(y(2))*y(3)+(k/3)*y(1)*cos(y(2))-(m/3)*l*y(4)*sin(y(2))*cos(y(2))-(c*l/3)*y(4)*cos(y(2))-(2/3)*k*l*y(4)*cos(y(2))+c*(l/2)*y(4)*cos(y(2))+y(2)*k*l*cos(y(2))+m*g*sin(y(2)));
end