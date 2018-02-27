function dx = SpringMass(t,x,m,k)

dx=zeros(2,1);

dx (1)= x(2);

dx(2)=(-k/m)*x(1);

end