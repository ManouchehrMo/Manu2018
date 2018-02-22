function yp=main_function(t,y)
a=4;
b=1;

yp(1)=a*(y(1)-y(1)*y(2)); %yp=x''
yp(2)=-b*(y(2)-y(1)*y(2)); % yp=theta''
end