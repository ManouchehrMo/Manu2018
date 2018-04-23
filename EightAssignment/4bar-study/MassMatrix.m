function [ M ] = MassMatrix( m, L )
% To find a mass matrix of a rigid body

Ic = 1/12 * m * L * L;

M = diag([m, m, Ic, m, m, Ic, m, m, Ic,m, m, Ic]);

end