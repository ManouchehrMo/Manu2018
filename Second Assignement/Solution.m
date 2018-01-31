clear
close all
clc

%%
% Three ODE solvers are selected: 15s,23,& 45
tspan=0:0.01:10; % tspan=[t0 tfinal]
x0=[-1 -1]; % x0 is vector of initial conditions
options = [];
caseFun = input('please idicate the system case');
% CaseFun=1 is the free system which can be solved with three ODE solvers.
% CaseFun=2 is the free system which can be solved with three ODE solvers.
% CaseFun=3 is the free system which can be solved with three ODE solvers.
%% Solution command
[t,x]=ode45(@fun ,tspan,x0,options,caseFun);

%% Plots for all Systems
figure(1)
if caseFun == 1
    plot(t,x(:,1),'k',t,x(:,2),'r');
    xlabel('time(sec)')
    title('Free System- Solver:ODE45')
    legend('Position(m)','Veloctiy(m/s)');
elseif caseFun==2
    plot(t,x(:,1),'-b',t,x(:,2),'g');
        xlabel('time(s)')
    title('Damped System- Solver:ODE45')
    legend('Position(m)','Veloctiy(m/s)');
elseif caseFun==3
    plot(t,x(:,1),'-b',t,x(:,2),'k');
    xlabel('time(s)')
    title('Damped-Forced System- Solver:ODE45')
    legend('Position(m)','Veloctiy(m/s)');
end
legend('Position(m)','Veloctiy(m/s)');
grid on
%% Solution command
[t,x]=ode23(@fun ,tspan,x0,options,caseFun);
figure(2)
if caseFun == 1
    plot(t,x(:,1),'k',t,x(:,2),'r');
    xlabel('time(sec)')
    title('Free System-Solver:ODE23')
    legend('Position(m)','Veloctiy(m/s)');
elseif caseFun==2
    plot(t,x(:,1),'-b',t,x(:,2),'g');
    xlabel('time(sec)')
    title('Damped System-Solver:ODE23')
    legend('Position(m)','Veloctiy(m/s)');
elseif caseFun==3
    plot(t,x(:,1),'-b',t,x(:,2),'k');
    xlabel('time(sec)')
    title('Damped-Forced System- Solver:ODE23')
    legend('Position(m)','Veloctiy(m/s)');
end
legend('Position(m)','Veloctiy(m/s)');
grid on
%% Solution command
[t,x]=ode15s(@fun ,tspan,x0,options,caseFun);
figure(3)
if caseFun == 1
    plot(t,x(:,1),'k',t,x(:,2),'r');
    xlabel('time(sec)')
    title('Free System-Solver:ODE15s')
    legend('Position(m)','Veloctiy(m/s)');
elseif caseFun==2
    plot(t,x(:,1),'-b',t,x(:,2),'g');
    xlabel('time(sec)')
    title('Damped System-Solver:ODE15s')
    legend('Position(m)','Veloctiy(m/s)');
elseif caseFun==3
    plot(t,x(:,1),'-b',t,x(:,2),'k');
    xlabel('time(sec)')
    title('Damped-Forced System- Solver:ODE15s')
    legend('Position(m)','Veloctiy(m/s)');
end
legend('Position(m)','Veloctiy(m/s)');
grid on
