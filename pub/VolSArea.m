function [V, S] = VolSArea(r,R,h)
%Calculates volume and surface area of a frustrum cup
%output: [Volume, Surface Area] input: (Small r, Large R, height)
V = (pi * h / 3) * (R^2 + R * r + r^2) * 0.554113;
S = pi * (R + r) * sqrt((R - r)^2 + h^2) + pi * r^2;
