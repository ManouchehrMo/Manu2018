function [ Cq, Cp  ] = C_q( y, model_def )
nb = length(model_def.bodies);  % number of bodies
%% Calculate the Jacobian equation Cq=jacobian(C,q)
%Cq = zeros(2*jb,3*nb);
nj = length(model_def.Constraint); 
for i = 1:nb
    xx(1,i) = y(3*i-2);
    yy(1,i) = y(3*i-1);
    phi(1,i) = y(3*i);
    dxx(1,i) = y(3*nb+3*i-2);
    dyy(1,i) = y(3*nb+3*i-1);
    dphi(1,i) = y(3*nb+3*i);
end
for i = 1:nj
    ib = model_def.Constraint(i).ibody;
    jb = model_def.Constraint(i).jbody;
    m = 2*i-1:2*i;

    if ib == 0           % left revolute of the body connect with the ground
      Cq(m,3*jb-2:3*jb) = [1 0 -model_def.bodies(jb).uix*sin(phi(jb))+model_def.bodies(jb).uiy*cos(phi(jb));
                           0 1 model_def.bodies(jb).uix*cos(phi(jb))+model_def.bodies(jb).uiy*sin(phi(jb))];
    elseif jb == 0         % right revolute of the body connect with the ground       
      Cq(m,3*ib-2:3*ib) = [1 0 -model_def.bodies(ib).ujx*sin(phi(ib))-model_def.bodies(ib).ujy*cos(phi(ib));
                           0 1 model_def.bodies(ib).ujx*cos(phi(ib))-model_def.bodies(ib).ujy*sin(phi(ib))];
    else    
      Cq(m,3*ib-2:3*ib) = [1 0 -model_def.bodies(ib).ujx*sin(phi(ib))-model_def.bodies(ib).ujy*cos(phi(ib));
                           0 1 model_def.bodies(ib).ujx*cos(phi(ib))-model_def.bodies(ib).ujy*sin(phi(ib))];
      Cq(m,3*jb-2:3*jb) = [-1 0 model_def.bodies(jb).ujx*sin(phi(jb))-model_def.bodies(jb).ujy*cos(phi(jb));
                           0 -1 -model_def.bodies(jb).ujx*cos(phi(jb))+model_def.bodies(jb).ujy*sin(phi(jb))];                    
    end


end
    
%% Calculate the Jacobian equation Cp=Cq*qp   
qp = y(3*nb+1:6*nb);
Cp = Cq*qp;


%% Calculate G=jacobian(Cq*dq,q)*dq
% % % % for i = 1:nj
% % % %     ib = model_def.joints(i).ibody;
% % % %     jb = model_def.joints(i).jbody;
% % % %     m = 2*i-1:2*i;    
% % % %     if ib == 0           % left revolute of the body connect with the ground
% % % %       G(m,1) = -[-dphi(jb)*dphi(jb)*model_def.bodies(jb).uix*cos(phi(jb))-dphi(jb)*dphi(jb)*model_def.bodies(jb).uiy*sin(phi(jb));
% % % %                  -dphi(jb)*dphi(jb)*model_def.bodies(jb).uix*sin(phi(jb))+dphi(jb)*dphi(jb)*model_def.bodies(jb).uiy*cos(phi(jb))];
% % % %     elseif jb == 0         % right revolute of the body connect with the ground
% % % %         
% % % %       G(m,1) = -[-dphi(ib)*dphi(ib)*model_def.bodies(ib).ujx*cos(phi(ib))+dphi(ib)*dphi(ib)*model_def.bodies(ib).ujy*sin(phi(ib));
% % % %                  -dphi(ib)*dphi(ib)*model_def.bodies(ib).ujx*sin(phi(ib))-dphi(ib)*dphi(ib)*model_def.bodies(ib).ujy*cos(phi(ib))];
% % % %     else               
% % % %       G(m,1) = -[-dphi(ib)*dphi(ib)*model_def.bodies(ib).ujx*cos(phi(ib))-dphi(ib)*dphi(ib)*model_def.bodies(ib).ujy*sin(phi(ib))-dphi(jb)*dphi(jb)*model_def.bodies(jb).uix*cos(phi(jb))-dphi(jb)*dphi(jb)*model_def.bodies(jb).uiy*sin(phi(jb));
% % % %                  -dphi(ib)*dphi(ib)*model_def.bodies(ib).ujx*sin(phi(ib))-dphi(ib)*dphi(ib)*model_def.bodies(ib).ujy*cos(phi(ib))-dphi(jb)*dphi(jb)*model_def.bodies(jb).uix*sin(phi(jb))-dphi(jb)*dphi(jb)*model_def.bodies(jb).uiy*cos(phi(jb))]; 
% % % %     end    
end

