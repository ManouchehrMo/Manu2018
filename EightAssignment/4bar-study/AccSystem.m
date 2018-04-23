function [ qb ] = AccSystem( y, m, L, g, alfa, beta )
% this is the direct solution for the baumgart equation.
M = MassMatrix(m, L);
[ C, Cq, Cp, G ] = Constraints( y, L );
[ Qg ] = GravForces( m, g );

LHS = [M, Cq'
    Cq, zeros(8)];

RHS = [Qg
    G - 2*alfa*Cp - beta*beta*C];

x = LHS\RHS; % x=[qpp; Lambda]

qb = x(1:12);
end
