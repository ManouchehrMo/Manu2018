function cp = modal_coordinates (t,p)


M_hat=[1 0 0;0 1 0;0 0 1];
K_hat= 1.0e+04 *[0.2609   -0.0000   -0.0000; -0.0000    1.3813    0.0000; 0.0000    0.0000    2.7745];

P=[p(1);p(2);p(3)];
eom=M_hat\(-K_hat*P); 

cp(1)=  p(4);
cp(2)=  p(5);
cp(3)=  p(6);
cp(4)=eom(1);
cp(5)=eom(2);
cp(6)=eom(3);
cp=cp(:);