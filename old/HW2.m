%% [ARTEM DUDKO] - [HW #2] - [2/3/2020]
%% [PROBLEM #15]
format compact, clear, clc, close all

% one row of five zeros and four 8.1 values
q = [ zeros(1,5),8.1*ones(1,4)]

%% [PROBLEM #21]
format compact, clear, clc, close all

vC = 2:3:38

% index of all the even coloumns
vCeven = vC([1],[2:2:12])
% index of all the odd coloumns
vCodd = vC([1],[1:2:13])

%% [PROBLEM #38]
format compact, clear, clc, close all

N = reshape(0:3:51,6,3)'

% copy and paste the row elements
Ua = [N(1,1:3) N(3,4:6)]
% copy and paste the coloumn elements
Ub = [N(:,1);N(:,3);N(:,6)]
% transpose the row elements to fit the coloumn, and add column elements
Uc = [N(2,2:5)';N(2:3,5)]

%% [PROBLEM #44]
format compact, clear, clc, close all

% two squares of I matrices
a = [eye(3) eye(3)]
% a rectangle of zeros and a rectangle of ones
b = [zeros(2,3) ones(2,2)]
% a bit of a mess to comply with syntax and problem directions.
% several ones and zeros commands to construct the matrix without syntax
% errors
c = [ones(1,1) zeros(1,2) ones(1,1); ones(2,1) zeros(2,3)]



