%% [ARTEM DUDKO] - [LAB #9] - [4/8/2020]

%% [PROBLEM #30]
format compact, clear, clc, close all

x = [0:0.05:4];
s = sin(x.*x);
c = cos(x.*x);

sfxn = @(x) sin(x.*x);
cfxn = @(x) cos(x.*x);
sx = quad(sfxn,0,4)
cx = quad(cfxn,0,4)

f1 = figure;
plot(x,s,'--',x,c,'-');
title('Plot 1 x vs s and x vs c');

f2 = figure;
plot(c,s,'--');
title('Plot 2 s vs c');

%% [PROBLEM #33]
format compact, clear, clc, close all

int = [0:0.08:0.8];
[x y]=ode45(@(x,y)((1+y.*y).*tan(x)),int,sqrt(3))


exsol = -tan(log(cos(int) - pi/3));
plot(exsol,int,'-*',y,x,'-');



