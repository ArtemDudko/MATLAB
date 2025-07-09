%Artem, Trevor, Josh
%Week Three Assignment 1
%Lab Section 02
clc; clear;

theta_d = linspace(0,90,91);
f = 134.6675 ./ (cosd(theta_d) + 0.55*sind(theta_d));
theta_r = linspace(0,1.57,158);
f_radians = 134.6675 ./ (cos(theta_d) + 0.55*sin(theta_d));
%f and f in radians are defined


y = 1 ./ f; %vector y created
[y_max, y_max_indice] = findpeaks(y);
f_min = 1 ./ y_max;
%y and minimum force are defined

plot(theta_d,f)
xlabel('Degrees');
ylabel('Force in Newtons');
title('Degrees vs Force');
grid on;
%plotted graph of theta and force

figure;
plot(y, theta_d)
xlabel('Degrees');
ylabel('1/f');
title('Degrees vs inverse of Force');
grid on;
%figure 2 is plotted

fprintf('The maximum of y is %0.3f, and its indice is %0.3f. \n',y_max, y_max_indice)
fprintf('The minimum force required (minimum of f) is %0.3f N \n',f_min)
fprintf('The optimal degree and radian values for least force required are %0.3f degrees and %0.3 radians respqcively. \n', (3.1415) ./ 6 ,f_min)
%results are reported

