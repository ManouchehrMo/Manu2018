function xp = system_eq (t,x)
m1= 2   ;
m2= 1.5 ;
m3= 1   ;
k1=20000;
k2=15000;
k3=10000;

M=[m1 0 0;0 m2 0;0 0 m3];
K=[k1+k2 -k2 0;-k2 k2+k3 -k3;0 -k3 k3];

X=[x(1);x(2);x(3)];
eom=M\(-K*X);

xp(1)=  x(4);
xp(2)=  x(5);
xp(3)=  x(6);
xp(4)=eom(1);
xp(5)=eom(2);
xp(6)=eom(3);
xp=xp(:);