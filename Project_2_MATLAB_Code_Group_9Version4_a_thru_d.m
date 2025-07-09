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

%% 3.a

Nfft = 2^ceil(log2(length(y)));  %compute Y(e^jw)
Y = fftshift(fft(y,Nfft));
omega5 = (0:(Nfft-1)).*(2*pi/Nfft)-pi;
Y_DB = 20 .* log10(abs(Y));

figure(1)
subplot(2,1,1)
plot(omega5,Y);
xlim([-pi pi])

subplot(2,1,2)
plot(omega5,Y_DB);
xlim([-pi pi])
text(0.7,70,"<- Tone spike @w=0.628357")
text(-1.7,40,"<- Beginning of Random Noise")
text(1.73,-18,"<- Speech")

%% 3.b on paper
%% 3.c

%impulse response, and its dB form. 
hnotch = [1,-2.*cos(0.628357),1];  %w plugged in from part a
[H_3a, omega3] = freqz(hnotch,1,10000,'whole');  
H_3a_DB = 20 .* log10(abs(H_3a));

H_3a_DB_pos = H_3a_DB(1:5000); %the graph of H(e^jw) is from 0 to 2pi,
H_3a_DB_neg = H_3a_DB(5001:10000);  %this makes it -pi to pi
H_3a_DB_shifted = [H_3a_DB_neg; H_3a_DB_pos];
shift = ones(10000,1).*-pi;
omega3shift = omega3 + shift;

%resulting w is very close to part a, w = 0.628319
figure(2)
subplot(2,1,1)
plot(omega3shift,H_3a_DB_shifted);
xlim([-pi pi])

subplot(2,1,2)
plot(omega3shift,H_3a_DB_shifted);
xlim([0.5 0.7])

%%3.d


fft_hnotch = fft(hnotch,length(y));  %frequency transform of hnotch
fft_hnotch_DB = 20 .* log10(abs(fft_hnotch));




r = filter(hnotch,1,y)

R = fftshift(fft(r,Nfft));
R_DB = 20 .* log10(abs(R));

%Noise Tests, uncomment to hear:
%soundsc(y,10000)
%soundsc(r,10000)






figure(3)   %filter response in dB
subplot(3,1,1)
plot(omega3shift,H_3a_DB_shifted);
xlim([-pi pi])

subplot(3,1,2)   %Original frequency response in dB
plot(omega5,Y_DB);
xlim([-pi pi])
ylim([-100 120])

subplot(3,1,3)   %filtered y frequency in dB, the tone is gone
plot(omega5,R_DB);
xlim([-pi pi])
ylim([-100 120])


figure(4)   %figure 4 is a zoomed in version of figure 3
subplot(3,1,1)
plot(omega3shift,H_3a_DB_shifted);
xlim([0.5 0.7])

subplot(3,1,2)
plot(omega5,Y_DB);
xlim([-pi pi])
xlim([0.5 0.7])
ylim([-100 120])

subplot(3,1,3)
plot(omega5,R_DB);
xlim([0.5 0.7])
ylim([-100 120])

%%3.e


alpha = 1.7./pi;
hlpf = fir1(200,alpha);

[lowpass,omega6] = freqz(hlpf,1,512);



y_hlpf = filter(hlpf,1,y);
Y_hlpf = fftshift(fft(y_hlpf,Nfft));
Y_hlpf_DB = 20 .* log10(abs(Y_hlpf));

figure(5)
subplot(311)
plot(omega6,lowpass)
xlim([-pi pi])

subplot(312)
plot(omega5,Y_DB);
xlim([-pi pi])
ylim([-100 120])

subplot(313)
plot(omega5,Y_hlpf_DB)
xlim([-pi pi])
ylim([-100 120])

%%3.f

s = filter(hlpf,1,r);
S = fftshift(fft(s,Nfft));
S_DB = 20 .* log10(abs(S));

figure(6)
plot(omega5,S_DB)
xlim([-pi pi])
ylim([-100 120])
%%3.g

h_combo = conv(hlpf,hnotch)

[H_combo,omega7] = freqz(h_combo,1,512);


v = filter(h_combo,1,y)
V = fftshift(fft(v,Nfft));
V_DB = 20 .* log10(abs(V));
figure(7)
plot(omega5,V_DB)

%soundsc(S,10000)











