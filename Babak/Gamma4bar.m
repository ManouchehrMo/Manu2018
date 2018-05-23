 function Gamma=Gamma4bar(phi1,phi2,phi3,dphi1,dphi2,dphi3)
L1=80;
L2=260;
L3=180;

L=[L1 L2 L3];
 Gamma=[ L(1)/2*cos(phi1)*dphi1^2;
 L(1)/2*sin(phi1)*dphi1^2;
 L(1)/2*cos(phi1)*dphi1^2+L(2)*cos(phi2)*dphi2^2;
 L(1)/2*sin(phi1)*dphi1^2+L(2)*sin(phi2)*dphi2^2;
L(2)*cos(phi2)*dphi2^2+L(3)/2*cos(phi3)*dphi3^2;
 L(2)*sin(phi2)*dphi2^2+L(3)/2*sin(phi3)*dphi3^2;
 L(3)/2*cos(phi3)*dphi3^2;
 L(3)/2*sin(phi3)*dphi3^2;
 0];