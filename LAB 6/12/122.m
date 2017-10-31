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

% symbols'

symbols = [-1, 1, -1, 1, 1, -1, 1, 1, -1, -1]

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

subplot(2, 1, 1);
plot(time, message);
title(["Message signal. symbols = ", mat2str(symbols)]);
xlabel("time (s)");
ylabel("amplitude");

subplot(2, 1, 2);
plot(time, FM);
title("FM signal");
xlabel("time (s)");
ylabel("amplitude");

print -dpng 12b.png

