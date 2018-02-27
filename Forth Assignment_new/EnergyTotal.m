% Energy calculation Kinetic / potential / total
% This code works based on result of ode45 for mass-spring system with 3DOF, as Y1 and t1

T=t1;
Y1=x3;  %  Ode45  solver
Y2=x4;  %  Ode15s solver
Y3=x1;  %  RK4    solver


for i=1:length(T)
E_kin(i) = 0.5*(m1*(Y1(i,4)^2))+0.5*(m2*(Y1(i,5))^2)+0.5*(m3*(Y1(i,6))^2);
E_pot(i) = 0.5*(k1*(Y1(i,1)^2))+0.5*(k2*(Y1(i,2)-Y1(i,1))^2)+0.5*(k3*(Y1(i,3)-Y1(i,2))^2);
E_tot(i) = E_kin(i)+ E_pot(i);
end

for i=1:length(T)
E_kin(i) = 0.5*(m1*(Y2(i,4)^2))+0.5*(m2*(Y2(i,5)-Y2(i,4))^2)+0.5*(m3*(Y2(i,6)-Y2(i,5))^2);
E_kin2(i) = 0.5*(m1*(Y2(i,4)^2))+0.5*(m2*(Y2(i,5))^2)+0.5*(m3*(Y2(i,6))^2);
E_pot2(i) = 0.5*(k1*(Y2(i,1)^2))+0.5*(k2*(Y2(i,2)-Y2(i,1))^2)+0.5*(k3*(Y2(i,3)-Y2(i,2))^2);
E_tot2(i) = E_kin2(i)+ E_pot2(i);
end
 
for i=1:length(T)
E_kin(i) = 0.5*(m1*(Y3(i,4)^2))+0.5*(m2*(Y3(i,5)-Y3(i,4))^2)+0.5*(m3*(Y3(i,6)-Y3(i,5))^2);
E_kin3(i) = 0.5*(m1*(Y3(i,4)^2))+0.5*(m2*(Y3(i,5))^2)+0.5*(m3*(Y3(i,6))^2);
E_pot3(i) = 0.5*(k1*(Y3(i,1)^2))+0.5*(k2*(Y3(i,2)-Y3(i,1))^2)+0.5*(k3*(Y3(i,3)-Y3(i,2))^2);
E_tot3(i) = E_kin3(i)+ E_pot3(i);
end

set(gcf, 'PaperUnits', 'centimeters');
set(gcf, 'PaperPosition', [0 0 10 7]);
plot(1:length(T),E_tot,'-r','LineWidth', 1.3)
hold on
plot(1:length(T),E_tot2,'-k','LineWidth', 1.3)
plot(1:length(T),E_tot3,'-b','LineWidth', 1.3)
axis([0,1000,2930,3000]);
grid on
print -depsc2 myplot1.eps
