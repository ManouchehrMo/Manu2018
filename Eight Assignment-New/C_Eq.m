% Function regaring constraint equations

function [ CON_Def ] = C_Eq( x1, y1, phi1, x2, y2, phi2, u1_1, u1_2, u2_1, u2_2)

   
CON1 = x1+u1_1*cos(phi1)-u1_2*sin(phi1)-x2-u2_1*cos(phi2)+u2_2*sin(phi2);

CON2 = y1+u1_1*sin(phi1)+u1_2*cos(phi1)-y2-u2_1*sin(phi2)-u2_2*cos(phi2);

%% The constraints definition
CON_Def = [CON1 
    CON2];

end