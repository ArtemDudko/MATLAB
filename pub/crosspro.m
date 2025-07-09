function [w] = crosspro(u, v)
%Calculates cross product of two vectors up to three long
%output: [cross product] input: (vector 1, vector 2)
u = cat(2,u,zeros(1,3));
v = cat(2,v,zeros(1,3));
w1 = u(2) * v(3) - u(3) * v(2);
w2 = u(3) * v(1) - u(1) * v(3);
w3 = u(1) * v(2) - u(2) * v(1);

w = [w1 w2 w3];