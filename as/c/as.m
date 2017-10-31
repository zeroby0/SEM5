clear;

dt = 0.00001;
fc = 1000;

time = -1:dt:1;
wave = cos(2*pi*fc*time);

[freq, ampl] = getFFT(wave, dt);

plot(freq, ampl);
xlim([-2000, 2000]);

% plot(abs(ks));

print -dpng cos.png
