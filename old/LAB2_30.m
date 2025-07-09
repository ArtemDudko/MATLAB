%% [ARTEM DUDKO] - [LAB #2] - [1/29/2020]
%% [PROBLEM #30]
format compact, clear, clc, close all
g = ones(6,5),

%% [PROBLEM #39]
G = [0.1:0.1:0.7;10:-1:4;0:0.2:1.2;5:-2:-7]
Ma = G;
Mb = G;

Ma(:,3:5) = [];
Ma(2,:) = []

Mb(:,1:2:7) = []
Mb(4,:) = []
