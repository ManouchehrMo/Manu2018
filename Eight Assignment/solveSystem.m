function result = solveSystem(model_def, settings)

no_bodies = length(model_def.bodies);

np = 4*no_bodies;

p = zeros(np, 1);
Mp = zeros(np, np);
Qg = zeros(np, 1);
Lbody = zeros(no_bodies, 1);

% check if there is gravitational force
g = [0; 0];
no_forces = length(model_def.forces);
for i = 1:no_forces
    if strcmp(model_def.forces(i).type, 'gravitational')
        g = model_def.forces(i).g;
        model_def.forces(i) = [];
       end
end


% run ode
if ~strcmp(settings.method.type, 'baumgarte')
    error('Only can solve using Baumgarte method');
end
