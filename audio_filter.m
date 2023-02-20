clear
clc

%Read audio file
[y,Fs] = audioread('input3.wav');

%Design filter - Only uncomment the required filter and change parameters as necessary
%Lowpass FIR filter
f = designfilt('lowpassfir', 'PassbandFrequency', 480, 'StopbandFrequency', 500, 'PassbandRipple', 1, 'StopbandAttenuation', 60, 'SampleRate', Fs);
%Highpass FIR filter
%f = designfilt('highpassfir', 'StopbandFrequency', 2580, 'PassbandFrequency', 2600, 'StopbandAttenuation', 60, 'PassbandRipple', 1, 'SampleRate', Fs);
%Bandpass FIR filter
%f = designfilt('bandpassfir', 'StopbandFrequency1', 980, 'PassbandFrequency1', 1000, 'PassbandFrequency2', 1200, 'StopbandFrequency2', 1220, 'StopbandAttenuation1', 60, 'PassbandRipple', 1, 'StopbandAttenuation2', 60, 'SampleRate', Fs);

%Show filter
fvtool(f);

%Apply filter
y_filtered = filter(f,y);

%Write output
audiowrite('output3.wav',y_filtered,Fs);

%Plot input and output waveforms and spectra
subplot(2,2,1);
plot(y);
title('Input Waveform')
subplot(2,2,2);
spectrogram(y);
title('Input Spectrum');
subplot(2,2,3);
plot(y_filtered);
title('Output Waveform');
subplot(2,2,4);
spectrogram(y_filtered);
title('Output Spectrum')
