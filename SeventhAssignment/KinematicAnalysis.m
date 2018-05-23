%% Task 7 - Kimnematic Analysis


%% initial Values
q(:,1)=q0;
vel(:,1)=dq0;
ddq(:,1)=ddq0;
t_upd(1)=tini; 

for t = tini:dt:tend
 
% To count in each loop we will have a counter
column = column+1; 
no_lo=0; % number of loops
nconverg=0;

while no_lo<max_it

    % Newton Difference
    del_q = -Cq^(-1)*C;
    % Coordinate update
    q(:,column)=q(:,column)+del_q;
    
    no_lo=no_lo+1;
    nconverg=nconverg+1;
    
    maxdx=max(abs(del_q));  % Convergency Criteria
    if maxdx<epsilon
        no_lo=max_it;
    end
  %%
  % We will have an update for an iteration for constraints and jacobian
  % matrix
tmp=q(:,column); 
C = ConsEqua4Bar(tmp,t);

Cq = Jaco4Bar(tmp);
t_upd(column+1)=t;
end

% Estimation of positions for next step
q(:,column+1)=q(:,column);

% q;
% nconverg;
Determination of the velocities (dq)
Ct = ConsTime(tmp,t);
% Velocity  
vel(:,column) = Cq^(-1)*-Ct;
vel(:,column+1) = vel(:,column);

%% Determination of the accelerations
tmpdq = vel(:,column);
Ctt = ConsTimeTime(tmpdq,t); 

C_primeq = Consqq(tmp,tmpdq,t);
Cqt = Consqt(tmpdq,t);

 
ddq(:,column)=Cq^(-1)*(-Ctt-C_primeq-Cqt);
ddq(:,column+1)=vel(:,column);
end
