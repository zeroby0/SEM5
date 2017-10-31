% dt = 0.0001;
% Freq = -1:dt:1;
% Ampl = 2*(1 - abs(Freq));

% subplot(4, 1, 1);
% plot(Freq, Ampl);

% length(Ampl)

% subplot(4, 1, 2);
% fc = 250;
% time = -1:dt:1;
% cs = cos(2*pi*fc*time);

% [freq, CS] = getFFT(cs, dt);

% length(CS)

% plot(freq, CS);

% subplot(4, 1, 3);

% [freq_c, ampl_c] = contconv(CS, Ampl, freq, Freq, dt);

% plot(freq_c, ampl_c);

% length(ampl_c)

% print -dpng jbd.png



dt = 0.001;

fr_tr = -1:dt:1;
tr = 2*(1 - abs(fr_tr));

subplot(3, 1, 1);
plot(fr_tr, tr);

fc = 250;
time_cos = -1:dt:1;
ampl_cos = cos(2*pi*fc*time_cos);

[mag_cos, fr_cos, dsf] = contFT(ampl_cos, time_cos(1), dt, 0.01);
subplot(3, 1, 2);
% plot(time_cos, ampl_cos);
% fr_cos
plot(fr_cos, abs(mag_cos));
xlim([-500, 500]);

[fr_conv, am_conv] = contconv(tr, abs(mag_cos), fr_tr(1), fr_cos(1), dsf);

subplot(3, 1, 3);
plot(fr_conv, am_conv);

xlim([-400, 400]);
set(gca,'XTick',[-400:50:400]);
print -dpng 2.png