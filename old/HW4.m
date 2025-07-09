%% [ARTEM DUDKO] - [HW #4] - [2/17/2020]
%% [PROBLEM #1]
format compact, clear, clc, close all

weight = input('Enter weight: ');
height = input('Enter height: ');
bmi = 703*(weight / height^2);
fprintf('The BMI is: %0.2f', bmi);

%% [PROBLEM #11]
format compact, clear, clc, close all


height = [-500:500:10000];
pressure = 29.921 * (1 - 6.8753 * 10^(-6) * height);
temp = 49.161 * log(pressure) + 44.932;

finalTable = table(height',temp');
finalTable.Properties.VariableNames = {'Heights','Tempertures'};
finalTable.Properties.Description = 'Height vs. Boiling Temperture of Water';

disp(finalTable.Properties.Description)
disp(finalTable)

%% [PROBLEM #25]
format compact, clear, clc, close all

syms a b c d e;
vars = [-2.5 -62; -1.5 -7.2; -0.5 8.3; 1 3.7; 3 45.7];
x = vars(1:5,1);
y = vars(1:5,2);
eqn = a.*x.^4 + b.*x.^3 + c.*x.^2 + d.*x + e == y;

sol = solve(eqn, [a b c d e]);
aSol = double(sol.a)
bSol = double(sol.b)
cSol = double(sol.c)
dSol = double(sol.d)
eSol = double(sol.e)



