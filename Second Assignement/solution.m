tspan=[0 10]; % tspan=[t0 tfinal]
x0=[-1 -1]; % x0 is vector of initial conditions

 %% Free System
 [t,x]=ode45(@free_fun ,tspan,x0);
 %% Plots for Fress System
 figure(1)
plot(t,x(:,1),'k',t,x(:,2),'r'); 
 xlabel('time(sec)')
 title('Free System')
 legend('Position(rad)','Veloctiy(rad/sec)');
 grid on
 %% Damped Systam
 [t,x]=ode45(@damped_fun ,tspan,x0);
 %% Plots For Damped System
  figure(2)
plot(t,x(:,1),'-b',t,x(:,2),'g'); 
 xlabel('time(sec)')
 title('Damped System')
 legend('Position(rad)','Veloctiy(rad/sec)');
 grid on

%% Damped-Forced System
[t,x]=ode45(@forced_fun ,tspan,x0);
%% Plots For Forced System
figure(3)
plot(t,x(:,1),'-b',t,x(:,2),'k'); 
xlabel('time(sec)')
%ylabel('x (rad)')
title('Forced System')
legend('Position','Veloctiy');
grid on


% k=input('for free system please enter 0 and for damped system please write 1');
% switch k
%     case 1
%         [t,x]=ode45(@free_fun ,tspan,x0);
%     case 2
%         [t,x]=ode45(@damped_fun ,tspan,x0);
% end