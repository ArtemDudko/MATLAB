%% [ARTEM DUDKO] - [LAB #5] - [2/19/2020]
%% [PROBLEM #33]
format compact, clear, clc, close all

V = [0.065:0.001:1];
T = 297;
R = 0.08206;
a = 3.592;
b = 0.04267;  
n = 1;
idealP = n*R*T./V;
waalsP = (n.*R.*T) ./ (V-n.*b) - n^2.*a ./ (V.^2);
plot(V,idealP,'--',V,waalsP,'-');
ylabel('Pressure, (atm)');
xlabel('Volume, (L)');
title('Ideal vs. Van Der Waals Equations');
legend('Ideal Gas Equation','van der Waals Equation');

%% [PROBLEM #38]
format compact, clear, clc, close all

Q = 300;
D = [100:2:2000];
Lo = [5 10 20]';
Lc = Lo ./ ((1 + (2.5*D.^(2/3) ./ sqrt(Q))));
plot(D,Lc(1,:),D,Lc(2,:),'--',D,Lc(3,:),'-.');
ylabel('BOD in Effluent');
xlabel('Depth');
title('BOD of Different Influent BOD and Depths');
legend('5mg/L','10mg/L','20mg/L');





