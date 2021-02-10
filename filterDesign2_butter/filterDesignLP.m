%mducng/SoC/D2/G2touch
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filter lowpass design
Fs                      = 1000000;                     % sampling frequency (Hz)
wc                      = 30000;                       % Cutoff frequency
n                       = 6;                           % filter order = 2*n = 12
w1                      = (2*wc)/Fs;
[b, a]                  = butter(n,w1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w                       = 0:0.01:pi;
[h, om]                 = freqz(b, a, w);
m                       = 20*log10(abs(h));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create signal and check response
f1                      = 19000;                       % wanted frequency 1
fn                      = 80000;                       % noise frequency 
dt                      = 1/Fs;
t                       = (0:1:1000)*dt;
Nfft                    = length(t);
xMixed                  = 1*sin(2*pi*f1*t) + 1*sin(2*pi*fn*t);
xFT                     = filter(b,a,xMixed);
xMixedFFT               = fft(xMixed,Nfft);
xFTfft                  = fft(xFT,Nfft);
dF                      = Fs/length(xMixed);
fVectors                = (1:1:Nfft)*dF;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot magnitude response of designed filter:
figure(1); 
plot(om/pi*(Fs/2), m);
ylabel('Gain (dB)');
xlabel('Frequency (Hz)');
% plot mixed signal and filtered signal:
figure(2);
subplot(2,1,1);
plot(t,xMixed);
hold on;
plot(t,xFT);
legend('Mixed signal.','Filtered signal.');
figure(3);
subplot(2,2,1);
plot(t,xMixed);
subplot(2,2,2);
plot(fVectors,abs(xMixedFFT/Nfft));
subplot(2,2,3);
plot(t,xFT);
subplot(2,2,4);
plot(fVectors,abs(xFTfft/Nfft));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
