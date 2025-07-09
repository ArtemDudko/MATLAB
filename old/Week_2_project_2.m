% Artem Dudko, Trevor McCarthy, Josh Sheinis
% Matlab week 2 project 2
% Lab section 02
clear
clc
% command window and workspace was cleared
x=linspace(0,50,1000);
P=100;
% the variables x and P were defined
A=x.*(50-x);
% The variable A was defined as the given function
plot(x,A);
xlabel("Side length");
ylabel("Area in meters");
title("Area of rectangle at side length x");
% A plot of A vs x is displayed with the given axis labels and title
[A_max,locs]=findpeaks(A);
% found the peaks of y and their indices in the vector
x_locs=x(locs);
% found the x values at the peaks of y
fprintf('Maximum area is %f square meters \n', A_max);
fprintf('Length of the rectangle is %f meters \n', x_locs);
width = 50 - x_locs;
fprintf('Width of the rectangle is %f meters \n', width);
% the maximum area and the corresponding side lengths were printed 