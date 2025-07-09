clc; clear;
syms x y z;
eq1 = 2*x + 3*y + 2*z == -1;
eq2 =   x + 2*y -   z == 1;
eq3 =   x -   y + 2*z == 0;
my_solution = solve([eq1, eq2, eq3], [x y z]);
x = my_solution.x;
y = my_solution.y;
z = my_solution.z;

