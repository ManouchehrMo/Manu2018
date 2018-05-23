function [ C ] = CONS( y,model_def )
% this funciton is made to calculate the constraint equations C, jacobian Cq, Cp and G
nb = length(model_def.bodies);  % number of bodies
for i = 1:nb
    xx(1,i) = y(3*i-2);
    yy(1,i) = y(3*i-1);
    phi(1,i) = y(3*i);
    dxx(1,i) = y(3*nb+3*i-2);
    dyy(1,i) = y(3*nb+3*i-1);
    dphi(1,i) = y(3*nb+3*i);
end
%% Calculate the Constraint equation C
nj = length(model_def.Constraint);   % number of joints

for i = 1:nj
    ib = model_def.Constraint(i).ibody;
    jb = model_def.Constraint(i).jbody;
    m = 2*i-1:2*i;
    
    if ib == 0           % left revolute of the body connect with the ground
      C(m,1) = [xx(jb)+model_def.bodies(jb).uix*cos(phi(jb))+model_def.bodies(jb).uiy*sin(phi(jb));
                yy(jb)+model_def.bodies(jb).uix*sin(phi(jb))-model_def.bodies(jb).uiy*cos(phi(jb))];
    elseif jb == 0         % right revolute of the body connect with the ground
        
      C(m,1) = [xx(ib)+model_def.bodies(ib).ujx*cos(phi(ib))-model_def.bodies(ib).ujy*sin(phi(ib));
                yy(ib)+model_def.bodies(ib).ujx*sin(phi(ib))+model_def.bodies(ib).ujy*cos(phi(ib))];
    else               
      C(m,1) = [xx(ib)+model_def.bodies(ib).ujx*cos(phi(ib))-model_def.bodies(ib).ujy*sin(phi(ib))-xx(jb)-model_def.bodies(jb).uix*cos(phi(jb))+model_def.bodies(jb).uiy*sin(phi(jb));
                yy(ib)+model_def.bodies(ib).ujx*sin(phi(ib))+model_def.bodies(ib).ujy*cos(phi(ib))-yy(jb)-model_def.bodies(jb).uix*sin(phi(jb))-model_def.bodies(jb).uiy*cos(phi(jb))]; 
    end    
end

end

