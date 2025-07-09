%% [ARTEM DUDKO] - [LAB #2] - [1/29/2020]
%% [PROBLEM #30]
format compact, clear, clc, close all
G1 = [ones(3,5);zeros(3,3) ones(3,2)]

%% [PROBLEM #39]
format compact, clear, clc, close all
G2 = [0.1:0.1:0.7;10:-1:4;0:0.2:1.2;5:-2:-7]
Ma = G2([1 3 4],[1 2 6 7])
Mb = G2(1:3,2:2:6)

