clear;
clc;
figure;

x=linspace(-4,0,1001);
y=(x.^2)./(2 + sin(x)+x.^4);
y_max = findpeaks(y);
[y_max,locs] = findpeaks(y);
x = x(locs);
fprintf('At y maximum = %0.3f, x = %0.3f \n', y_max, x) 
%This calculates y max from -4 to 0

x=linspace(0,4,1001);
y=(x.^2)./(2 + sin(x)+x.^4);
y_max = findpeaks(y);
[y_max,locs] = findpeaks(y);
x = x(locs);
fprintf('At y maximum = %0.3f, x = %0.3f \n', y_max, x)
%this calculates ymax from 0 to 4

x=linspace(-4,4,1001);
y=(x.^2)./(2 + sin(x)+x.^4);
plot(x,y);
title ('Plot of (x.^2)/(2 + sin(x)+x.^4');
xlabel ('x');
ylabel ('y');
grid on;
%this graphs the plot and labels it