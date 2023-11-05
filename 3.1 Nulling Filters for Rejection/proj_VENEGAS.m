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
    w = -pi:(2*pi)/149:pi;
    z = exp(1j*w);

    % Coefficients
    b0 = 1;
    b1 = 0;     % b1 = -2cos(ω) = 0   nulling coefficient
    b2 = 1;
    b = [1 0 1];

    % To block ω = 0.44π:
    wn1 = 0.44*pi;
    H1 = 1 - (2*cos(wn1))*(z.^-1) + (z.^-2);

    % To block ω = 0.7π:
    wn2 = 0.7*pi;
    H2 = 1 - (2*cos(wn2))*(z.^-1) + (z.^-2);

    % Cascaded FIR Filter
    H = H1.*H2;

%% (b) 

% Generate an input signal x[n] that is the sum of three sinusoids:
% x[n] = 5cos(0.3πn) + 22cos(0.44πn - π/3) + 22cos(0.7πn - π/4)
    
    % Make the input signal 150 samples long over the range 0 ≤ n ≤ 149.
    n = 0:149;
    x = 5*cos(0.3*pi*n) + 22*cos((0.44*pi*n) - (pi/3)) + 22*cos((0.7*pi*n) - (pi/4));
    
    N = 100;
    X = dfs(x,N);

%% (c)

% Filter the sum of three sinusoids signal x[n] through the filters designed
% in part (a). Show the MATLAB code that you wrote to implement the cascade 
% of two FIR filters.

    Y = H .* X;

%% (d)

% Make a plot of the output signal—show the first 40 points. Determine 
% (by hand) the exact mathematical formula (magnitude, phase and frequency) 
% for the output signal for n ≥ 5.
    
    y = idfs(Y,N);

    X_mag = abs(X);
    X_phase = angle(X);

    H_mag = abs(H);
    H_phase = angle(H);

    Y_mag = abs(Y);
    Y_phase = angle(Y);
    
    figure(1)
    subplot(3,1,1)
    plot(w, X_mag);
    title("X(ω)");
    grid on;
    xlim([-pi pi]);
    xticks([-pi -0.7*pi -0.44*pi 0  0.44*pi 0.7*pi pi])
    xticklabels({'-\pi','-0.7\pi','-0.44\pi','0','0.44\pi','0.7\pi','\pi'});
    
    subplot(3,1,2)
    plot(w, H_mag);
    title("H(ω)");
    grid on;
    xlim([-pi pi]);
    xticks([-pi -0.7*pi -0.44*pi 0  0.44*pi 0.7*pi pi])
    xticklabels({'-\pi','-0.7\pi','-0.44\pi','0','0.44\pi','0.7\pi','\pi'});
   
    subplot(3,1,3)
    plot(w, Y_mag);
    xlim([-pi pi]);
    title("Y(ω)");
    xlabel("ω");
    xticks([-pi -0.7*pi -0.44*pi 0  0.44*pi 0.7*pi pi])
    xticklabels({'-\pi','-0.7\pi','-0.44\pi','0','0.44\pi','0.7\pi','\pi'});
    grid on;

    figure(2)
    hold on
    plot(n, abs(y),'r');
    stem(n, abs(y));
    xlim([0 40]);
    xlabel("n");
    ylabel("y[n]");
    title("Output Signal y[n]")
    grid on;

%% Exact Formula for y[n]

% Find the response H(ω) for For ω = [0.3π, 0.44π, 0.7π]
w = [0.3*pi, 0.44*pi, 0.7*pi];
H = 1 - 2*cos(0.7*pi)*exp(-1j*w)  + 2*exp(-1j*2*w)...
    - (exp(-1j*w) + exp(-1j*3*w))*2*cos(0.44*pi)...
    + 4*cos(0.44*pi)*cos(0.7*pi)*exp(-1j*2*w)...
    - (exp(-1j*w) + exp(-1j*3*w))*2*cos(0.7*pi) + exp(-1j*4*w);

H_ph_deg = (angle(H)*180) /pi;
H_ph_rad = angle(H);
H_ph_mag = abs(H);

% Exact y[n]
y_exct = 5*cos((0.3*pi*n) + H_ph_rad(1))*H_ph_mag(1)...
  + 22*cos((0.44*pi*n) - (pi/3) + H_ph_rad(2))*H_ph_mag(2)...
  + 22*cos((0.7*pi*n) - (pi/4) + H_ph_rad(3))*H_ph_mag(3);

y_exct_mag = abs(y_exct);

% Plot y[n]
figure(3)
hold on
plot(n, y_exct_mag);
plot(n,abs(y));
xlim([5 40]);
grid on;
hold off

%% TEST 1

% Basic FIR Nulling Filter: y[n] = x[n] - 2cos(ω)x[n-1] + x[n-2]
    k = 0:149;
    N = 100;
    w = (2*pi*k)/N;

    % To block ω = 0.44π:
    H1 = 1 - (2*cos(0.44*pi))*exp(-1j*w) + exp(-1j*w*2);

    % To block ω = 0.7π:
    H2 = 1 - (2*cos(0.7*pi))*exp(-1j*w) + exp(-1j*w*2);

    % Cascaded FIR Filter
    H = H1.*H2;

    % Generate an input signal x[n] that is the sum of three sinusoids:
    % x[n] = 5cos(0.3πn) + 22cos(0.44πn - π/3) + 22cos(0.7πn - π/4)
    n = 0:149;
    x = 5*cos(0.3*pi*n) + 22*cos((0.44*pi*n) - (pi/3)) + 22*cos((0.7*pi*n) - (pi/4));
    N = 100;

    X = dfs(x,N);

    % System Response 
    % Y[k]
    Y = X .* H;
    % y[n]
    y = idfs(Y,N);

    %Plots

    figure(1)
    subplot(3,1,1)
    plot(w,abs(X));
    title('|X(ω)|');
    xticks([0  0.3*pi 0.44*pi 0.7*pi pi pi+0.3*pi pi+0.44*pi pi+0.7*pi 2*pi])
    xticklabels({'0','0.3\pi','0.44\pi','0.7\pi','\pi','0.7\pi','0.44\pi','0.3\pi','2\pi'});
    xlim([0 2*pi]);
    grid on;

    subplot(3,1,2)
    plot(w,abs(H));
    title('|H(ω)|');
    xticks([0  0.3*pi 0.44*pi 0.7*pi pi pi+0.3*pi pi+0.44*pi pi+0.7*pi 2*pi])
    xticklabels({'0','0.3\pi','0.44\pi','0.7\pi','\pi','0.7\pi','0.44\pi','0.3\pi','2\pi'});
    xlim([0 2*pi]);
    grid on;

    subplot(3,1,3)
    plot(w,abs(Y));
    title('|Y(ω)|');
    xticks([0  0.3*pi 0.44*pi 0.7*pi pi pi+0.3*pi pi+0.44*pi pi+0.7*pi 2*pi])
    xticklabels({'0','0.3\pi','0.44\pi','0.7\pi','\pi','0.7\pi','0.44\pi','0.3\pi','2\pi'});
    xlim([0 2*pi]);
    xlabel('ω = 2\pik/N');
    grid on;
    

%% TEST 2
w = [0 0.3*pi, 0.44*pi, 0.7*pi];
% 0.44pi
H1 = 1 - (2*cos(0.44*pi))*exp(-1j*w) + exp(-1j*w*2);
H2 = 1 - (2*cos(0.7*pi))*exp(-1j*w) + exp(-1j*w*2);
H = H1 .* H2;

H_ph_mag = abs(H);
H_ph_rad = angle(H);


% Exact y[n]
y_tr = H_ph_mag(1);
y_ss = ...
  + 5*cos((0.3*pi*n) + H_ph_rad(2))*H_ph_mag(2)...
  + 22*cos((0.44*pi*n) - (pi/3) + H_ph_rad(3))*H_ph_mag(3)...
  + 22*cos((0.7*pi*n) - (pi/4) + H_ph_rad(4))*H_ph_mag(4);

y_exact = y_tr + y_ss;

% Plot y[n]
figure(3)
hold on
plot(n, abs(y_exact));
plot(n, abs(y));
xlim([0 150]);
legend('Exact Signal y[n]','Filtered Signal y[n]');
grid on;
hold off


%% Matlab Functions
function matlab_bug()
    % (IGNORE)
    % This is a dummy function that fixes Matlab bug #496201
    % where outputs are being printed in the end of the publishing html
    % instead of their respective sections.
    workaround()
    %%The answer to everything is...
    my_subfunction();
    % (IGNORE)
end

function DFS = dfs(x, N)

    % Compute the Discrete Fourier Series (DFS) coefficients of a periodic 1-D 
    % signal, where x is one period of the signal and N is the fundamental period.

    % Find vector x(n) number of elements
    x_length = numel(x);
    % Generate discrete n-numbers based on x(n)
    n = 0:x_length-1;
    % Preallocate array ck
    ck = zeros(size(x));

    for k = 0:x_length-1

        ck(k+1) = (1/N) * sum(x(n+1) .* exp((-1j*2*pi*k*n)/N));

    end
    
    DFS = conj(ck);
end

function IDFS = idfs(ck, N)
    
    % Compute the Inverse Discrete Fourier Series (IDFS), where X is the 
    % DFS coefficient array and N is the fundamental period.
    
    % Find vector c(k) number of elements
    ck_length = length(ck);
    % Generate discrete k-numbers based on c(k)
    k = 0:ck_length-1;
    % Preallocate array ck
    x = zeros(size(ck));

    for n = 0:ck_length-1

        x(n+1) = sum(ck(k+1) .* exp((1j.*2.*pi.*k.*n)./N));

    end
    
    IDFS = x;
end
