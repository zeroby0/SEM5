%% analyse: Gets time and FFT plottable
function [time_clipped, signal_clipped, freq, mag] = analyse(time, signal, lowerLimit, upperLimit, samplingFrequency)
	[time_clipped, signal_clipped] = clipSignal(time, signal, lowerLimit, upperLimit);
	[freq, mag] = getFFT(signal_clipped, samplingFrequency);
end