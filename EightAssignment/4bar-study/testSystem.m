
%% define
m = 2;
L = 1;

g = [0; -9.81];

M = MassMatrix(m, L);
Qg = GravForces(m ,g);

%% task 2 - solve this system

odefun = @(t, y) [y(13:24); M\Qg];

q0 = [L/2;0;0; 3*L/2;0;0; 5*L/2;0;0; 7*L/2;0;0];
qp0 = zeros(size(q0));

y0 = [q0; qp0];

tspan = linspace(0, 1, 1001);

[T, Y] = ode45(odefun, tspan, y0);

%% verify task 3 using symbolic computations - task 4
syms sL real    % sL is symbolic length.
sy = sym('y', [24, 1]); % symbolic vector.
[ C, Cq, Cp, G ] = Constraints( sy, sL );

tCq = jacobian(C, sy(1:12)); % tCq= test Cq. q is the first 6 coordinates(1:6)
disp(simplify(tCq - Cq)) % to test we will find the difference between these two. 

tCp = tCq*sy(13:24); % test Cp
disp(simplify(tCp - Cp))

tG = -jacobian(tCp, sy(1:12)) * sy(13:24); % test gamma
disp(simplify(tG - G))

%% task 6 - solve MBD system
alfa = 1;
beta = 1;

odefun2 = @(t, y) [y(13:24)
    AccSystem( y, m, L, g, alfa, beta )];

[T, Y] = ode45(odefun2, tspan, y0);

plot(T, Y(:, 2), T, Y(:, 5));