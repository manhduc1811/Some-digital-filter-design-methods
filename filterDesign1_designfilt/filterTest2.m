%mducng/SoC/D2/G2touch
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
wform   = ecg(500);
x       = wform' + 0.25*randn(500,1);
d1      = designfilt('lowpassiir','FilterOrder',12, 'HalfPowerFrequency',...
    0.15,'DesignMethod','butter');
y       = filtfilt(d1,x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,1);
plot(wform);
axis([0 500 -1.25 1.25]);
text(155,-0.4,'Q');
text(180,1.1,'R');
text(205,-1,'S');
rng default;
%%%%%%%%%%%%%%%%%
subplot(3,1,2);
plot(x);
axis([0 500 -1.25 1.25]);
%%%%%%%%%%%%%%%%%
subplot(3,1,3);
plot(x);
hold on
plot(y,'LineWidth',3);
legend('Noisy ECG','Zero-Phase Filtering');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%