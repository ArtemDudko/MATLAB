load('correctedctftmod.mat')

%Basic Problems
%% Part A)

p = 1:1:8000;
tt = 1:1:2000;
morseZ = [dash dash dot dot];
b= [dash];
a = [dot];
figure(1)
subplot(221)
plot(t,morseZ)
xlabel('time (t)')
ylabel('Amplitude (z)')
title('Part A: Morse Code Signal of Z')

%% Part B)



freqresp = freqs(bf,af);
figure(1)
subplot(222)
plot((1:200)./(2*pi) ,abs(freqresp))
ylim([-0.2 1.2])
xlabel('Filter Response')
ylabel('|H(jw)|')
title('Part B: Frequency in Hz')


%% Part C)

m = [1:1:2000];
lpf = tf(bf,af);
ydash = lsim(lpf,dash,t(1:length(dash)));
ydot = lsim(lpf,dot,t(1:length(dot)));

figure(1)
subplot(223)
plot(t(1:length(b)),b)
hold on
plot(t(1:length(ydash)),ydash) %orange
title('Part C: dash is blue, ydash is orange')
xlabel('time (t)')
hold off

figure(1)
subplot(224)
plot(t(1:length(a)),a)
hold on
plot(t(1:length(ydot)),ydot) %orange
title('Part C: dot is blue, dot is orange')
xlabel('time (t)')
hold off

%% Part D)



%t2000 = t(1:2000);
%dash8000 = [dash(1:2000) zeros([1 6000])];
%y = dash.cos(2pif1t(1:length(dash)));

% swtich above back to dash instead of dash8000 for previous results

y=dash.*cos(2*pi*200*t(1:length(dash)));

figure(2)
subplot(311)
plot(t(1:length(y)),y)
title('Part D: plot of y(t) = dash cosine')
xlabel('time (t)')

yo =  lsim(lpf,y,t(1:length(y)));

subplot(312)
plot(t(1:length(yo)),yo)            %yo is the modulated result
title('Part D: LPF of y(t)')
xlabel('time (t)')


yoDemodulated = lsim(lpf,y.*cos(2*pi*f1*t(1:length(dash))),t(1:length(y)));

subplot(313)
plot(t(1:length(yoDemodulated)),yoDemodulated)            %yo is the modulated result
title('Part D: y(t) demodulated using f1')
xlabel('time (t)')


% Advanced Problems:
%% Part E)
% Done on paper.







%% Part F)



Fs = 8000; %sampling Frequency
Period = 1/Fs;
timeVector = (0:8000-1)*Period;
xFREQ = x.*cos(400.*timeVector);

P2 = abs(fft(x)/8000); 
P1 = P2(1:8000/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(8000-1))/16000;
figure(4)
subplot(211)
plot(f,P2) 
title('Part F: FFT of x(t)')

xlabel('f (Hz)')
ylabel('|X(jw)|')

subplot(212)
plot(f,P2) 
title('FFT of x(t) Zoomed to Show f1 = 200 and f2 = 400')
xlabel('f (Hz)')
ylabel('|X(jw)|')
xlim([150 450])


m1 = lsim(lpf, x.cos(400*(2*pi).*timeVector), timeVector);

figure(5)
subplot(311)
plot(t,x)
title('Part F: Time Graph of x message')
xlabel('time (t)')

subplot(312)
plot(t,x)
title('zoom of first quarter of x message')
xlabel('time (t)')
xlim([0 0.5])

subplot(313)
plot(t,m1) 
title('m1 in Time (dash dot dot = D)')
xlabel('time (t)')




%% Part G)



m2 = lsim(lpf, x.sin(800*(2*pi).*timeVector), timeVector);
m3 = lsim(lpf, x.sin(400*(2*pi).*timeVector), timeVector);
%P6 = lsim(lpf, x.cos(100(2pi).*timeVector), timeVector)



figure(7)

subplot(321)
plot(t,m1) 
title('Part F: m1 in Time (dash dot dot = D)')
xlabel('t (Seconds)')
ylabel('m1(t)')

subplot(323)
plot(t,m2) 
title('m2 in Time (dot dot dot = S)')
xlabel('t (Seconds)')
ylabel('m2(t)')

subplot(325)
plot(t,m3) 
title('m3 in Time (dot dash dash dot = P)')
xlabel('t (Seconds)')
ylabel('m3(t)') 




morseD = lsim(lpf,[dash dot dot],t(1:length([dash dot dot])));
morseS = lsim(lpf,[dot dot dot],t(1:length([dot dot dot])));
morseP = lsim(lpf,[dot dash dash dot],t(1:length([dot dash dash dot])));




subplot(322)
plot(t(1:length(morseD)),morseD)
title('lowpass of [dash dot dot] = D')
subplot(324)
plot(t(1:length(morseS)),morseS)
title('lowpass of [dot dot dot] = S')
subplot(326)
plot(t(1:length(morseP)),morseP)
title('lowpass of [dot dash dash dot] = P')