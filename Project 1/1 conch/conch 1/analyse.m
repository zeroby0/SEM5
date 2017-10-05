pkg load signal

[y, Fs] = audioread('snailhorn.wav');

x = fft(y);
N = length(y);

freqHz = (0:1:(length(x) - 1)).*Fs/N;

Frequencies = freqHz(1:length(freqHz)/2);
Amplitudes = abs(x)(1:length(x)/2);

plot(Frequencies, Amplitudes);
xlim([0, 1200]);

hold on;

[pks, locs] = findpeaks(Amplitudes, "MinPeakHeight", 5000, "MinPeakDistance", 500);
% arrays of indices

% locs = locs(find(pks > 50));
% pks = pks(find(pks > 50));

plot(Frequencies(locs), pks, '*');
xlim([0, 900])
print -dpng pkss.png