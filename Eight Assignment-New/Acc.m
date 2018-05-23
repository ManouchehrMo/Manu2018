% Function regarding Acceleration

function [ qb ] = Acc( X, system, theta, alfa )

% we define the definition of the system and angles

Ln_bodies = length(system.bodies);   % the number of bodies

M = Mass(system);

%% Constraints

[ CON, Cq, Cp, G ] = Dynamic_Constraint( X, system); 

%% Gravitional force

[ Qg ] = G_F( system );  

[nn,~] = size(Cq);

LHS = [M, Cq'
      Cq, zeros(nn)];

RHS = [Qg
       G - 2*theta*Cp - alfa*alfa*CON];

A = LHS\RHS;

qb = A(1:3*Ln_bodies);

end