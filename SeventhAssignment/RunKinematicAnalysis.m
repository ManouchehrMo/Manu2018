%% Task 7 - Kinematic Analysis

clear all ; close all ; clc

d_1 = 3; % Initial values
d_2 = 4;
d_3 = 4.6;

s_1 = 0.3;
s_2 = 0.2;

al_1 = 2;
al_2 = 0.57;
al_3 = 1.21;

dal_1 = 6.28;

q0=[al_1 al_2 al_3];
dq0=[dal_1 0 0];
qpp0=[0 0 0];

max_it=5e1; % number of iterations

Eps=10e6;  % Convergency of establishing

c_0 = 0;
t_0 = 0;

tspan = 0.00001;   %%% time steps
E_t = 1;           %%% End time

t=0;
CON = C_Eq(q0,t);
Cq = Jacobian_Matrix(q0);

q(:,1)=q0;  % Initial values
vel(:,1)=dq0;
ddq(:,1)=qpp0;
t_ite(1)=t_0;

for t = t_0:tspan:E_t
    
    c_0 = c_0+1; %Column counter to form the result matrix.
    no_lo=0; % Number of loops
    nconverg=0;
    
    while no_lo<max_it
        
% Newton Difference and we have updating for the joints
        delta_q = -Cq^(-1)*CON;
        
        q(:,c_0)=q(:,c_0)+delta_q;
        
        no_lo=no_lo+1;
        nconverg=nconverg+1;
        
        maxdx=max(abs(delta_q)); % Convergency
        if maxdx<Eps
            no_lo=max_it;
        end
% After iterations we have update for the constraints and the Jacobian Matrix
        upd=q(:,c_0);
        
        CON = C_Eq(upd,t);
        
        Cq = Jacobian_Matrix(upd);
        t_ite(c_0+1)=t;
        
    end
    
    q(:,c_0+1)=q(:,c_0);
    q;
    nconverg;
    
    Ct = [0 0 6.28]';
    
    vel(:,c_0) = Cq^(-1)*-Ct;     % Velocity
    vel(:,c_0+1) = vel(:,c_0);    % Velocity
    
% Accelerations
    acc = vel(:,c_0);
    Ctt = [0 0 0]';
    Cqqq = C_qp(upd,acc,t);
    
    Cqt = [0 0 0]';
    
    ddq(:,c_0)=Cq^(-1)*(-Ctt-Cqqq-Cqt);
    
    ddq(:,c_0+1)=vel(:,c_0);
end


%% Plotting the system

plot(t_ite,vel(1,:),'k','LineWidth', 1.7)
hold on
plot(t_ite,vel(2,:),'r','LineWidth', 1.7)
hold on
plot(t_ite,vel(3,:),'b','LineWidth', 1.7)
grid on


