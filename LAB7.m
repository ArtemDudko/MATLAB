%% [ARTEM DUDKO] - [LAB #7] - [3/25/2020]

function [V, S] = VolSArea(r,R,h)
%Calculates volume and surface area of a frustrum cup
%output: [Volume, Surface Area] input: (Small r, Large R, height)
V = (pi * h / 3) * (R^2 + R * r + r^2) * 0.554113;
S = pi * (R + r) * sqrt((R - r)^2 + h^2) + pi * r^2;

function [w] = crosspro(u, v)
%Calculates cross product of two vectors up to three long
%output: [cross product] input: (vector 1, vector 2)
u = cat(2,u,zeros(1,3));
v = cat(2,v,zeros(1,3));
w1 = u(2) * v(3) - u(3) * v(2);
w2 = u(3) * v(1) - u(1) * v(3);
w3 = u(1) * v(2) - u(2) * v(1);

w = [w1 w2 w3];

%% [PROBLEM #9]
format compact, clear, clc, close all

[volume1 sa1] = VolSArea(2, 3.5, 4.25)
[volume2 sa2] = VolSArea(2.5, 3.5, 4.5)

%% [PROBLEM #10]
format compact, clear, clc, close all
a = [3, 11];
b = [14,-7.3];
c = [-6, 14.2, 3];
d = [6.3,-8, -5.6];

product1 = crosspro(a,b)
product2 = crosspro(c,d)

