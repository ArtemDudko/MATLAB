%% [ARTEM DUDKO] - [HW #1] - [1/27/2020]
%% [PROBLEM #39]
format compact, clear, clc, close all

a=8;
h=13;
length_abc = sqrt(a^2 + 4*(h^2)) + ...
((a^2) / (2*h)) * log( (2*h)/a + sqrt( (2*h/a)^2 +1))