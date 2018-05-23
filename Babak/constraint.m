 function C=constraint(X)

 global T

L1=80;
L2=260;
L3=180;
L=[L1 L2 L3];
 x1=X(1); y1=X(2); phi1=X(3);
 x2=X(4); y2=X(5); phi2=X(6);
 x3=X(7); y3=X(8); phi3=X(9);

 C=[ -x1+L(1)/2*cos(phi1);
 -y1+L(1)/2*sin(phi1);
 x1+L(1)/2*cos(phi1)-x2+130*cos(phi2);
 y1+L(1)/2*sin(phi1)-y2+130*sin(phi2);
 x2+L(2)/2*cos(phi2)-x3+90*cos(phi3);
 y2+L(2)/2*sin(phi2)-y3+90*sin(phi3);
 x3+L(3)/2*cos(phi3)-180;
 y3+L(3)/2*sin(phi3);
 phi1-2*pi*T-pi/2];
 