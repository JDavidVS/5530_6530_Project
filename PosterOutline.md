# Poster Outline

## Background

For digital signal processing, frequency selective filters play a crucial role. These filters can help reduce specific frequency components of the signals. Two of these filters are the nulling filter, which is designed to suppress unwanted frequencies, and the bandpass filter, which isolates a specific range of frequencies to allow.

Traditional methods of implementing these filters often encounter limitations. Finite Impulse Response (FIR) filters emerge as a robust alternative, offering distinct advantages in both nulling and bandpass applications. In speech signal processing, bandpass FIR filters isolate the frequencies pertinent to human speech, enhancing clarity and intelligibility. Meanwhile, nulling FIR filters suppress noise and interference.

## Introduction

Our project explores various applications for Finite Impulse Response (FIR) filters. We have focused on their behavior as nulling filters and bandpass filters for discrete signals and how they can be applied to speech signals.

## Nulling Filters for Rejection (3.1)
![image](https://github.com/JDavidVS/5530_6530_Project/assets/148792714/e3ab55ef-c63c-46bb-bf77-764062de67a3)

## Simple Bandpass Filter Design (3.2)
![image](https://github.com/JDavidVS/5530_6530_Project/assets/148792714/bf6c7961-b4d8-488d-898b-c1e3d4ce4b8b)

## Removing Interferance from a Speech Signal (2.3)
![image](https://github.com/JDavidVS/5530_6530_Project/assets/148792714/3d221607-cd27-4592-8822-0bb847b56d38)

- 3 structure figures
- 3 graphs from matlab
## Summary/Conclusion

In the realm of digital signal processing, digital frequency selective filters are designed to selectively pass or attenuate specific frequency components of a digital signal, allowing for precise control over the frequency response characteristics. FIR filters are characterized by their linear phase response, which means that they introduce a constant delay across all frequencies. This property is particularly advantageous in applications where preserving the phase relationship of the signal is crucial, such as in audio processing or telecommunications. FIR filters offer flexibility in designing the desired frequency response. By adjusting the filter coefficients, one can shape the filter's response to meet specific requirements. 

This flexibility allows for tasks such as noise reduction, signal enhancement, and signal separation, where specific frequency components need to be emphasized or suppressed. Moreover, FIR filters can be implemented efficiently using various algorithms, such as the windowing method or the Frequency Sampling method. These algorithms enable the design of FIR filters with desired frequency response characteristics while optimizing for factors like filter length and computational complexity. In summary, FIR filters are an essential tool in digital signal processing, providing precise control over the frequency response of a signal. Their linear phase response, stability, and flexibility make them suitable for a wide range of applications, from audio processing to telecommunications.


## References 

*[1] J. G. Proakis, D. G. Manolakis, Digital Signal Processing: Principles, Algorithms, and Applications 4rd Ed. Upper Saddle River, NJ: Pearson Prentice Hall, 2006.*

*[2] DPS First 2e Georgia Tech, “Frequency Response: Bandpass and Nulling Filters,” Georgia Tech. [Online]. Available: https://dspfirst.gatech.edu/chapters/06firfreq/labs/BPFnullingFilters/BPFnullingFilters.pdf. [Accessed: Dec. 3, 2023].*

*[3] DPS First 2e Georgia Tech, “DLTI GUI and Nulling Filters,” Georgia Tech. [Online]. Available: https://dspfirst.gatech.edu/chapters/06firfreq/labs/DLTInulling/DLTInulling.pdf. [Accessed: Dec. 3, 2023].*
