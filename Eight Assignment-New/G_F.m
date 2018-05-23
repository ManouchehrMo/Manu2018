% Function regarding gravitational force

function [ Qg ] = G_F( system )

n = length(system.bodies);  

for i = 1:n
    Q = [0
        system.bodies(i).m*system.g
         0];  
    Qg(3*i-2:3*i,1) = Q;
end


end