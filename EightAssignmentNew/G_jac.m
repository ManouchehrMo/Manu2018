function [ G ] = G_jac( y, model_def )

nj = length(model_def.Constraint);
nb = length(model_def.bodies);
for i = 1:nb
    xx(1,i) = y(3*i-2);
    yy(1,i) = y(3*i-1);
    phi(1,i) = y(3*i);
    dxx(1,i) = y(3*nb+3*i-2);
    dyy(1,i) = y(3*nb+3*i-1);
    dphi(1,i) = y(3*nb+3*i);
end

%% Calculate G=jacobian(Cq*dq,q)*dq
for i = 1:nj
    ib = model_def.Constraint(i).ibody;
    jb = model_def.Constraint(i).jbody;
    m = 2*i-1:2*i;    
    if ib == 0           % left revolute of the body connect with the ground
      G(m,1) = -[-dphi(jb)*dphi(jb)*model_def.bodies(jb).uix*cos(phi(jb))-dphi(jb)*dphi(jb)*model_def.bodies(jb).uiy*sin(phi(jb));
                 -dphi(jb)*dphi(jb)*model_def.bodies(jb).uix*sin(phi(jb))+dphi(jb)*dphi(jb)*model_def.bodies(jb).uiy*cos(phi(jb))];
    elseif jb == 0         % right revolute of the body connect with the ground
        
      G(m,1) = -[-dphi(ib)*dphi(ib)*model_def.bodies(ib).ujx*cos(phi(ib))+dphi(ib)*dphi(ib)*model_def.bodies(ib).ujy*sin(phi(ib));
                 -dphi(ib)*dphi(ib)*model_def.bodies(ib).ujx*sin(phi(ib))-dphi(ib)*dphi(ib)*model_def.bodies(ib).ujy*cos(phi(ib))];
    else               
      G(m,1) = -[-dphi(ib)*dphi(ib)*model_def.bodies(ib).ujx*cos(phi(ib))-dphi(ib)*dphi(ib)*model_def.bodies(ib).ujy*sin(phi(ib))-dphi(jb)*dphi(jb)*model_def.bodies(jb).uix*cos(phi(jb))-dphi(jb)*dphi(jb)*model_def.bodies(jb).uiy*sin(phi(jb));
                 -dphi(ib)*dphi(ib)*model_def.bodies(ib).ujx*sin(phi(ib))-dphi(ib)*dphi(ib)*model_def.bodies(ib).ujy*cos(phi(ib))-dphi(jb)*dphi(jb)*model_def.bodies(jb).uix*sin(phi(jb))-dphi(jb)*dphi(jb)*model_def.bodies(jb).uiy*cos(phi(jb))]; 
    end  


end

