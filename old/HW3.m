%% [ARTEM DUDKO] - [HW #3] - [2/10/2020]
%% [PROBLEM #8]
format compact, clear, clc, close all

u = [-5.6 11 -14]
%square each element, then sum the resulting array, then find its root
uLength = sqrt(sum(u.^2))


%% [PROBLEM #14]
format compact, clear, clc, close all

v = [5 4 3 2];
a = 1 ./ (v + v)
b = v .^ v
c = v ./ sqrt(v)
d = (v .^ 2) ./ (v .^ v)

%% [PROBLEM #32]
format compact, clear, clc, close all

x = magic(5);
rows = sum(x,1) %sum of each row
diagonalA = sum(diag(x)) %sum of main diagonal
coloumns = sum(x,2) %sum of each coloumn
diagonalB = sum(diag(fliplr(x))) %sum of the flipped main diagonal

%% [PROBLEM #34]
format compact, clear, clc, close all

left = [2 -4 5 -3.5 1.8 4; -1.5 3 4 -1 -2 5; 5 1 -6 3 -2 2;...
1.2 -2 3 4 -1 4; 4 1 -2 -3 -4 1.5; 3 1 -1 4 -2 -4];
right = [52.52; -21.1; -27.6; 9.16; -17.9; -16.2];
variablesAthruF = linsolve(left,right) %each value corresponds to a variable, in order

