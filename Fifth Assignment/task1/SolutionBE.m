%% The solution based on Backward Euler (Method) using Newton-Raphson
close all
clear all
clc

[t,y]=backward_euler(@main_function,@d_main_function,[2,1],0,10,100);

plot(t,y)
grid on