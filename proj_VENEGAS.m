%% Project - Frequency Response of FIR Filters
%  David Venegas
%  u0934702
%  ECE 6530: Digital Signal Processing
%  University of Utah
%% P-12: Frequency Response: Bandpass & Nulling Filters 

% The goal of this lab is to study the response of FIR filters to inputs such 
% as complex exponentials and sinusoids. In the experiments of this lab, you 
% will use firfilt(), or conv(), to implement filters and freqz() to obtain 
% the filter's frequency response. As a result, you should learn how to 
% characterize a filter by knowing how it reacts to different frequency 
% components in the input. This lab also introduces two practical filters: 
% bandpass filters and nulling filters. Bandpass filters can be used to detect 
% and extract information from sinusoidal signals, e.g., tones in a touch-tone 
% telephone dialer. Nulling filters can be used to remove sinusoidal interference, 
% e.g., jamming signals in a radar. 

%% 3.1 Nulling Filters for Rejection
clc;clear;
%% (a).

% Design a filtering system that consists of the cascade of two FIR nulling 
% filters that will eliminate the following input frequencies: ω = 0.44π, and ω = 0.7π.
% For this part, derive the filter coefficients of both nulling filters.


    % Basic FIR Nulling Filter: y[n] = x[n] - 2cos(ω)x[n-1] + x[n-2]
    w = -pi:pi/100:pi;
    z = exp(1j*w);

    % Coefficients
    b0 = 1;
    b1 = 0;     % b1 = -2cos(ω) = 0   nulling coefficient
    b2 = 1;
    b = [1 0 1];

    % To block ω = 0.44π:
    wn1 = 0.44*pi;
    H1 = 1 - (2*cos(wn1))*(z.^-1) + (z.^-2);

    % To block ω = 0.44π:
    wn2 = 0.7*pi;
    H2 = 1 - (2*cos(wn2))*(z.^-1) + (z.^-2);

%% (b) 

% Generate an input signal x[n] that is the sum of three sinusoids:


