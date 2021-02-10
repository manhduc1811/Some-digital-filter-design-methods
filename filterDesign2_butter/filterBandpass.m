%mducng/SoC/D2/G2touch
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filter design
fs          = 1000000;                              % sampling frequency (Hz)
wp          = 60000;                                % passband frequency
ws          = 100000;                               % stopband frequency
n           = 6;                                    % filter order = 2*n = 12
w1          = (2 * wp)/fs;
w2          = (2 * ws)/fs;
wn          = [w1, w2];
[b, a]      = butter(n, wn, 'bandpass');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
w           = 0:0.01:pi;
[h, om]     = freqz(b, a, w);
m           = 20*log10(abs(h));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% create signal and check response
f1          = 80000;                                % wanted frequency
fn          = 150000;                               % noise frequency 
dt          = 1/fs;
t           = (0:1:100)*dt;
Nfft        = length(t);
xMixed      = 1*sin(2*pi*f1*t) + 1*sin(2*pi*fn*t);
xFT         = filter(b,a,xMixed);
xMixedFFT   = fft(xMixed,Nfft);
xFTfft      = fft(xFT,Nfft);
dF          = fs/length(xMixed);
fVectors    = (0:1:100)*dF;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% plot magnitude response of designed filter:
figure(1); 
plot(om/pi*(fs/2), m);
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
% write data to file
% fileID = fopen('data_2k.txt','w');
% fprintf(fileID, '%f\n', x);
% fclose(fileID);