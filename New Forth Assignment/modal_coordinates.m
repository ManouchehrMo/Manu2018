function dy_tilda = modal_coordinates(t,y,M,K)
[psi,lambda] = eig(K,M);

 M_tilda = zeros(length(M(:,1)));
 K_tilda = zeros(length(M(:,1)));
for i = 1:length(M(:,1))
    M_tilda(i,i) = psi(:,i)'*M*psi(:,i);
    K_tilda(i,i) = psi(:,i)'*K*psi(:,i);
end
 
dy_tilda=zeros(6,1);

dy_tilda(1:3) = y(4:6);
dy_tilda(4:6) = M_tilda\(-K_tilda*y(1:3));

end