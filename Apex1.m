%% [ARTEM DUDKO] - [Apex Project] - [10/8/2022]

%% [RoF Test]

T = 4000;    %total ms
t = 1:T;


% R3 vs Flatline
R3_RPM = 810;
R3_DMG = 14;
R3_RPS = 810 / 60;
R3_RPMS = 810 / 60000;
R3_GRPH = 1:T;

for i = 1:T
R3_GRPH(i) = floor(i * R3_RPMS) * R3_DMG + R3_DMG;
end

Flat_RPM = 600;
Flat_DMG = 18;
Flat_RPS = 600/60;
Flat_RPMS = 600/60000;
Flat_GRPH = 1:4000;

for i = 1:T
Flat_GRPH(i) = floor(i * Flat_RPMS) * Flat_DMG + Flat_DMG;
end

% Repeater 1 Fast vs Repeater 2 Slow


Rep1_DMG = 42
Rep1_RPS = 3.85
Rep1_RPMS = Rep1_RPS / 1000
Rep1_GRPH = 1:T;


for i = 1:T
Rep1_GRPH(i) = floor(i * Rep1_RPMS) * Rep1_DMG + Rep1_DMG;
end

Rep2_DMG = 57;
Rep2_RPS = 1 / ((1/Rep1_RPS) + 0.35)     %    1/[(1/SPR)+0.3]
Rep2_RPMS = Rep2_RPS / 1000
Rep2_GRPH = 1:T;

for i = 1:T
Rep2_GRPH(i) = floor(i * Rep2_RPMS) * Rep2_DMG + Rep2_DMG;
end

%R3_color = "#D95319";

figure(1)
plot(t,R3_GRPH,'color',[0.9290 0.6940 0.1250])
ylim([0 250])
xlim([0 2000])
hold on
yline(225,"red")
yline(200,"magenta")
plot(t,Flat_GRPH,'color',[0 184/255 156/255])
hold off

figure(2)
plot(t,Rep1_GRPH,'color',[0.9290 0.6940 0.1250])
ylim([0 250])
xlim([0 4000])
hold on
yline(225,"red")
yline(200,"magenta")
plot(t,Rep2_GRPH,'color',[0 184/255 156/255])
hold off









