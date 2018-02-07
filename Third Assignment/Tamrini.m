%% Symbolic toolbox tutorial - in appliction to SDOF systems
% Open help for symbolic toolbox.

%% Define symbolic variables
%%
clear
close all
clc
syms m k c real
assumeAlso(m > 0);
assumeAlso(k > 0);
assumeAlso(c > 0);
syms zeta
k=100;
m=1;
oms = sqrt(k/m);
%zeta=0;
c=2*m*oms*zeta;
%% External Force
syms F0 w
F0=1;
%% Making the Equation
syms t A B
xs(t)=A*sin(w*t)+B*cos(w*t);
F(t)=F0*cos(w*t);
% xp = diff(xs, t);
% xpp = diff(xp, t);
% eq=m*xpp+c*xp+k*xs-F(t);

%%

A=(F0*c*w)/((k-m*w^2)^2+(c*w)^2);
B=F0*(k-m*w^2)/((k-m*w^2)^2+(c*w)^2);
w=0:0.01:25;
a=(k-m*w.^2).^2;
b=(c*w).^2;
X=(F0)./(sqrt(a+b));
%%
X0=F0/k;
r=w/oms;
%%
M=X/X0;
%for i=0.1:0.1:1
M1=subs(M,zeta,0.1);
M2=subs(M,zeta,0.2);
M3=subs(M,zeta,0.3);
M4=subs(M,zeta,0.4);
M5=subs(M,zeta,0.5);
M6=subs(M,zeta,0.6);
M7=subs(M,zeta,0.7);
M8=subs(M,zeta,0.8);
M9=subs(M,zeta,0.9);
M10=subs(M,zeta,1e-2);
plot(r,M1,'b',r,M2,'k',r,M3,'g',r,M4,'c',r,M5,'r',r,M6,'y',r,M7,'m',r,M8,':k',r,M9,'-r',r,M10,'-k')
axis([0 2.5 0 5.5])
grid on
xlabel('Frequency Ratio (r)')
ylabel('Amplitude(M)')

 






















% % % % %%
% % % % solution = dsolve(eq == 0);
% % % % solution = subs(solution, oms, w);
% % % % disp(solution)
% % % % % display equation variables
% % % % symvar(solution)
% % % % %% Plot solution
% % % % %%
% % % % figure
% % % % %fplot(subs(solution, w,2), [0, 10])
% % % % fplot(solution)
% % % % grid on
% % % % %% Get numerical solution
% % % % %%
% % % % tsol = linspace(0, 15, 15*20);
% % % % xsol = subs(solution, [w, t], {sqrt(10/1), tsol});
% % % % vsol = subs(diff(solution, t), [w, t], {sqrt(10/1), tsol});
% % % % %% Animate solution
% % % % %%
% % % % % animate_sdof(tsol, double(xsol), double(vsol))
% % % % 
% % % % %% Substitutions
% % % % % Knowing that $c_c=2 \sqrt(km)$ is critical damping and damping ratio is $\zeta=c/c_c$:
% % % % %%
% % % % syms cc real
% % % % 
% % % % solution= simplify(expand(subs(subs(simplify(subs(subs(solution, 4*k*m, cc*cc), c, zeta*cc)),cc,2*sqrt(k*m)),sqrt(k/m),w)));
% % % % disp(solution)
% % % % pretty(solution)
% % % % 
% % % % %% Get numerical solution
% % % % %%
% % % % zeta_num = 1.1;
% % % % tsol = linspace(0, 15, 15*20);
% % % % xsol = subs(solution_damped_rewrite, [A, omega, t, zeta], {-0.5, 2*pi, tsol, zeta_num});
% % % % vsol = subs(diff(solution_damped_rewrite, t), [A, omega, t, zeta], {-0.5, 2*pi, tsol, zeta_num});
% % % % %% Animate solution
% % % % %%
% % % % animate_sdof(tsol, double(xsol), double(vsol))