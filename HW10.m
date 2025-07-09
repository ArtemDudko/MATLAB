%% [ARTEM DUDKO] - [HW #10] - [4/22/2020]
%% [PROBLEM #4]
format compact, clear, clc, close all

x = [-4:0.01:4];
y = [-3:0.0075:3];
z = (x.^2)/4 + 2.*(sin(0.7.*y).^2);

plot3(x,y,z);
grid on;
xlabel('x'); ylabel('y'); zlabel('z');



%% [PROBLEM #10]
format compact, clear, clc, close all

aOverLambda = [-20:0.08:20];
theta = [2:0.016:10];
[X,Y] = meshgrid(aOverLambda,theta);
IoverImax = (sin(pi.*X.*sin(Y))./pi.*X.*sin(Y)).^2;


mesh(X,Y,IoverImax);
grid on;
xlabel('aOverLambda'); ylabel('theta'); zlabel('IoverImax');




%% [PROBLEM #11]
format compact, clear, clc, close all

v = [0:1:1000];
t = [70:1:320];
R = 8.31;
M = 0.032;

[V,T] = meshgrid(v,t);
Pv = 4.*pi.*(M./(2.*pi.*R.*T)).^(1.5).*(V.^2).*exp(-M.*(V.^2)./(2.*R.*T));

mesh(V,T,Pv);
grid on;
xlabel('Speed'); ylabel('Temp'); zlabel('Prob. Distribution');

%% [PROBLEM #21]
format compact, clear, clc, close all

K = 300;
t = [0:0.1:90];
r = [0.02:0.01:0.2];

[T,R] = meshgrid(t,r);

xx = (-K ./ sqrt(2.*pi.*R)).*sin((T./2).*(2+cos(T./2).*cos(1.5.*T)));
yy = (K ./ sqrt(2.*pi.*R)).*sin((T./2).*(cos(T./2).*cos(1.5.*T)));
xy = (K ./ sqrt(2.*pi.*R)).*cos((T./2).*(1-sin(T./2).*sin(1.5.*T)));

mesh(T,R,xx);
grid on;
xlabel('T'); ylabel('R'); zlabel('Stress Fields XX');

mesh(T,R,yy);
grid on;
xlabel('T'); ylabel('R'); zlabel('Stress Fields YY');

mesh(T,R,xy);
grid on;
xlabel('T'); ylabel('R'); zlabel('Stress Fields XY');
