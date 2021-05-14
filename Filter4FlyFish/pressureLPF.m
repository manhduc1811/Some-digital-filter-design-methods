%mducng/SoC/D2/G2touch
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Change Sampling frequency from 1MHz to 1048640.4Hz
Fs                      =   1048640.4;     % 
Ts                      =   1/Fs;          % 
A0                      =   1;             % Amplitude of signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TIP pressure
f_TIP_Pressure          =   20500;       % Frequency of Pressure from Table 5
t_TIP_Pressure_start    =   7871;
t_TIP_Pressure_stop     =   9214;
t_TIP_Pressure          =   (t_TIP_Pressure_start:t_TIP_Pressure_stop-1)/Fs;
x_TIP_Pressure          =   A0/2*cos(2*pi*f_TIP_Pressure*(t_TIP_Pressure - t_TIP_Pressure_start/Fs));
% RING pressure
f_Pressure_0            =   76500;       % Frequency of Pressure 
f_Pressure_1            =   85400;       % Frequency of Pressure 
t_Pressure1_start       =   7871;
t_Pressure1_stop        =   8020;
t_Pressure2_start       =   8031;
t_Pressure2_stop        =   8180;
t_Pressure3_start       =   8190;
t_Pressure3_stop        =   8339;
t_Pressure4_start       =   8351;
t_Pressure4_stop        =   8500;
t_Pressure5_start       =   8575;
t_Pressure5_stop        =   8724;
t_Pressure6_start       =   8735;
t_Pressure6_stop        =   8884;
t_Pressure7_start       =   8895;
t_Pressure7_stop        =   9044;
t_Pressure8_start       =   9055;
t_Pressure8_stop        =   9203;
t_Pressure8_gap         =   9214;
%%Pressure
t_Pressure1             =   (t_Pressure1_start:t_Pressure1_stop-1)/Fs;
x_Pressure1             =   A0/2*cos(2*pi*f_Pressure_0*(t_Pressure1 - t_Pressure1_start/Fs));
%Pressure gap 12        
t_Pressure_GAP12        =   (t_Pressure1_stop:t_Pressure2_start-1)/Fs;
x_Pressure_GAP12        =   0*t_Pressure_GAP12;
%%Pressure2               
t_Pressure2             =   (t_Pressure2_start:t_Pressure2_stop-1)/Fs;
x_Pressure2             =   A0/2*cos(2*pi*f_Pressure_0*(t_Pressure2 - t_Pressure2_start/Fs));
%Pressure gap 23         
t_Pressure_GAP23        =   (t_Pressure2_stop:t_Pressure3_start-1)/Fs;
x_Pressure_GAP23        =   0*t_Pressure_GAP23;
%%Pressure3               
t_Pressure3             =   (t_Pressure3_start:t_Pressure3_stop-1)/Fs;
x_Pressure3             =   A0/2*cos(2*pi*f_Pressure_0*(t_Pressure3 - t_Pressure3_start/Fs));
%Pressure gap 34          
t_Pressure_GAP34        =   (t_Pressure3_stop:t_Pressure4_start-1)/Fs;
x_Pressure_GAP34        =   0*t_Pressure_GAP34;
%%Pressure4               
t_Pressure4             =   (t_Pressure4_start:t_Pressure4_stop-1)/Fs;
x_Pressure4             =   A0/2*cos(2*pi*f_Pressure_0*(t_Pressure4 - t_Pressure4_start/Fs));
%Pressure gap 45          
t_Pressure_GAP45        =   (t_Pressure4_stop:t_Pressure5_start-1)/Fs;
x_Pressure_GAP45        =   0*t_Pressure_GAP45;
%%Pressure5               
t_Pressure5             =   (t_Pressure5_start:t_Pressure5_stop-1)/Fs;
x_Pressure5             =   A0/2*cos(2*pi*f_Pressure_0*(t_Pressure5 - t_Pressure5_start/Fs));
%Pressure gap 56          
t_Pressure_GAP56        =   (t_Pressure5_stop:t_Pressure6_start-1)/Fs;
x_Pressure_GAP56        =   0*t_Pressure_GAP56;
%%Pressure6               
t_Pressure6             =   (t_Pressure6_start:t_Pressure6_stop-1)/Fs;
x_Pressure6             =   A0/2*cos(2*pi*f_Pressure_0*(t_Pressure6 - t_Pressure6_start/Fs));
%Pressure gap 67          
t_Pressure_GAP67        =   (t_Pressure6_stop:t_Pressure7_start-1)/Fs;
x_Pressure_GAP67        =   0*t_Pressure_GAP67;
%%Pressure7               
t_Pressure7             =   (t_Pressure7_start:t_Pressure7_stop-1)/Fs;
x_Pressure7             =   A0/2*cos(2*pi*f_Pressure_0*(t_Pressure7 - t_Pressure7_start/Fs));
%Pressure gap 78          
t_Pressure_GAP78        =   (t_Pressure7_stop:t_Pressure8_start-1)/Fs;
x_Pressure_GAP78        =   0*t_Pressure_GAP78;
%%Pressure8               
t_Pressure8             =   (t_Pressure8_start:t_Pressure8_stop-1)/Fs;
x_Pressure8             =   A0/2*cos(2*pi*f_Pressure_0*(t_Pressure8 - t_Pressure8_start/Fs));
%%Pressure gap 8                
t_Pressure8_gap_v       =   (t_Pressure8_stop:t_Pressure8_gap-1)/Fs;
x_Pressure8_gap         =   0*t_Pressure8_gap_v;
%%%%%%%%%%%%%%%%
t_Pressure              =   (t_Pressure1_start:t_Pressure8_gap-1)/Fs;
x_Pressure              =   [x_Pressure1, x_Pressure_GAP12, x_Pressure2, ...
    x_Pressure_GAP23,x_Pressure3, x_Pressure_GAP34, x_Pressure4, ...
    x_Pressure_GAP45, x_Pressure5, x_Pressure_GAP56, x_Pressure6, ...
    x_Pressure_GAP67, x_Pressure7, x_Pressure_GAP78, x_Pressure8, x_Pressure8_gap];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_pressure_test         =   x_TIP_Pressure + x_Pressure;
figure(1);
subplot(3,1,1);
plot(t_Pressure,x_TIP_Pressure);
axis([0.0073 0.009 -2 2]);
title('Pressure tip test signal.');
subplot(3,1,2);
plot(t_Pressure,x_Pressure);
axis([0.0073 0.009 -2 2]);
title('Pressure ring test signal.');
subplot(3,1,3);
plot(t_Pressure,x_pressure_test);
axis([0.0073 0.009 -2 2]);
title('Pressure ink test signal.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% filter lowpass design
wc                      = 60000;                       % Cutoff frequency
n                       = 6;                           % filter order = 2*n = 12
w1                      = (2*wc)/Fs;
[b, a]                  = butter(n,w1);
% plot the frequency response of designed filter
w                       = 0:0.01:pi;
[h, om]                 = freqz(b, a, w);
m                       = 20*log10(abs(h));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x_Pressure_LPF          = filter(b,a,x_pressure_test);
figure(2);
subplot(3,1,1);
plot(t_Pressure,x_pressure_test);
axis([0.0073 0.009 -2 2]);
title('Pressure tip test signal.');
subplot(3,1,2);
% plot magnitude response of designed filter:
plot(om/pi*(Fs/2), m);
ylabel('Gain (dB)');
xlabel('Frequency (Hz)');
subplot(3,1,3);
plot(t_Pressure,x_Pressure_LPF);
axis([0.0073 0.009 -2 2]);
title('Pressure LPF signal.');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Nfft                    = length(t_Pressure);
xMixedFFT               = fft(x_pressure_test,Nfft);
xFTfft                  = fft(x_Pressure_LPF,Nfft);
dF                      = Fs/Nfft;
fVectors                = (1:1:Nfft)*dF;
figure(3);
subplot(2,2,1);
plot(t_Pressure,x_pressure_test);
subplot(2,2,2);
plot(fVectors,abs(xMixedFFT/Nfft));
subplot(2,2,3);
plot(t_Pressure,x_Pressure_LPF);
subplot(2,2,4);
plot(fVectors,abs(xFTfft/Nfft));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fileIDf_a              = fopen('FilterA.txt','w');
fprintf(fileIDf_a,'%d\n',a);
fclose(fileIDf_a);
fileIDf_b              = fopen('FilterB.txt','w');
fprintf(fileIDf_b,'%d\n',b);
fclose(fileIDf_b);
fileIDf_c              = fopen('x_pressure_test.txt','w');
fprintf(fileIDf_c,'%d\n',x_pressure_test);
fclose(fileIDf_c);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
