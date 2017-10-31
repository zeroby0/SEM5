% Octave

rows = 3;
cols = 2;

dt = 0.01;


t = -2:dt:2;
x = 1 - abs(t);

subplot(rows, cols, 1);
plot(t, x)
xlabel("Time");
ylabel("Amplitude");
title("Tent signal");
xlim([-3, 4]);
% ylim([0, 2]);

%%%%%%%%%%%%%%%%%%

% a

ta = -2/3:dt:2/3;
xa = 1 - abs(ta);
ta = ta.+3/2;

subplot(rows, cols, 2);
plot(ta, xa);
xlabel("Time");
ylabel("Amplitude");
title("a: x(3t - 3/2)");
xlim([0.5, 2.5]);
% ylim([0, 2]);

%%%%%%%%%%%%%%%%%%%%%

% b

Fs = 1/dt;

tc = -2:dt:2;
xc = 1 - abs(t);

x = fft(xc);
N = length(xc);

freqHz = (0:1:(length(x) - 1)).*Fs/N;

Frequencies = freqHz(1:length(freqHz)/2);
Amplitudes = abs(x)(1:length(x)/2);

subplot(rows, cols, 3);
plot(Frequencies, Amplitudes);
xlabel("Frequency (Hz)");
ylabel("Magnitude");
title("b: X(f)");
xlim([0, 2]);

%%%%%%%%%%%%%%%%%%%%%%

% c

t_first = -1:dt:0;
x_first = ones(length(t_first), 1).*3;

t_second = 0:dt:1;
x_second = ones(length(t_second), 1).*1;

t_third = 1:dt:2;
x_third = ones(length(t_third), 1).*0;

t_fourth = 2:dt:3;
x_fourth = ones(length(t_fourth), 1).*-2;

t_fifth = 3:dt:4;
x_fifth = ones(length(t_fifth), 1).*1;

tc = vertcat(t_first', t_second', t_third', t_fourth', t_fifth');
xc = vertcat(x_first, x_second, x_third, x_fourth, x_fifth);

subplot(rows, cols, 4);
plot(tc, xc);
xlabel("Time (s)");
ylabel("Amplitude");
title("c: v(t)");

% The original signal
t = -2:dt:2;
x = 1 - abs(t);

[T, X] = contconv(x, xc, t(1), tc(1), dt);

subplot(rows, cols, 5);
plot(T, imag(X));
xlabel("Time");
ylabel("Amplitude");
title("c: imag( x(t) * v(t) )");

subplot(rows, cols, 6);
plot(T, real(X));
xlabel("Time");
ylabel("Amplitude");
title("c: real( x(t) * v(t) )");


print -dpng 1.png