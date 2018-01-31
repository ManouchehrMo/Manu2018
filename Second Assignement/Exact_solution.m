syms p;
p=dsolve('D2j+2*Dj+100*j=0','Dj(0)=-1','j(0)=-1');
pretty(p);
v=0:0.01:10;
xn=double(subs(p,v));
axis([0 10 0 6])
plot(v,xn)
grid on