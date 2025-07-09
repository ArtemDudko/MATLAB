%% [ARTEM DUDKO] - [HW #8] - [4/6/2020]

%% [PROBLEM #3]
format compact, clear, clc, close all

roots = [-0.7 0.5 3.5 5.8]
y = poly(roots)
polyeq = X^4*(y(1,1))+X^3*(y(1,2))+X^2*(y(1,3))+X*(y(1,4))+(y(1,5));
fprintf('The polynomial equation is %s',polyeq)
plot([-1:6],y)
%% [PROBLEM #8]
format compact, clear, clc, close all

for i = 


%% [PROBLEM #21]
format compact, clear, clc, close all




%% [PROBLEM #33]
format compact, clear, clc, close all

[n,Wn] = buttord(8000,12000,0,-80);


