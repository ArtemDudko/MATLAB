%% [ARTEM DUDKO] - [HW #5] - [2/24/2020]
%% [PROBLEM #8]
format compact, clear, clc, close all

theta = [0:0.01:360];
r = (3.44.*10^7)./(1-0.206.*cos(theta));
plot(theta,r);

%% [PROBLEM #14]
format compact, clear, clc, close all


xleft = [-4:0.01:-1];
xmiddle = [-1:0.01:1];
xright = [1:0.01:4];
fxnleft = xleft + 1 ./ (xleft.^2 - 1);
fxnmiddle = xmiddle + 1 ./ (xmiddle.^2 - 1);
fxnright = xright + 1 ./ (xright.^2 - 1);
plot(xleft,fxnleft,'--',xmiddle,fxnmiddle,xright,fxnright,'-.')
axis([-4 4 -15 15]);

%% [PROBLEM #29]
format compact, clear, clc, close all

time12 = [0:0.001:0.5];
timezero = [0.5:0.001:1];
currentV12 = (12./4) * (1 - exp(-4.*time12 ./ 1.3))
currentV0 = exp(-4.*timezero./1.3) .* (12./4) * (1 - exp(-4.*timezero ./ 1.3))



%% [PROBLEM #34]
format compact, clear, clc, close all


