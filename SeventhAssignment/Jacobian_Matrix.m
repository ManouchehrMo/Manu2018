function Cq = Jacobian_Matrix(X,t)

% Data regarding the lenngths and angles for four bar mechanism
d_1 = 3; 
d_2 = 4;
d_3 = 4.6;


theta1 = X(1);
theta2 = X(2);
theta3 = X(3);

Cq = [ -d_1*sin(theta1), -d_2*sin(theta2),  d_3*sin(theta3);
        d_1*cos(theta1),  d_2*cos(theta2), -d_3*cos(theta3);
                    1,              0,             0];
end