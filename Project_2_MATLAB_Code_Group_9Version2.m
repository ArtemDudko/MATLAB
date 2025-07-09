%% [ARTEM DUDKO, NIKOLAS TAPANAINEN, BRANDON KEEFE] - [MATLAB Project 2] - [2021]
%% [PROBLEM #1]
clc;
%%student ID sum = 1
load group1.mat;

%Tutorial problems:
a1tut = [1 -0.8];
b1tut = [2 0 -1];
Ntut = 40;
[H1, omega1] = freqz(b1tut,a1tut,Ntut);


a2tut = [1 -0.8];
b2tut = [2 0 -1];
Ntut = 40;
[H2, omega2] = freqz(b2tut,a2tut,Ntut, 'whole');

%3.a

%x_3a = 0:length(y) - 1;   %define time axis


hnotch = [1,-2.*cos(0.628357),1];  %impulse response
[H_3a, omega3] = freqz(hnotch,1,1000,'whole');
H_3a_DB = 20 .* log10(abs(H_3a));
figure(1)  %H(ejw) graph on the dB scale
plot(omega3shift,H_3a_DB)
xlim([-pi pi])
%xlim([0.3 1])

%shift = ones(length(omega3),1).*-pi;  %shift x axis to be from -pi to pi
%omega3shift = omega3 + shift;

%n = [1:length(y)];
%ynotched = conv(y,hnotch);

%[Ynotched, omega4] = freqz(ynotched,0:(length(y)-1),1000,'whole');
%YnotchedDB = 20 .* log10(abs(Ynotched));

%shift = ones(length(omega3),1).*-pi;
%omega4shift = omega4 + shift;



fft_hnotch = fft(hnotch,length(y));  %frequency transform of hnotch
fft_hnotch_DB = 20 .* log10(abs(fft_hnotch));

Nfft = 2^ceil(log2(length(y)));
Y = fftshift(fft(y,Nfft));
omega5 = (0:(Nfft-1)).*(2*pi/Nfft)-pi;
YDB = 20 .* log10(abs(Y));

figure(2)
plot(omega5,YDB)
xlim([-pi pi])
%xlim([0.3 1])
ylim([-100 120])

%figure(3)  %H(ejw) graph on the normal frequency scale
%plot(omega3shift,H_3a)

y_filtered = filter(hnotch,1,y)

Y_filtered = fftshift(fft(y_filtered,Nfft));
Y_filtered_DB = 20 .* log10(abs(Y_filtered));

figure(4)
plot(omega5,Y_filtered_DB)
%xlim([0.3 1])
%ylim([-40 80])
xlim([-pi pi])
ylim([-100 120])


%figure(2)
%plot(length(hnotch),hnotch)

%soundsc(ynotched,10000)
soundsc(y_filtered,10000)

%plot(omega5,YDB)
%plot(length(yfiltered),yfiltered)