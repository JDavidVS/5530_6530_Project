# ECE 6530 Digital Signal Processing - Semester Project
ECE 6530: Digital Signal Processing
University of Utah

Team:
-David Venegas
-Ahmed Almusawi
-Quinn Alleman

## Frequency Response of FIR Filters

The frequency response function for FIR filters is introduced. The magnitude and phase versus frequency govern the response of sinusoidal input signals through the filter. Thus frequency-selective filtering is possible, and the running average filter is shown to be a lowpass filter.

## Project Contents
- [2.3 Removing Interference from a Speech Signal](<2.3 Removing Interference from a Speech Signal/SectionDescription.md>)
    - [Link to Reference](<http://dspfirst.gatech.edu/chapters/06firfreq/overview.html>)
- [3.1 Nulling Filters for Rejection](<3.1 Nulling Filters for Rejection/nulling.md>)
    - [Link to Reference](<https://dspfirst.gatech.edu/chapters/06firfreq/labs/BPFnullingFilters/BPFnullingFilters.pdf>)
- [3.2 Simple Bandpass Filter Design](<3.2 Simple Bandpass Filter Design/SectionDescription.md>)
    - [Link to Reference](<https://dspfirst.gatech.edu/chapters/06firfreq/labs/BPFnullingFilters/BPFnullingFilters.pdf>)


# To-Do List:
- Make sure all matlab documents are added
    - html published files
    - .m files
- Supporting documents and sources
- Add figures that will be used in the presentation/poster
- Come up with what is going to be said



# Poster Sections Plan

## Background

For digital signal processing, frequency selective filters play a crucial role. These filters can help reduce specific frequency components of the signals. Two of these filters are the nulling filter, which is designed to suppress unwanted frequencies, and the bandpass filter, which isolates a specific range of frequencies to allow.

Traditional methods of implementing these filters often encounter limitations, such as phase distortion and a lack of flexibility in adapting to different signal conditions. Finite Impulse Response (FIR) filters emerge as a robust alternative, offering distinct advantages in both nulling and bandpass applications.

In speech signal processing, bandpass FIR filters isolate the frequencies pertinent to human speech, enhancing clarity and intelligibility. Meanwhile, nulling FIR filters suppress noise and interference.

## Introduction

Our project explores various applications for Finite Impulse Response (FIR) filters. We have focused on their behavior as nulling filters and bandpass filters for discrete signals.

## Nulling Filters for Rejection (3.1)

## Simple Bandpass Filter Design (3.2)

## Removing Interferance from a Speech Signal (2.3)
- 3 structure figures
- 3 graphs from matlab

## Summary/Conclusion

- **Need to add in the conclusion.**

## References 

*[1] J. G. Proakis, D. G. Manolakis, Digital Signal Processing: Principles, Algorithms, and Applications 4rd Ed. Upper Saddle River, NJ: Pearson Prentice Hall, 2006.*

*[2] DPS First 2e Georgia Tech, “Frequency Response: Bandpass and Nulling Filters,” Georgia Tech. [Online]. Available: https://dspfirst.gatech.edu/chapters/06firfreq/labs/BPFnullingFilters/BPFnullingFilters.pdf. [Accessed: Dec. 3, 2023].*

*[3] DPS First 2e Georgia Tech, “DLTI GUI and Nulling Filters,” Georgia Tech. [Online]. Available: https://dspfirst.gatech.edu/chapters/06firfreq/labs/DLTInulling/DLTInulling.pdf. [Accessed: Dec. 3, 2023].*