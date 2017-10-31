%% getFFT: function description
function [freq, ampl] = getFFT(wave, dt)
	WAVE = fft(wave);
	fs = 1/dt;

	freq = -fs/2:fs/(length(WAVE) - 1):fs/2;
	ampl = fftshift(abs(WAVE))*dt/2;
end
