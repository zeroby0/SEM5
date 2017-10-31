dt = 0.01;
time = -2:dt:2;

%% : function description
function [outputs] = (arg)
	outputs = ;


x = 1 - abs(time);
subplot(2, 2, 1);
plot(time/3 + 1.5, x);

%a

subplot(2, 2, 2);

time = -2/3:dt:2/3;


x = 1 - abs(time);

time = time.+3/2;

plot(time, x);


%b

subplot(2, 2, 3);

Fs = 1/dt;

time = -2:dt:2;
xc = 1 - abs(time);

x = fft(xc);
N = length(xc);

freqHz = (0:1:(length(x) - 1)).*Fs/N;

Frequencies = freqHz(1:length(freqHz)/2);
Amplitudes = abs(x)(1:length(x)/2);

plot(Frequencies, Amplitudes);
xlim([0, 6]);



print -dpng x.png
