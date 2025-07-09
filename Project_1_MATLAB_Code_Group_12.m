%3.2a - Length 3 Barker Code generated.
nb3 = 0:15;
b3=[1 1 -1 zeros(1,13)];

figure(1)
subplot(311)
stem(nb3,b3,'linewidth',2)
xlabel('Time n')
ylabel('Barker Code Logic')
title('3.2a Length 3 Barker Code')
xlim([0 15])
ylim([-2 2])



%3.2b - Repeated process for the other two codes.
nb7 = 0:15;
b7=[1 1 1 -1 -1 1 -1 zeros(1,9) ];

nb13 = 0:15;
b13=[1 1 1 1 1 -1 -1 1 1 -1 1 -1 1 zeros(1,3) ];

subplot(312)
stem(nb7,b7,'linewidth',2)
xlabel('Time n')
ylabel('Barker Code Logic')
title('3.2b Length 7 Barker Code')
xlim([0 15])
ylim([-2 2])

subplot(313)
stem(nb13,b13,'linewidth',2)
xlabel('Time n')
ylabel('Barker Code Logic')
title('3.2b Length 13 Barker Code')
xlim([0 15])
ylim([-2 2])

%3.3b
nb3 = 0:15;
b3=[1 1 -1 zeros(1,13) ];
nb7 = 0:15;
b7=[1 1 1 -1 -1 1 -1 zeros(1,9)];
nb13 = 0:15;
b13=[1 1 1 1 1 -1 -1 1 1 -1 1 -1 1 zeros(1,3)];
b3n = fliplr(b3);
b7n = fliplr(b7);
b13n = fliplr(b13);

figure(2)
subplot(311)
stem(nb3,b3n,'linewidth',2)
xlabel('Time n')
ylabel('Barker Code Logic')
title('Length 3 Barker Code Matched Filter')


subplot(312)
stem(nb3,b7n,'linewidth',2)
xlabel('Time n')
ylabel('Barker Code Logic')
title('Length 7 Barker Code Matched Filter')


subplot(313)
stem(nb3,b13n,'linewidth',2)
xlabel('Time n')
ylabel('Barker Code Logic')
title('Length 13 Barker Code Matched Filter')
		
%3.3c) 
nb3 = 0:15;
b3=[1 1 -1 zeros(1,13) ];
nb7 = 0:15;
b7=[1 1 1 -1 -1 1 -1 zeros(1,9)];
nb13 = 0:15;
b13=[1 1 1 1 1 -1 -1 1 1 -1 1 -1 1 zeros(1,3)];

b3n = fliplr(b3);
b7n = fliplr(b7);
b13n = fliplr(b13);

b3conv = conv(b3,b3n);
b3con = 0:30;
b7conv = conv(b7,b7n);
b13conv = conv(b13,b13n);

figure(3)
subplot(311)
stem(b3con,b3conv,'linewidth',2)
xlabel('Time n')
ylabel('Barker Code Logic')
title('Length 3 Barker Code Output')


subplot(312)
stem(b3con,b7conv,'linewidth',2)
xlabel('Time n')
ylabel('Barker Code Logic')
title('Length 7 Barker Code Output')


subplot(313)
stem(b3con,b13conv,'linewidth',2)
xlabel('Time n')
ylabel('Barker Code Logic')
title('Length 13 Barker Code Output')

%3.3d

time = 0:15;
s = [1 -1 1 -1 -1 1 -1 zeros(1,9)];
sf = fliplr(s);
timeconv = 0:30;
sconv = conv(s,sf);

figure(4)
subplot(311)
stem(time,s,'linewidth',2)
xlabel('Time (n)')
ylabel('values')
title('Input Signal s[n]')

subplot(312)
stem(time,sf,'linewidth',2)
xlabel('Time (n)')
ylabel('values')
title('Matched Filter Signal of s[n]')

subplot(313)
stem(timeconv,sconv,'linewidth',2)
xlabel("Time (n)")
ylabel("values")
title("Output of s[n] with Convolution of Matched Filter")


%3.3e
b13=[1 1 1 1 1 -1 -1 1 1 -1 1 -1 1 zeros(1,3)];
D = 13;
testr = [zeros(1,D) b13 zeros(1,500-13-D)];
time = 0:1004;
matched = fliplr(testr);
output = conv(testr,matched);

figure(5)
stem(time,output,'linewidth',2)
xlabel('Time (n)')
ylabel('values')
title('Output after Convolution with Signal and Matched Filter')

%3.3f
load proj1_mysterysig_fall21.mat    %First we load the data necessary.
sig1 = noisyr12;
figure(6)    %graph of original input signal
plot(0:length(sig1)-1,sig1,'linewidth',2)
ylim([-2 2])
xlabel('Time n')
ylabel('Signal Value')
title('Mystery Signal 12 (noisyr12)')



n = 0:15;   %timeline n
N = 12;      %necessary delay for causality in a length 13 Barker code from part 3.3a
nf = -fliplr(n);  %n flipped
nfc = nf + N;     %n flipped made causal

b13 = [1 1 1 1 1 -1 -1 1 1 -1 1 -1 1 zeros(1,3)]; %length 13 Barker Code
b13f = fliplr(b13);                                %b13 flipped in time




figure(7)       %b13 accounted for shifted time axis
stem(nfc,b13f,'linewidth',2)
ylim([-2 2])
xlabel('Time n')
ylabel('Signal Value')
title('Causal Length 13 Barker Code')


b13fc = fliplr([1 1 1 1 1 -1 -1 1 1 -1 1 -1 1]); %b13 flipped in time and delayed by 12

sig2 = conv(sig1,b13fc);        %convolution of original signal with causal flipped length 13 Barker Code

sig2n = 0:length(sig2)-1;  %Time n not accounting for shift.

figure(8)
plot(sig2n,sig2,'linewidth',2)
ylim([-5 15])
xlim([-13 length(sig2)])
xlabel('Time n')
ylabel('Signal Value')
title('p[n], Not accounting for N, Barker Code Located at x[403]')
%We can see a spike at 403, but have not accounted for the shift of the Barker Code due to causality yet.



sig3n = (0-N):length(sig2)-N-1; 
%since the barker code was made causal by shifting it 12, we must make the output shift 12 as well to line up the convolution result.

figure(9)
plot(sig3n,sig2,'linewidth',2)
ylim([-5 15])
xlim([-13 length(sig2)])
xlabel('Time n')
ylabel('Signal Value')
title('p[n], Barker Code Located at x[391]')
%Since we see a spike at 391, we can estimate D to be 391.

