function [dy,dv] = M_S(t,y,v,m,k)

% Function of the mass and spring

dy=v;             %% velocity 
dv=(-k/m)*y;      %% accelation 

end