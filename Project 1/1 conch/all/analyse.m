pkg load signal

[y, Fs] = audioread('1.wav');

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
xlim([0, 1200])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [y, Fs] = audioread('2.wav');

% x = fft(y);
% N = length(y);

% freqHz = (0:1:(length(x) - 1)).*Fs/N;

% Frequencies = freqHz(1:length(freqHz)/2);
% Amplitudes = abs(x)(1:length(x)/2);

% Amplitudes = Amplitudes.*1;

% plot(Frequencies, Amplitudes);
% xlim([0, 1200]);



% [pks, locs] = findpeaks(Amplitudes, "MinPeakHeight", 500, "MinPeakDistance", 100);
% % arrays of indices

% % locs = locs(find(pks > 50));
% % pks = pks(find(pks > 50));

% plot(Frequencies(locs), pks, '*');
% xlim([0, 900])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[y, Fs] = audioread('3.wav');

x = fft(y);
N = length(y);

freqHz = (0:1:(length(x) - 1)).*Fs/N;

Frequencies = freqHz(1:length(freqHz)/2);
Amplitudes = abs(x)(1:length(x)/2);

plot(Frequencies, Amplitudes);
xlim([0, 1200]);

hold on;


[pks, locs] = findpeaks(Amplitudes, "MinPeakHeight", 5000, "MinPeakDistance", 100);
% arrays of indices

% locs = locs(find(pks > 50));
% pks = pks(find(pks > 50));

plot(Frequencies(locs), pks, '*');
xlim([0, 1200])


print -dpng all.png
