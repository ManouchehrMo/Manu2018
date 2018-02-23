clc
m=5;
k=100;
syms x
xd=diff(x);
Eq=0.5*m*(xd^2)+0.5*k*(x.^2);
fplot(x,Eq)
xlabel('Position,m')
ylabel('Total energy,J')
grid on

