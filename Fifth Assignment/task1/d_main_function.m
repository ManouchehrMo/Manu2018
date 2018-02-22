function y=d_main_function(t,x)
a=4;
b=1;
y(1,1)=a*(1-x(2));
y(1,2)=-a*x(1);
y(2,1)=b*x(2);
y(2,2)=-b*(1-x(1));
end