function [ M ] = massMatrix( m )

type=body.type;

Ic = 1/12 * m * L * L;

M=diag([m,m,Ic]);

end