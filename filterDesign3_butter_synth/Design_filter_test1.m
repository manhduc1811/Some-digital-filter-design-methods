%https://www.embeddedrelated.com/showarticle/1119/design-iir-butterworth-filters-using-12-lines-of-code
%mducng/SoC/D2/G2touch
clc;
clear;
close all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
N             = 2;                            % Filter order
fc            = 1000;                         % Hz cutoff freq
fs            = 48000;                        % Hz sample freq
[b,a]         = Design_butter_synth(N,fc,fs);
