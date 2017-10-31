% Octave

% Note: contFT and contconv omitted

% u_DSB = m(t)cos(2pi*fc*t)
% U_DSB = M(f) * F(cos(2pi*fc*t));

rows = 3;
cols = 1;

fc = 25;

dt = 0.01;

df = 0.01;
df_desired = 1;

% The tent freq plot
Freq = -1:df:1;
M = (1 - abs(Freq)).*2;


subplot(rows, cols, 1);

plot(Freq, M);
title("M(f) = 2*tent(-1, 1)");
xlabel("Frequency (Hz)");
ylabel("Magnitude");

%%%%%%%

subplot(rows, cols, 2);
x_M = ifft(M);
t_M = 0:0.01:length(x_M)*dt - dt;

t_cos = -1*length(x_M)*dt/2:dt:length(x_M)*dt/2;
% t_cos = -1:dt:1;
x_cos = cos(2*pi*fc*t_cos);

% plot(t_cos, x_cos);

[X_cos, F_cos, df_cos] = contFT(x_cos, t_cos(1), dt, df, df_desired);

% plot(F_cos, X_cos);

[T_U, X_U] = contconv(M, X_cos, Freq(1), F_cos(1), dt);


plot(T_U, imag(X_U));
title("Imag( Fourier(U_D_S_B) )");
xlabel("Frequency");
ylabel("Amplitude")


%% 

subplot(rows, cols, 3);

plot(T_U, real(X_U));
title("Real( Fourier( U_D_S_B ) )");
xlabel("Frequency");
ylabel("Amplitude");











print -dpng 2.png;