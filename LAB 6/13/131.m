oversampling_factor = 16;

%for a pulse with amplitude one, the max frequency deviation is given by kf
kf=4;

%increase the oversampling factor if kf (and hence frequency deviation, and hence bw of FM s 
oversampling_factor = ceil(max(kf,1)*oversampling_factor);

ts=1/oversampling_factor;%sampling time

nsamples = ceil(1/ts);
pulse = ones(nsamples,1); %rectangular pulse

nsymbols =10;
symbols=zeros(nsymbols,1);

%random symbol sequence
% symbols = sign(rand(nsymbols,1)-0.5);

% symbols
symbols = [1, -1, -1, 1, -1, 1, 1, 1, -1, -1]
%generate digitally modulated message
nsymbols_upsampled=1+(nsymbols-1)*nsamples;
symbols_upsampled=zeros(nsymbols_upsampled,1);
symbols_upsampled(1:nsamples:nsymbols_upsampled)=symbols;

message = conv(symbols_upsampled,pulse);
%FM signal phase obtained by integrating the message

theta = 2*pi*kf*ts*cumsum(message);
cenvelope=exp(j*theta);

L=length(cenvelope);
time=(0:L-1)*ts;

Fc = 1000;
% cos(2pi*Fc*t + theta(t))
FM = cos(2*pi*Fc*time.+theta');

% -------- transmission ----------- %
% passing FM through differentiator
FM_diff = [0;diff(FM')]/ts;

% diode filter - retaining only positive signal
FM_diff_diode = diodeFilter(FM_diff');

% Envelope detector - RC filter

[time_env, fm_env] = RCfilter(time, FM_diff_diode, 0.04);

[time_dcblock, fm_dcblock] = DCblock(time_env, fm_env);

% fm_dcblock = fm_env;
% time_dcblock = time_env;

subplot(2, 1, 1);
plot(time, message);
title(["Message signal. symbols = ", mat2str(symbols)]);
xlabel("Time (s)");
ylabel("amplitude");


subplot(2, 1, 2);
plot(time_dcblock, fm_dcblock);
title("Demodulated signal");
xlim([0, 16]);
xlabel("Time (s)");
ylabel("amplitude");

print -dpng 13a.png
