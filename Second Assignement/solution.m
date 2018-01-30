tspan=[0 10]; % tspan=[t0 tfinal]
x0=[-1 -1]; % x0 is vector of initial conditions

%%
% dlkfghfklgj
[t,x]=ode45(@free_fun ,tspan,x0);
%% Plots for Fress System
figure(1)
plot(t,x(:,1)); % plot x1(t) which is x(t)
xlabel('time(sec)')
ylabel('x (rad)')
title('Free System')
grid on
figure(2)
plot(t,x(:,2)); % plot x2(t) which is x_dot(t)
xlabel('time(sec)')
ylabel('/x_dot (rad/sec)')
title('Free System')
grid on
%%
[t,x]=ode45(@damped_fun ,tspan,x0);
%% Plots For Damped System
figure(3)
plot(t,x(:,1)); % plot x1(t) which is x(t)
xlabel('time(sec)')
ylabel('x (rad)')
title('Damped System')
grid on
figure(4)
plot(t,x(:,2)); % plot x2(t) which is x_dot(t)
xlabel('time(sec)')
ylabel('/x_dot (rad/sec)')
title('Damped System')
grid on
%%
[t,x]=ode45(@forced_fun ,tspan,x0);
%% Plots For Forced System
figure(5)
plot(t,x(:,1)); % plot x1(t) which is x(t)
xlabel('time(sec)')
ylabel('x (rad)')
title('Forced System')
grid on
figure(6)
plot(t,x(:,2)); % plot x2(t) which is x_dot(t)
xlabel('time(sec)')
ylabel('/x_dot (rad/sec)')
title('Forced System')
grid on

% k=input('for free system please enter 0 and for damped system please write 1');
% switch k
%     case 1
%         [t,x]=ode45(@free_fun ,tspan,x0);
%     case 2
%         [t,x]=ode45(@damped_fun ,tspan,x0);
% end