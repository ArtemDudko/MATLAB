%%simulate a voltage controlled oscillator of PLL type

fc = 800000; %% 800KHz
Tpll = 0.001;

%% set the phase of the local oscillator
theta(1) = pi / 4;   %EDIT ME 1
eta = 0.1;
% set the recieve power of the message signal 
Pm = 0.1;  %Watts




%% Set the phase of the incoming RF signal at the antenna (this is not known to me, rather it
% is seen through through cos(theta - phi) * sin(theta - phi)

phi = pi * 0.22; % EDIT ME 2

N = 1000;
for k = 2:N;       %going to run this PLL over a dutaion of time NTpll
   
    %first thing I get from in phase channel is 
    csdif(k) = cos(theta(k - 1) - phi);
    sndif(k) = sin(theta(k - 1) - phi);
    voltvco(k) = eta * Pm * csdif(k) * sndif(k);
    
    % Now simulate what the VCO does with te local oscillator phase based
    % on its VCO input
    theta(k) = theta(k-1) - voltvco(k);
    
    antennacarr(k) = cos(2*pi*fc*k*Tpll-phi);
    vcocarr(k) = cos(2*pi*fc*k*Tpll-theta(k));
end




time = [1:N]*Tpll;
figure(1)
plot(time,(180/pi)*phi*ones(size(time)),time,theta*180/pi)
ylim([40 70])

figure(2)
plot(time,antennacarr,time,vcocarr)

% must be close enough in the fisrt place to begin converging
% will solve double sideband on tuesday







