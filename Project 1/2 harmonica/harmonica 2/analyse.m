pkg load signal

[y, Fs] = audioread('sound.wav');

x = fft(y);
N = length(y);

freqHz = (0:1:(length(x) - 1)).*Fs/N;

Frequencies = freqHz(1:length(freqHz)/2);
Amplitudes = abs(x)(1:length(x)/2);

plot(Frequencies, Amplitudes);
xlim([500, 1100]);

hold on;

[pks, locs] = findpeaks(Amplitudes, "MinPeakHeight", 700, "MinPeakDistance", 100);
% arrays of indices

% locs = locs(find(pks > 50));
% pks = pks(find(pks > 50));

plot(Frequencies(locs), pks, '*');
xlim([500, 1100])
print -dpng pkss.png