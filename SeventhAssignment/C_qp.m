function C_Priimeqq = C_qp(X,dX,t)

l1 = 3;
l2 = 4;
l3 = 4.6;

theta1 = X(1);
theta2 = X(2);
theta3 = X(3);
dtheta1 = dX(1);
dtheta2 = dX(2);
dtheta3 = dX(3);

C_Priimeqq = [- l1*cos(theta1)*dtheta1^2 - l2*cos(theta2)*dtheta2^2 + l3*cos(theta3)*dtheta3^2;
        - l1*sin(theta1)*dtheta1^2 - l2*sin(theta2)*dtheta2^2 + l3*sin(theta3)*dtheta3^2; 
                                                                                       0];

end