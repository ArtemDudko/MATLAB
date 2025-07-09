%% [ARTEM DUDKO, NIKOLAS TAPANAINEN, BRANDON KEEFE] - [MATLAB Project 2] - [2021]
%% [PROBLEM #1]
clc;
%%student ID sum = 1
load group1.mat;

%Tutorial problems:
a1 = [1 -0.8];
b1 = [2 0 -1];
N = 40;
[H1, omega1] = freqz(b1,a1,N);


a2 = [1 -0.8];
b2 = [2 0 -1];
N = 40;
[H2, omega2] = freqz(b2,a2,N, 'whole');

%3.a

x3 = 0:length(y) - 1;   %define time axis

[Y3, omega3] = freqz(hnotch,1,1000,'whole');
Y3db = 20 .* log10(abs(Y3));

shift = ones(length(omega3),1).*-pi;
omega3shift = omega3 + shift;



%subplot(3,1,3)   %Y(ejw) graph on the normal frequency scale, 
%plot(omega3shift,Y3)  %but zoomed in to show that it has values
%ylim([0 10000])
%xlim([-pi pi])

%hnotch = cos( (2.51327) .* [1:length(y)]);
n = [1:length(y)];
%hnotch = sin(( 4 * pi / 5) .* n) / (n .* pi);
ynotched = conv(y,hnotch);

[Ynotched, omega4] = freqz(ynotched,0:(length(y)-1),1000,'whole');
YnotchedDB = 20 .* log10(abs(Ynotched));

shift = ones(length(omega3),1).*-pi;
omega4shift = omega4 + shift;



hnotch = [1,-2.*cos((4/5).*pi),1];
ffthnotch = fft(hnotch,length(y));
ffthnotchDB = 20 .* log10(abs(ffthnotch));

Nfft = 2^ceil(log2(length(y)));
Y = fftshift(fft(y,Nfft));
omega5 = (0:(Nfft-1)).*(2*pi/Nfft)-pi;
YDB = 20 .* log10(abs(Y));

yfiltered = filter(hnotch,1,y)
soundsc(yfiltered,10000)
figure(1)  %Y(ejw) graph on the dB scale
subplot(3,1,1)
plot(omega3shift,Y3db)
xlim([0.3 1])

subplot(3,1,2)
plot(omega5,YDB)
%plot(length(ffthnotchDB),ffthnotchDB)
xlim([0.3 1])

subplot(3,1,3)  %Y(ejw) graph on the normal frequency scale
plot(omega3shift,Y3)
xlim([0.3 1])



%figure(2)
%plot(length(hnotch),hnotch)
%soundsc(ynotched,10000)

%soundsc(yfiltered,10000)
subplot(3,1,3)
%plot(omega5,YDB)
%plot(length(yfiltered),yfiltered)