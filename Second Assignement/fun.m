function [xprime]=fun(t,x,caseFun)

% the main function is mx''+cx'+kx=f(t)
% we defined m=1 kg, k=150 N/m for all cases.
%[x'; x'']=[0 1; -100 0][x; x']+[0; 0]f(t)
%% For Free System
% Damping coefficient is c= 0
% There is no force on free system, so f(t)=0
% The equation is like: x''(t)+100x(t)=0
%% For Damped System
% There is no force on damped system, so f(t)=0
% The equation is like: x''(t)+0.8x'(t)+100x(t)=0
%% For Damped-Forced System
% The force on forced-damped system is f(t)=asin(wt*t)
% The equation is like: x''(t)+0.8x'(t)+100x(t)=f(t)
% a=5 and the w=2*t+1

if caseFun > 3 || caseFun < 1
    caseFun =1;
end

if caseFun == 1
        f=0;
        A=[0 1;-100 0];
        B=[0 0]';
elseif caseFun==2
    f=0;
    % Natural frequency is omega_n=(k/m)^1/2
    % Damped frequency is omega_d=omega_n(1-zeta^2)^1/2
    % to calculate the damping coeficient, we have to have zeta.
    % c=2*zeta*omega_n*m
    zeta=0.1;  
    omega_n=10; % natural frequency
    m=1; % mass
    c=2*m*zeta*omega_n;
    A=[0 1;-100 -c];
    B=[0 1]';
    
elseif caseFun==3
    a=5; % domain of the force function
    zeta=0.1;  
    omega_n=10; % natural frequency
    omega_d=omega_n*sqrt(1-zeta^2);
    w=(omega_d*t)/4;
    m=1; % mass
    c=2*m*zeta*omega_n;
    % The forced function is as below
    f=-a*sin(w*t);
    A=[0 1;-100 -c];
    B=[0 1]';
    end 

xprime=A*x+B*f;
        


