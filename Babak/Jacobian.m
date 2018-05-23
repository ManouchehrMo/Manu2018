function Cq=Jacobian(phi1,phi2,phi3)

L1=80;
L2=260;
L3=180;

L=[L1 L2 L3];
 Cq=[ -1 0 -L(1)*sin(phi1) 0 0 0 0 0 0;
 0 -1 L(1)/2*cos(phi1) 0 0 0 0 0 0;
 1 0 -L(1)/2*sin(phi1) -1 0 -L(2)*sin(phi2) 0 0 0;
 0 1 L(1)/2*cos(phi1) 0 -1 L(2)*cos(phi2) 0 0 0;
 0 0 0 1 0 -L(2)/2*sin(phi2) -1 0 -L(3)*sin(phi3);
 0 0 0 0 1 L(2)/2*cos(phi2) 0 -1 L(3)*cos(phi3);
 0 0 0 0 0 0 1 0 -L(3)/2*sin(phi3);
 0 0 0 0 0 0 0 1 L(3)/2*cos(phi3);
 0 0 1 0 0 0 0 0 0];