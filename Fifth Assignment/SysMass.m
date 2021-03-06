function M = SysMass(l,m,theta)
%SYSMASS
%    M = SYSMASS(L,M,THETA)

%    This function was generated by the Symbolic Math Toolbox version 7.0.
%    23-Feb-2018 14:15:53

t2 = cos(theta);
t3 = l.*m.*t2;
M = reshape([m.*3.0,t3,t3,l.^2.*m.*(2.0./3.0)],[2,2]);
