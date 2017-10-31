%% Octave

symbols = [-2, 1, 0, 2, -1]

dt = 0.01;

t_ref = 0:dt:1-dt;
ref = cos(pi*t_ref);

plot(t_ref, ref);
xlabel("Time");
ylabel("Amplitude");
title("Reference signal = cos(\\pi*t)I[0, 1]");

print -dpng a_ref.png


% a

% symbols are -2, 1, 0, 2, 1
% There are four different symbols, using 2 bits per symbol
% -2 : 00
%  0 : 01
%  1 : 10
%  2 : 11

% bits = 00 | 10 | 01 | 11 | 10

% 0 = -1
% 1 = +1

% bit zero bit one
b_zero = ref.*-1;
b_one = ref.*1;

% message -2, 0, 1, 2
m_minus_two = [b_zero'; b_zero'];
m_zero = [b_zero'; b_one'];
m_one = [b_one'; b_zero'];
m_two = [b_one'; b_one'];




t_message = 0:dt:1*10 - dt; % 10 bits
message = [ m_minus_two; m_one; m_zero; m_two; m_one]';

plot(t_message, message);
title("Message signal; bits: 1 = +ref, 0 = -ref; symbols: -2 -> 00, 0 -> 01, 1 -> 10, 2 -> 11");
xlabel("Time (s)");
ylabel("Amplitude");
print -dpng a.png


%%%%%%%%%%%%%%%%%%%%%%%%%%

% b & c

% mo = |-1|
% Ac = 1
% amod = 1 => A = 1

Fc = 25;

t_am = t_message;

carrier = cos(2*pi*Fc*t_am);

am = (message.*carrier).+carrier;

plot(t_am, am);
title(["AM modulated wave. Fc = ", num2str(Fc)]);
xlabel("Time (s)");
ylabel("Amplitude");

print -dpng 2_am.png


%%%%%%%%%%%%%%%%%%%%%%%%%%

% d

[freq_message, ampl_message] = getFFT(message, dt);
[freq_am, ampl_am] = getFFT(am, dt);

subplot(2, 1, 1);
plot(freq_message, ampl_message);
xlabel("Frequency (Hz)");
ylabel("Magnitude");
title("Frequency Response of message signal");

subplot(2, 1, 2);
plot(freq_am, ampl_am);
xlabel("Frequency (Hz)");
ylabel("Magnitude");
title(["Frequency Response of DSB AM signal. Fc = ", num2str(Fc)]);
print -dpng d_freq.png

%%%%%%%%%%%%%%%%%%%%%%%%%%

% e

time_diode = t_am;
diode = diodeFilter(am);

subplot(3, 1, 1);
plot(time_diode, diode);
title("Diode Response");
xlabel("Time (s)");
ylabel("Amplitude");

RC = 0.1;

[dem_time, dem] = RCfilter(time_diode, diode, RC);
% [dem_time, dem] = DCblock(dem_time, dem);

subplot(3, 1, 2);
plot(dem_time, dem);
title("Demodulated wave");
xlabel("Time (s)");
ylabel("Amplitude");
xlim([0, 25]);

subplot(3, 1, 3);
plot(t_message, message);
title("Message signal; bits: 1 = +ref, 0 = -ref; symbols: -2 -> 00, 0 -> 01, 1 -> 10, 2 -> 11");
xlabel("Time (s)");
ylabel("Amplitude");

print dpng e_dem.png



%%%%%%%%%%%%%%% Filter response

% H(s) = 1/(1 + sRC);
% Inverse fourier transform for h(s)
% http://www.wolframalpha.com/input/?i=InverseFourier(1%2F(1%2Bas))
% RC and t are positive

resp_time = -40:dt:40;

resp1 = sign(resp_time).*sin(resp_time./RC);
resp2 = sign(resp_time).*cos(resp_time./RC).*-i;

coeff = (1/RC)*(sqrt(pi/2));

resp = resp1.+resp2;
% resp = resp.*coeff;

subplot(3, 1, 1);
plot(resp_time, real(resp));
title("Filter impulse response : real part");
xlabel("Time (s)");
ylabel("Amplitude");

subplot(3, 1, 2);
plot(resp_time, imag(resp));
title("Filter impulse response : imaginary part");
xlabel("Time (s)");
ylabel("Amplitude");

subplot(3, 1, 3);
plot(resp_time, abs(resp));
title(["Filter impulse response absolute value. RC = ", num2str(RC)]);
xlabel("Time (s)");
ylabel("Amplitude");
print -dpng resp.png







