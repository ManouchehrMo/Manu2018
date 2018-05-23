clear all
clc
close all

%% Initial values of the system
l1 = 3;
l2 = 4;
l3 = 4.6;
d1 = 0.3;
d2 = 0.2;
phinia1 = 2;
phinia2 = 0.57;
phinia3 = 1.21;
dphinia1 = 6.28;

q0=[phinia1 phinia2 phinia3];
dq0=[dphinia1 0 0];
ddq0=[0 0 0];

%% Solution values
%maximum number of iterations
maxiter=100;
%parameter to establish the convergenvce criteria
epsilon=0.0000001;

cnt = 0;
tini = 0;  %Initial time
dt = 0.00001;  %Time step
tend = 1; %End time
% initial evaluation of constrains
t=0;
C = ConsEqua4Bar(q0,t);
Cq = Jaco4Bar(q0);








set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 8 6]);
plot(tsim,dq(1,:),'LineWidth', 1.5)
hold on
plot(tsim,dq(2,:),'LineWidth', 1.5)
hold on
plot(tsim,dq(3,:),'LineWidth', 1.5)
legend({'input link','coupler','output link'},'FontUnits','points','interpreter','latex','FontSize',8,'FontName','Times','Location','NorthWest')
xlabel('Time s','FontUnits','points','interpreter','latex','FontSize',11,'FontName','Times')
ylabel('Angular Velocity rad/s','FontUnits','points','interpreter','latex','FontSize',11,'FontName','Times')
print -depsc2 angularvelocity.eps
grid on
hold off