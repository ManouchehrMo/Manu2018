function [ C, Cq] = constraints(model_def)


 r1 = [0;L/2]; fi1 = 0;
 
 r2 = [0;L/2]; fi2 = 0;
 
 r3 = [0;L/2]; fi3 = pi/2;
 
 r4 = [0;L/2]; fi4 = -pi;


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
end

function A = rot(fi)
c = cos(fi);
s = sin(fi);
A = [c, -s
    s, c];
end