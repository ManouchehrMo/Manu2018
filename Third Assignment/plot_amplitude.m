function [ P ] = plot_amplitude( r,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10)

% Each of M with its index describes an amplification ratio
% M1 is the amplitude ratio which is used in the plot with zeta= 0.1
% M2 is the amplitude ratio which is used in the plot with zeta= 0.2
% M3 is the amplitude ratio which is used in the plot with zeta= 0.3
% M4 is the amplitude ratio which is used in the plot with zeta= 0.4
% M5 is the amplitude ratio which is used in the plot with zeta= 0.5
% M6 is the amplitude ratio which is used in the plot with zeta= 0.6
% M7 is the amplitude ratio which is used in the plot with zeta= 0.7
% M8 is the amplitude ratio which is used in the plot with zeta= 0.8
% M9 is the amplitude ratio which is used in the plot with zeta= 0.9
% M10 is the amplitude ratio which is used in the plot with zeta close to zero
%%
P= plot(r,M1,'k',r,M2,'k',r,M3,'k',r,M4,'k',r,M5,'k',r,M6,'k',r,M7,'k',r,M8,'k',r,M9,'k',r,M10,'k','LineWidth',1.5);
axis([0 2.5 0 5.5])
grid on
end

