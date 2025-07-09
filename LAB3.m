%% [ARTEM DUDKO] - [LAB #3] - [2/5/2020]
%% [PROBLEM #5]
format bank, format compact, clear, clc, close all

V = [4000:-500:1000]'
r = (0.75*V/pi).^(1/3);
r = round(r,1)
s = r.^2 * 4 * pi;
s = round(s,1)
finalTable = table(r,s,V)

%% [PROBLEM #10]
format compact, clear, clc, close all

uOne = [3.2 -6.8 9];
uTwo = [-4 2 7];
angle = acosd(((sum(uOne .* uTwo)) / ( sqrt(sum(uOne .* uOne)) * sqrt(sum(uTwo .* uTwo)))))

