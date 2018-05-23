 % four bar mechanism-kinematic analysis
clc
clear
close all
% definig parameters
% X0=[phinia1 phinia2 phinia3];
% dq0=[0 0 0];
% ddq0=[0 0 0];
% d1=0.35;
% d2=0.1;
% L1=80/2.5/10;
% L2=130/2.5/10;
% L3=260/2.5/10;

L1=80;
L2=260;
L3=180;
% Set up the time interval and the initial positions of the nine coordinates
 tspan=0:0.01:5;
%  X0=[0 50 pi/2 125.86 132.55 0.2531 215.86 82.55 4.3026];

   q0=[0 50 pi/2 125.86 132.55 0.2531 215.86 82.55 4.3026];
%   q0=[0   20.0000    0.6283   50.3440   53.0200    0.1012   86.3440   33.0200    1.7210]/10;
 
 global T
 X0=q0;
 % Do the loop for each time interval
 for It=1:length(tspan);
 T=tspan(It);
 % Determine the displacement at the current time
 [Xtemp] = fsolve(@constraint,X0)

 % Determine the velocity at the current time
 phi1=Xtemp(3); phi2=Xtemp(6); phi3=Xtemp(9);
 Cq=Jacobian(phi1,phi2,phi3);
 Beta=[0 0 0 0 0 0 0 0 2*pi]';
 Vtemp=Cq\Beta;

 % Determine the acceleration at the current time
 dphi1=Vtemp(3); dphi2=Vtemp(6); dphi3=Vtemp(9);
 Gamma=Gamma4bar(phi1,phi2,phi3,dphi1,dphi2,dphi3);
 Atemp=Cq\Gamma;

 % Record the results of each iteration
 X(:,It)=Xtemp; V(:,It)=Vtemp; A(:,It)=Atemp;

 % Determine the new initial position to solve the equation of the next
 % iteration and assume that the kinematic motion is with inertia
 if It==1
 X0=X(:,It);
 else
 X0=X(:,It)+(X(:,It)-X(:,It-1));
 end
 end
 % T vs displacement plot for the nine coordinates
figure
for i=1:9;
%  subplot(9,1,i)
 plot (tspan,X(i,:))
 set(gca,'xtick',[], 'FontSize', 5)
end
% Reset the bottom subplot to have xticks
set(gca,'xtickMode', 'auto')

% T vs velocity plot for the nine coordinates
figure
% for i=1:9;
    hold on
%  subplot(9,1,i)
grid on
 plot (tspan,V(3,:),'LineWidth', 1.25)
  hold on
  plot (tspan,V(6,:),'LineWidth', 1.25)
  hold on
  plot (tspan,V(9,:),'LineWidth', 1.25)
  hold on
set(gca,'Units','normalized','FontUnits','points','FontWeight','normal','FontSize',12,'FontName','Times')
 legend({'Cranck','Coupler','Rocker'},'FontUnits','points','interpreter','latex','FontSize',11,'FontName','Times','Location','NorthWest')
xlabel('Time $$[sec]$$','FontUnits','points','interpreter','latex','FontWeight','bold','FontSize',11,'FontName','Times')
ylabel('Angular Velocity $$[m]$$','FontUnits','points','interpreter','latex','FontSize',11,'FontName','Times','Fontweight','bold')
print -depsc2 plot1.eps
print -dpdf plot1.pdf
% set(gca,'xtickMode', 'auto') 
% end


% T vs acceleration plot for the nine coordinates
figure
for i=1:9;
%  subplot(9,1,i)
 plot (tspan,A(i,:))
 AxeSup=max(A(i,:));
 AxeInf=min(A(i,:));
 if AxeSup-AxeInf<0.01
 axis([-inf,inf,(AxeSup+AxeSup)/2-0.1 (AxeSup+AxeSup)/2+0.1]);
 end
 set(gca,'xtick',[], 'FontSize', 5)
end
% legend({'input link','coupler','output link'},'FontUnits','points','interpreter','latex','FontSize',8,'FontName','Times','Location','NorthWest')
% xlabel('Time s','FontUnits','points','interpreter','latex','FontSize',11,'FontName','Times')
% ylabel('Angular Velocity rad/s','FontUnits','points','interpreter','latex','FontSize',11,'FontName','Times')
% print -depsc2 angularvelocity.eps
% set(gca,'xtickMode', 'auto') 
% Determine the positions of the four revolute joints at each iteration
Ox=zeros(1,length(tspan));
Oy=zeros(1,length(tspan));
Ax=L1*cos(X(3,:));
Ay=L2*sin(X(3,:));
Bx=Ax+L2*cos(X(6,:));
By=Ay+L2*sin(X(6,:));
Cx=L3*ones(1,length(tspan));
Cy=zeros(1,length(tspan));

% Animation
figure
for t=1:length(tspan);
 bar1x=[Ox(t) Ax(t)];
 bar1y=[Oy(t) Ay(t)];
 bar2x=[Ax(t) Bx(t)];
 bar2y=[Ay(t) By(t)];
 bar3x=[Bx(t) Cx(t)];
 bar3y=[By(t) Cy(t)];

 plot (bar1x,bar1y,bar2x,bar2y,bar3x,bar3y);
 axis([-120,400,-120,200]);
 axis normal

 M(:,t)=getframe;
end
