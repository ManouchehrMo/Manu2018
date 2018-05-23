function C = C_Eq(X,t)

% Equations regarding Constraints
d_1 = 3; 
d_2 = 4;
d_3 = 4.6;
s_1 = 0.3;
s_2 = 0.2;
al_1 = 2;
dal_1 = 6.28;


theta1 = X(1);
theta2 = X(2);
theta3 = X(3);

C = [d_1*cos(theta1)+d_2*cos(theta2)-d_3*cos(theta3)-s_1;
     d_1*sin(theta1)+d_2*sin(theta2)-d_3*sin(theta3)-s_2;
     theta1-al_1-dal_1*t];

end