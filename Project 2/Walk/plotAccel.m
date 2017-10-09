textfile = "1.csv"

lowerLimit = 30000;
upperLimit = 110000;
Fs = 100;


freqgraphll = 0;
freqgraphul = 10;

[csv_time, csv_accel_x, csv_accel_y, csv_accel_z, csv_grav_x, csv_grav_y, csv_grav_z, csv_linaccel_x, csv_linaccel_y, csv_linaccel_z, csv_gyro_x, csv_gyro_y, csv_gyro_z, csv_magfield_x, csv_magfield_y, csv_magfield_z, csv_orientation_x, csv_orientation_y, csv_orientation_z] = textread(textfile, '%d %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', 'delimiter', ',');

[time, accel_x, freq, mag] = analyse(csv_time, csv_accel_x, lowerLimit, upperLimit, Fs);
	subplot(3, 2, 1);
	plot(time, accel_x);
	title("Accelerometer X");
	xlabel("Time (ms)");
	ylabel("Amplitude");


	subplot(3, 2, 2);
	plot(freq, mag);
	title("Accelerometer X");
	xlabel("Frequency (KHz)");
	ylabel("Magnitude")
	xlim([freqgraphll, freqgraphul]);


[time, accel_y, freq, mag] = analyse(csv_time, csv_accel_y, lowerLimit, upperLimit, Fs);
	subplot(3, 2, 3);
	plot(time, accel_y);
	title("Accelerometer Y");
	xlabel("Time (ms)");
	ylabel("Amplitude");


	subplot(3, 2, 4);
	plot(freq, mag);
	title("Accelerometer Y");
	xlabel("Frequency (KHz)");
	ylabel("Magnitude")
	xlim([freqgraphll, freqgraphul]);


[time, accel_z, freq, mag] = analyse(csv_time, csv_accel_z, lowerLimit, upperLimit, Fs);
	subplot(3, 2, 5);
	plot(time, accel_z);
	title("Accelerometer Z");
	xlabel("Time (ms)");
	ylabel("Amplitude");


	subplot(3, 2, 6);
	plot(freq, mag);
	title("Accelerometer Z");
	xlabel("Frequency (KHz)");
	ylabel("Magnitude")
	xlim([freqgraphll, 2*freqgraphul]);


print -dpng accel1.png

textfile = "2.csv"

lowerLimit = 40000;
upperLimit = 100000;
Fs = 100;

[csv_time, csv_accel_x, csv_accel_y, csv_accel_z, csv_grav_x, csv_grav_y, csv_grav_z, csv_linaccel_x, csv_linaccel_y, csv_linaccel_z, csv_gyro_x, csv_gyro_y, csv_gyro_z, csv_magfield_x, csv_magfield_y, csv_magfield_z, csv_orientation_x, csv_orientation_y, csv_orientation_z] = textread(textfile, '%d %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', 'delimiter', ',');

[time, accel_x, freq, mag] = analyse(csv_time, csv_accel_x, lowerLimit, upperLimit, Fs);
	subplot(3, 2, 1);
	plot(time, accel_x);
	title("Accelerometer X");
	xlabel("Time (ms)");
	ylabel("Amplitude");


	subplot(3, 2, 2);
	plot(freq, mag);
	title("Accelerometer X");
	xlabel("Frequency (KHz)");
	ylabel("Magnitude")
	xlim([freqgraphll, freqgraphul]);


[time, accel_y, freq, mag] = analyse(csv_time, csv_accel_y, lowerLimit, upperLimit, Fs);
	subplot(3, 2, 3);
	plot(time, accel_y);
	title("Accelerometer Y");
	xlabel("Time (ms)");
	ylabel("Amplitude");


	subplot(3, 2, 4);
	plot(freq, mag);
	title("Accelerometer Y");
	xlabel("Frequency (KHz)");
	ylabel("Magnitude")
	xlim([freqgraphll, freqgraphul]);


[time, accel_z, freq, mag] = analyse(csv_time, csv_accel_z, lowerLimit, upperLimit, Fs);
	subplot(3, 2, 5);
	plot(time, accel_z);
	title("Accelerometer Z");
	xlabel("Time (ms)");
	ylabel("Amplitude");


	subplot(3, 2, 6);
	plot(freq, mag);
	title("Accelerometer Z");
	xlabel("Frequency (KHz)");
	ylabel("Magnitude")
	xlim([freqgraphll, 2*freqgraphul]);

print -dpng accel2.png
