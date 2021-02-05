%mducng/SoC/D2/G2touch
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
length      = 300;
wform       = ecg(length);
x           = wform' + 0.2*randn(length,1);
d           = designfilt('lowpassfir', 'PassbandFrequency',0.15,...
    'StopbandFrequency',0.2, 'PassbandRipple',1,'StopbandAttenuation',60,...
    'DesignMethod','equiripple');
y           = filtfilt(d,x);
y1          = filter(d,x);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,1);
plot(wform);
title('Original Waveform');
axis([0 500 -1.25 1.25]);
text(155,-0.4,'Q');
text(180,1.1,'R');
text(205,-1,'S');
rng default;
%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,2);
plot(x);
title('Waveform + Noise ');
axis([0 500 -1.25 1.25]);
%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(3,1,3);
plot([y y1]);
title('Filtered Waveforms');
legend('Zero-phase Filtering','Conventional Filtering');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%