clc;
clear;

A = [2 3 2; 1 2 -1; 1 -1 2]

A(:,2)
A(2,:)
A(2,3)
A(3,2)

B = [-1; 1; 0]
X = A\B
my_B = A*X
isequal(my_B,B)

