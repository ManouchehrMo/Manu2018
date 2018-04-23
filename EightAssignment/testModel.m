%% define model using our assumptions

% So create model - for tests - single pendulum under gravity forces


m=1;
L=1;
% model definition
body1.type = 'slender_link';
body1.pos =[0 L/2 0]; 
body1.m = m;
body1.L= L; 

body2.type = 'slender_link';
body2.pos =[0 L/2 pi/2]; 
body2.m = m;
body2.L= L; 

body3.type = 'slender_link';
body3.pos =[0 L/2 -pi]; 
body3.m = m;
body3.L= L; 

model_def.bodies = [body1,body2,body3];


joint1.type = 'revolute';
joint1.ibody = 0;
joint1.jbody = 1;
joint1.pos = [[0;0],[-L/2;0]];

joint2.type = 'revolute';
joint2.ibody = 1;
joint2.jbody = 2;
joint2.pos = [[L/2;0],[-L/2;0]];

joint3.type = 'revolute';
joint3.ibody = 2;
joint3.jbody = 3;
joint3.pos = [[L/2;0],[-L/2;0]];

joint4.type = 'revolute';
joint4.ibody = 3;
joint4.jbody = 0;
joint4.pos = [[L/2;0],[3*L;0]];

model_def.joints = [joint1,joint2,joint3,joint4];


force1.type = 'gravitational';
force1.g = [0; -9.81];

model_def.forces = force1;

model_def.constraints = [];

% simulation settings
settings.tspan = linspace(0, 1, 101);
settings.method.type = 'baumgarte';
settings.method.alfa = 1;
settings.method.beta = 1;
settings.ode.solver = 'ode45';
settings.ode.abstol = 1e-7;
settings.ode.reltol = 1e-4;

%% Solution

result = solveSystem(model_def, settings);
plot(result.T, result.P(:, 3:4))
grid on