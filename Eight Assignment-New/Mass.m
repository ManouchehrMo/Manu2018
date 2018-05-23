% General function regarding the mass definition


function [ MASSES ] = Mass( mass_def );

n = length(mass_def.bodies);

%% Mass definition 

MASSES = zeros(3*n); 

for i = 1:n
    Ic(i) = 1/12 * mass_def.bodies(i).m * mass_def.bodies(i).l * mass_def.bodies(i).l;
    
    M = diag([mass_def.bodies(i).m, mass_def.bodies(i).m, Ic(i)]); 
    
    MASSES(3*i-2:3*i,3*i-2:3*i) = M;
end

end