textfile = "1.csv"

lowerLimit = 25000;
upperLimit = 45000;

Fs = 100;

applLim = true;

[csv_time, csv_accel_x, csv_accel_y, csv_accel_z, csv_grav_x, csv_grav_y, csv_grav_z, csv_linaccel_x, csv_linaccel_y, csv_linaccel_z, csv_gyro_x, csv_gyro_y, csv_gyro_z, csv_magfield_x, csv_magfield_y, csv_magfield_z, csv_orientation_x, csv_orientation_y, csv_orientation_z] = textread(textfile, '%d %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', 'delimiter', ',');


% plot(csv_time, csv_accel_x);
% xlim([lowerLimit, upperLimit])

% print -dpng ver.png

% stop;


[time_accel, signal_accel_x] = clipSignal(csv_time, csv_accel_x, lowerLimit, upperLimit);
[time_accel, signal_accel_y] = clipSignal(csv_time, csv_accel_y, lowerLimit, upperLimit);
[time_accel, signal_accel_z] = clipSignal(csv_time, csv_accel_z, lowerLimit, upperLimit);

[time_grav, signal_grav_x] = clipSignal(csv_time, csv_grav_x, lowerLimit, upperLimit);
[time_grav, signal_grav_y] = clipSignal(csv_time, csv_grav_y, lowerLimit, upperLimit);
[time_grav, signal_grav_z] = clipSignal(csv_time, csv_grav_z, lowerLimit, upperLimit);

[time_linaccel, signal_linaccel_x] = clipSignal(csv_time, csv_linaccel_x, lowerLimit, upperLimit);
[time_linaccel, signal_linaccel_y] = clipSignal(csv_time, csv_linaccel_y, lowerLimit, upperLimit);
[time_linaccel, signal_linaccel_z] = clipSignal(csv_time, csv_linaccel_z, lowerLimit, upperLimit);

[time_gyro, signal_gyro_x] = clipSignal(csv_time, csv_gyro_x, lowerLimit, upperLimit);
[time_gyro, signal_gyro_y] = clipSignal(csv_time, csv_gyro_y, lowerLimit, upperLimit);
[time_gyro, signal_gyro_z] = clipSignal(csv_time, csv_gyro_z, lowerLimit, upperLimit);

[time_magfield, signal_magfield_x] = clipSignal(csv_time, csv_magfield_x, lowerLimit, upperLimit);
[time_magfield, signal_magfield_y] = clipSignal(csv_time, csv_magfield_y, lowerLimit, upperLimit);
[time_magfield, signal_magfield_z] = clipSignal(csv_time, csv_magfield_z, lowerLimit, upperLimit);

[time_orientation, signal_orientation_x] = clipSignal(csv_time, csv_orientation_x, lowerLimit, upperLimit);
[time_orientation, signal_orientation_y] = clipSignal(csv_time, csv_orientation_y, lowerLimit, upperLimit);
[time_orientation, signal_orientation_z] = clipSignal(csv_time, csv_orientation_z, lowerLimit, upperLimit);


[freq_accel_x, mag_accel_x] = getFFT(signal_accel_x, Fs);
plot (freq_accel_x, mag_accel_x);

if applLim
	xlim([0, 10]);
	ylim([0, 6000]);
end
xlabel("Frequency");
title("FFT of acceleration X");
print -dpng fft_accel_x.png

[freq_accel_y, mag_accel_y] = getFFT(signal_accel_y, Fs);
plot (freq_accel_y, mag_accel_y);
if applLim
	xlim([0, 10]);
	ylim([0, 15000]);
end
xlabel("Frequency");
title("FFT of acceleration Y");
print -dpng fft_accel_y.png


[freq_accel_z, mag_accel_z] = getFFT(signal_accel_z, Fs);
plot (freq_accel_z, mag_accel_z);
if applLim
	ylim([0, 2000]);
	xlim([0, 20]);
end
xlabel("Frequency");
title("FFT of acceleration Z");
print -dpng fft_accel_z.png





	plot(freq_accel_x, smooth(mag_accel_x));
	if applLim
		xlim([0, 10]);
		ylim([0, 6000]);
	end
	xlabel("Frequency");
	title("FFT of acceleration X");
	print -dpng smooth_fft_accel_x.png

	plot(freq_accel_y, smooth(mag_accel_y));
	if applLim
		xlim([0, 10]);
		ylim([0, 15000]);
	end
	xlabel("Frequency");
	title("FFT of acceleration Y");
	print -dpng smooth_fft_accel_y.png

	plot(freq_accel_z, smooth(mag_accel_z));
	if applLim
		xlim([0, 20]);
		ylim([0, 2000]);
	end
	xlabel("Frequency");
	title("FFT of acceleration Z");
	print -dpng smooth_fft_accel_z.png


[freq_gyro_x, mag_gyro_x] = getFFT(signal_gyro_x, Fs);
plot (freq_gyro_x, mag_gyro_x);
if applLim
	xlim([0, 15]);
	% ylim([0, 10000]);
end
xlabel("Frequency");
title("FFT of gyroeration X");
print -dpng fft_gyro_x.png

[freq_gyro_y, mag_gyro_y] = getFFT(signal_gyro_y, Fs);
plot (freq_gyro_y, mag_gyro_y);
if applLim
	xlim([0, 15]);
	% ylim([0, 6000]);
end
xlabel("Frequency");
title("FFT of gyroeration Y");
print -dpng fft_gyro_y.png


[freq_gyro_z, mag_gyro_z] = getFFT(signal_gyro_z, Fs);
plot (freq_gyro_z, mag_gyro_z);
if applLim
% ylim([0, 4000]);
xlim([0, 10]);
end
xlabel("Frequency");
title("FFT of gyroeration Z");
print -dpng fft_gyro_z.png





	plot(freq_gyro_x, smooth(mag_gyro_x));
	if applLim
	xlim([0, 15]);
	% ylim([0, 10000]);
	end
	xlabel("Frequency");
	title("FFT of gyroeration X");
	print -dpng smooth_fft_gyro_x.png

	plot(freq_gyro_y, smooth(mag_gyro_y));
	if applLim
	xlim([0, 15]);
	% ylim([0, 6000]);
	end
	xlabel("Frequency");
	title("FFT of gyroeration Y");
	print -dpng smooth_fft_gyro_y.png

	plot(freq_gyro_z, smooth(mag_gyro_z));
	if applLim
	xlim([0, 10]);
	% ylim([0, 4000]);
	end
	xlabel("Frequency");
	title("FFT of gyroeration Z");
	print -dpng smooth_fft_gyro_z.png











