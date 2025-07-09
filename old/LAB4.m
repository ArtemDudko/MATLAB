%% [ARTEM DUDKO] - [LAB #3] - [2/5/2020]
%% [PROBLEM #18]
format compact, clear, clc, close all

tempValue = xlsread('temps.xls','A1:F1');
c = 13.83;
Eg = 0.67;
k = 8.62*10^(-5);
IEC = exp((c - Eg./(2.*k.*tempValue)));

finalTable = table(tempValue',IEC');
finalTable.Properties.VariableNames = {'Tempertures','IntrinsicElectricalConductivity'};
finalTable.Properties.Description = 'Intrinsic Electrical Conductivity of a Semiconductor Based on Temperture';

disp(finalTable.Properties.Description)
disp(finalTable)

%% [PROBLEM #21]
format compact, clear, clc, close all

coord = input('Enter coordinates: ');

left = [coord.*-2 ones(3,1)];
right = -sum(coord.^2');
solution = linsolve(left,right');

xZero = solution(1,1);
yZero = solution(2,1);
R = sqrt((coord(1,1) - xZero)^2 + (coord(1,2) - yZero)^2);

fprintf('The coordinates of the center are (%.1f,%.1f) and the radius is (%.1f)\n', xZero, yZero, R)