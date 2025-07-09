%% [ARTEM DUDKO] - [LAB #6] - [3/4/2020]
%% [PROBLEM #10]
format compact, clear, clc, close all

NYC = [33 33 18 29 40 55 19 22 32 37 58 54 51 52 45 41 45 39 36 45 33 18 19 19 28 34 44 21 23 30 39];
DEN = [39 48 61 39 14 37 43 38 46 39 55 46 46 39 54 45 52 52 62 45 62 40 25 57 60 57 20 32 50 48 28];
%%a
avgNYC = sum(NYC) / length(NYC);
avgDEN = sum(DEN) / length(DEN);
%%b
abvavgNYC = sum(NYC > avgNYC);
abvavgDEN = sum(DEN > avgDEN);
%%c
higherDEN = sum(DEN > NYC);
fprintf('The average January temperture for NYC and Denver are %0.0f and %0.0f degrees respectively. \nThe temperture was above average for %d days in NYC, and for %d days in Denver.\nThe temperture in denver was higher than NYC for %d days.', avgNYC, avgDEN, abvavgNYC, abvavgDEN, higherDEN);

%% [PROBLEM #24]
format compact, clear, clc, close all

examRaw = [72 81 44 68 90 53 80 75 74 65 50 92 85 69 41 73 70 86 61 65 79 94 69];
sd = round(std(examRaw));
avg = round(sum(examRaw) / length(examRaw));

examLetter = string([ones(size(examRaw))]);

A = examRaw >= avg + 1.3 * sd;
examLetter(A) = "A";
B = (avg + 1.3 * sd >= examRaw) & (examRaw >= avg + 0.5 * sd);
examLetter(B) = "B";
C = (avg + 0.5 * sd >= examRaw) & (examRaw >= avg - 0.5 * sd);
examLetter(C) = "C";
D = (avg - 0.5 * sd >= examRaw) & (examRaw >= avg - 1.3 * sd);
examLetter(D) = "D";
F = avg - 1.3 * sd >= examRaw;
examLetter(F) = "F";

fprintf('The average is %0.0f, and the s.d. is %0.0f.\n', avg, sd);
scores = table(examRaw',examLetter');
scores.Properties.VariableNames = {'Grade','Letter'};

disp(scores.Properties.Description);
disp(scores);














