# 3.1 Nulling Filters for Rejection

## Introduction
The goal of this lab is to study the response of FIR filters to inputs such as complex exponentials and sinusoids. As a result, we should learn how to characterize a filter by knowing how it reacts to different frequency components in the input. This lab also introduces two practical filters: bandpass filters and nulling filters. Bandpass filters can be used to detect and extract information from sinusoidal signals, e.g., tones in a touch-tone telephone dialer. Nulling filters can be used to remove sinusoidal interference, e.g., jamming signals in a radar. 

## Nulling Filters
Nulling filters are filters that completely eliminate some frequency component. If the frequency is $\omega = 0$ or $\omega = \pi$, then a two-point FIR filter will do the nulling. The simplest possible general nulling filter can have as few as three coefficients. If $\omega_{n}$ is the desired nulling frequency, then the following length-3 FIR filter will be in the form:
y[n] = x[n] - 2cos($\omega_{n}$)x[n-1] + x[n-2]
