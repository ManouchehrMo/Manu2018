clear all
close all

tspan=0:1e-2:5;

dt=1e-5;
tk=5;

dt1=1e-4;
tk1=5;

dt2=1e-6;
tk2=5;

m = 1;
k =50;
x0=[0.5 1];
y0=[0.2 1];
fun_g = @(t,x) x;
fun_f = @(t,y) (-k/m)*y;

%% SOlving the Equations

[t1,x1]    = odeRK4(@(t,x) SpringMass(t,x,m,k),[dt tk],x0);
x1= x1(1,:)';

[t2,x2,y2] = odeSIE(fun_g, fun_f ,[dt tk] ,x0,y0);
x2= x2(1,:)';

[t3,x3]    = odeFE(@(t,x) SpringMass(t,x,m,k),[dt tk] ,x0);
x3= x3(1,:)';

[t4,x4]    = odeFE(@(t,x) SpringMass(t,x,m,k),[dt1 tk1] ,x0);
x4= x4(1,:)';

[t5,x5]    = odeFE(@(t,x) SpringMass(t,x,m,k),[dt2 tk2] ,x0);
x5= x5(1,:)';

T.E1= (1/2)*k*(x3).^2+(1/2)*m*(x3(2,:)).^2;
T.E2= (1/2)*k*(x4).^2+(1/2)*m*(x4(2,:)).^2;
T.E3= (1/2)*k*(x5).^2+(1/2)*m*(x4(2,:)).^2;

%% Plotting the solution
%%

figure (1)
plot (t2,x2);
ylabel({'Position (m)'},'FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times New Roman','LineWidth',2)
xlabel({'Time (s)'},'FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times New Roman','LineWidth',2)
title('Position vs Time','FontUnits','points','FontWeight','normal','FontSize',12,'FontName','Times New Roman','LineWidth',2)

figure (2)
plot (t1,x1,t2,x2,t3,x3);
ylabel({'Position (m)'},'FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times New Roman','LineWidth',2)
xlabel({'Time (s)'},'FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times New Roman','LineWidth',2)
title('Position vs Time','FontUnits','points','FontWeight','normal','FontSize',12,'FontName','Times New Roman','LineWidth',2)

figure (3)
plot (t3,x3,t4,x4,t5,x5);
ylabel({'Position (m)'},'FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times New Roman','LineWidth',2)
xlabel({'Time (s)'},'FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times New Roman','LineWidth',2)
title('Position vs Time','FontUnits','points','FontWeight','normal','FontSize',12,'FontName','Times New Roman','LineWidth',2)



figure (4)
plot(t3,T.E1,t4,T.E2,t5,T.E3)
ylabel({'Energy (J)'},'FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times New Roman','LineWidth',2)
xlabel({'Time (s)'},'FontUnits','points','interpreter','latex','FontSize',12,'FontName','Times New Roman','LineWidth',2)
title('Energy vs Time','FontUnits','points','FontWeight','normal','FontSize',12,'FontName','Times New Roman','LineWidth',2)