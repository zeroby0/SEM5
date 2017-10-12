%% getFFT: Returns FFT, ready to be plotted
function [freq, mag] = getFFT(signal, samplingFrequency)
	Fs = samplingFrequency;
	x = fft(signal);
	N = length(signal);
	freqHz = (0:1:(length(x) - 1)).*Fs/N;
	freq = freqHz(1:length(freqHz)/2);
	mag = abs(x)(1:length(x)/2);
end
