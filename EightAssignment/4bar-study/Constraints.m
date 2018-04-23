function [ C, Cq, Cp, G ] = Constraints( y, L )

 r1 = y(1:2); fi1 = y(3);
 
 r2 = y(4:5); fi2 = y(6);
 
 r3 = y(7:8); fi3 = y(9);
 
 r4 = y(10:11); fi4 = y(12);



A1 = rot(fi1);
A2 = rot(fi2);
A3 = rot(fi3);
A4 = rot(fi4);

u1_1 = [ -L/2; 0 ]; % u1_1= first joint for the first body
u2_1 = [ L/2;0 ]; % u2_1= second joint for the first body
u2_2= [ -L/2;0 ];
u3_2= [ L/2; 0 ];
u3_3= [ -L/2;0 ];
u4_3= [ L/2; 0 ];
u4_4= [ -L/2;0 ];

C = [r1 + A1*u1_1
    r1 + A1*u2_1 - r2 - A2*u2_2
    r2+A2*u3_2-r3-A3*u3_3
    r3+A3*u4_3-r4-A4*u4_4];

I2 = eye(2);
Om = [0, -1; 1, 0]; % omega matrice 
Cq = [I2, Om*A1*u1_1, zeros(2, 9)
    I2, Om*A1*u2_1, -I2, -Om*A2*u2_2,zeros(2,6)
    zeros(2,3),I2,Om*A2*u3_2,-I2,-Om*A3*u3_3,zeros(2,3)
    zeros(2,6),I2,Om*A3*u4_3,-I2,-Om*A4*u4_4];

qp = y(13:24);

Cp = Cq*qp;
fi1p = qp(3);
fi2p = qp(6);
fi3p = qp(9);
fi4p = qp(12);

G = -[-A1*u1_1*fi1p*fi1p
    -A1*u2_1*fi1p*fi1p+A2*u2_2*fi2p*fi2p
    -A2*u3_2*fi2p*fi2p+A3*u3_3*fi3p*fi3p
    -A3*u4_3*fi3p*fi3p+A4*u4_4*fi4p*fi4p]; % gamma=-((cq*qp)_q)*qp-2*(c_qt)*(qp)-(C_tt).

end

function A = rot(fi)
c = cos(fi);
s = sin(fi);
A = [c, -s
    s, c];
end