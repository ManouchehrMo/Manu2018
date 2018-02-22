close all
clear all
clc
% initial position of cart
y0(1,1)=1;
% initial angle of pendulum
y0(2,1)=pi/180;
% initial velocity of cart-
y0(3,1)=0;
% initial angular velocity of pendulum
y0(4,1)=0;

% tspan=0:1e-4:5;
tspan=[0 10];
[t,y]=ode15s(@my_model, tspan, y0);

figure
plot(t,y(:,1),'LineWidth',1.7)
hold on
plot(t,y(:,2),'LineWidth',1.7)
% legend('Cart','Pendulum')
% xlabel('time(s)')
% ylabel('position(m)/angle(rad)')
% title('Position of cart and pendulum')
grid on

figure
plot(t,y(:,3),'LineWidth',1.7)
hold on
plot(t,y(:,4),'LineWidth',1.7)
% legend('Cart','Pendulum')
% xlabel('time(s)')
% ylabel('velocity(m/s)/angular velocity(rad/s)')
% title('Velocity of cart and pendulum')
grid on