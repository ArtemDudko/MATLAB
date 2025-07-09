load('correctedctftmod.mat')
%%Part A)

b = [dash]; %upspike in time
a = [dot];  %downspike in time

zCode = [dash dash dot dot];
vCode = [dot dot dot dash]

figure(1)
subplot(211)
plot(t,zCode)
subplot(212)
plot(t,vCode)

lpf = tf(bf,af);
ydash = lsim(lpf,dash,t(1:length(dash)));
ydot = lsim(lpf,dot,t(1:length(dot)));
yzCode =  lsim(lpf,zCode,t(1:length(zCode)));

m = [1:1:2000];
m8000 = [1:1:8000];
figure(2)

subplot(211)
plot(m,b)
hold on
plot(m,ydash) %orange
title('Time b, ydash is orange')
hold off

subplot(212)
plot(t,zCode)
hold on
plot(t,yzCode) %orange
title('Time a, ydot is orange, ydot mostly preserved')
hold off

figure(3)
plot(t,x)
title('Time Graph of x message')

%xFreq = lsim(lpf,x,t(1:length(x)));
%zCodeFFT = fft(zCode,1000);
%zCodeLPF = lsim(lpf,zCode,t(1:length(zCode)));
%zCodeFFTLPF = fft(zCodeLPF, 1000);
%dashFFT = fft(dash);
%dotFFT = fft(dot);

Fs = 8000; %sampling Frequency
Period = 1/Fs;
timeVector = (0:8000-1)*Period; 


%xFREQ = x.*cos(400*(2*pi).*timeVector);
xFREQ = x.*cos(400.*timeVector);


%xDemod1 = fft(xFREQ,8000);
%xDemod2 = lsim(lpf,xDemod1,0:8000-1);



figure(4)


P2 = abs(fft(x)/8000); 
P1 = P2(1:8000/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(8000-1))/8000;
plot(f,P2) 
title('Single-Sided Amplitude Spectrum of x data')
xlabel('f (Hz)')
ylabel('|P1(f)|') %500Hz and 1000Hz
xlim([0 1000])

figure(5)
P3 = fft(x.*sin(400*(2*pi).*timeVector))/8000; 
plot(f,P3) 
title('freq view')
xlabel('f (Hz)')
ylabel('|P1(f)|') %500Hz and 1000Hz

%figure(6)
%P4 = fft(x.*cos(800*(2*pi).*timeVector))/8000; 
%plot(f,P4) 
%title('Single-Sided Amplitude Spectrum of x data')
%xlabel('f (Hz)')
%ylabel('|P1(f)|') %500Hz and 1000Hz

m1 = lsim(lpf, x.*cos(400*(2*pi).*timeVector), timeVector);%m1
m2 = lsim(lpf, x.*sin(800*(2*pi).*timeVector), timeVector);
m3 = lsim(lpf, x.*sin(400*(2*pi).*timeVector), timeVector);
%P6 = lsim(lpf, x.*cos(100*(2*pi).*timeVector), timeVector)



figure(7)
subplot(311)
plot(t,m1) 
subplot(312)
plot(t,m2) 
subplot(313)
plot(t,m3) 
title('time view')
xlabel('f (Hz)')
ylabel('|P1(f)|') %500Hz and 1000Hz

%figure(8)
 
%plot(t,P6) 
title('Single-Sided Amplitude Spectrum of x data')
xlabel('f (Hz)')
ylabel('|P1(f)|') %500Hz and 1000Hz


%plot(length(xFREQ),xFREQ)
%hold on
%plot(length(dotFFT),dotFFT) %orange
%title('Time a, ydot is orange, ydot mostly preserved')
%hold off





