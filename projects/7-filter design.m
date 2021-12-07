%% Simon Yoon ECE210AHW7

clc
clear
close all

% most definitely could've made functions instead of 
% copy and pasting over and over again, but I was running
% into a ridiculous amount of stupid errors, so I somewhat 
% brute forced it to get it to work first.

%% Signal Gen
f = 1:50000;
t = 0:0.001:2;
[F, T] = meshgrid(f,t);
signal = sin(2*pi*(F.*T)); 
signal = sum(signal,1); 
%% Butterworth Bandpass

n = 1024;
[H,f] = freqz(ButterworthBandpass, n , 100000);
Magnitude = 20*log10(abs(H));
Phase = rad2deg(unwrap(angle(H)));

figure;
subplot(2,1,1);
plot(f, Magnitude);
xlim([0 50000]);
xlabel("Frequency (Hz)");
ylabel("Magnitude (decibels)");
title("Magnitude Response");

subplot(2,1,2)
plot(f, Phase);
xlim([0 50000]);
xlabel("Frequency (Hz)");
ylabel("Phase (degrees)");
title("Phase Response");

buttersig = filter(ButterworthBandpass,signal);
fourierbbp = fft(buttersig, n);
shiftedfourierbbp = fftshift(abs(fourierbbp))/n;

figure
plot(f,shiftedfourierbbp)
title('Fourier Transform of Signal through Butterworth Bandpass Filter')
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')

%% Chebychev I Bandstop

[H,f] = freqz(ChebychevIBandstop, n , 100000);
Magnitude = 20*log10(abs(H));
Phase = rad2deg(unwrap(angle(H)));

figure;
subplot(2,1,1);
plot(f, Magnitude);
xlim([0 50000]);
xlabel("Frequency (Hz)");
ylabel("Magnitude (decibels)");
title("Magnitude Response");

subplot(2,1,2)
plot(f, Phase);
xlim([0 50000]);
xlabel("Frequency (Hz)");
ylabel("Phase (degrees)");
title("Phase Response");

chebyibp= filter(ChebychevIBandstop, signal);
fouriercibs= fft(chebyibp, n);
shiftedfouriercibs = fftshift(abs(fouriercibs))/n;

figure
plot(f,shiftedfouriercibs)
title('Fourier Transform of Signal through Chebyshev I Bandstop Filter')
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')

%% Chebychev II Highpass

[H,f] = freqz(ChebychevIIHighpass, n , 100000);
Magnitude = 20*log10(abs(H));
Phase = rad2deg(unwrap(angle(H)));

figure;
subplot(2,1,1);
plot(f, Magnitude);
xlim([0 50000]);
xlabel("Frequency (Hz)");
ylabel("Magnitude (decibels)");
title("Magnitude Response");

subplot(2,1,2)
plot(f, Phase);
xlim([0 50000]);
xlabel("Frequency (Hz)");
ylabel("Phase (degrees)");
title("Phase Response");

chebyiihp= filter(ChebychevIIHighpass, signal);
fourierciihp= fft(chebyiihp, n);
shiftedfourierciihp = fftshift(abs(fourierciihp))/n;

figure
plot(f,shiftedfourierciihp)
title('Fourier Transform of Signal through Chebyshev II Highpass Filter')
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')

%% Elliptic Lowpass

[H,f] = freqz(EllipticLowpass, n , 100000);
Magnitude = 20*log10(abs(H));
Phase = rad2deg(unwrap(angle(H)));

figure;
subplot(2,1,1);
plot(f, Magnitude);
xlim([0 50000]);
xlabel("Frequency (Hz)");
ylabel("Magnitude (decibels)");
title("Magnitude Response");

subplot(2,1,2)
plot(f, Phase);
xlim([0 50000]);
xlabel("Frequency (Hz)");
ylabel("Phase (degrees)");
title("Phase Response");

ellipticlp = filter(EllipticLowpass, signal);
fourierelp= fft(ellipticlp, n);
shiftedfourierelp = fftshift(abs(fourierelp))/n;

figure
plot(f,shiftedfourierelp)
title('Fourier Transform of Signal through Elliptic Lowpass Filter')
xlabel('Frequency (Hz)')
ylabel('Magnitude (dB)')