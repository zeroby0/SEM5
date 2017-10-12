textfile = "1.csv"

lowerLimit = 30000;
upperLimit = 110000;
Fs = 100;


[csv_time, csv_accel_x, csv_accel_y, csv_accel_z, csv_grav_x, csv_grav_y, csv_grav_z, csv_linaccel_x, csv_linaccel_y, csv_linaccel_z, csv_gyro_x, csv_gyro_y, csv_gyro_z, csv_magfield_x, csv_magfield_y, csv_magfield_z, csv_orientation_x, csv_orientation_y, csv_orientation_z] = textread(textfile, '%d %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f', 'delimiter', ',');

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


[time_accel, angle_accel_x, angle_accel_y, angle_accel_z, mag_accel] = getAngles(time_accel, signal_accel_x, signal_accel_y, signal_accel_z);

% plot(time_accel, mag_accel);
% xlabel("Time (ms)");
% ylabel("Magnitude");
% title("Magnitude Acceleration");

% print -dpng mag_accel_1.png;

% plot(time_accel, angle_accel_x);
% ylabel("Angle (rad)");
% xlabel("Time (ms)");
% title("Acceleration x angle");

% print -dpng angle_accel_x.png

% [freq_angle_accel_x, mag_fft_angle_accel_x] = getFFT(angle_accel_x, Fs);

% plot(freq_angle_accel_x, mag_fft_angle_accel_x);
% xlim([0, 10]);
% ylim([0, 800]);
% print -dpng fft_angle_accel_x.png



% plot(time_accel, angle_accel_x);
% ylabel("Angle (rad)");
% xlabel("Time (ms)");
% title("Acceleration x angle");

% print -dpng angle_accel_x.png

% [freq_angle_accel_x, mag_fft_angle_accel_x] = getFFT(angle_accel_x, Fs);

% plot(freq_angle_accel_x, mag_fft_angle_accel_x);
% xlim([0, 10]);
% ylim([0, 800]);
% print -dpng fft_angle_accel_x.png


% csv_orientation_z(csv_orientation_z > 80 & csv_orientation_z < 110)'
% csv_orientation_y(csv_orientation_y > 80 & csv_orientation_y < 110)'
% csv_orientation_x(csv_orientation_x > 80 & csv_orientation_x < 110)'








