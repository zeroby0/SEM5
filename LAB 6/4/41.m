oversampling_factor = 16;

%for a pulse with amplitude one, the max frequency deviation is given by kf
kf=0.25;

%increase the oversampling factor if kf (and hence frequency deviation, and hence bw of FM s 
oversampling_factor = ceil(max(kf,1)*oversampling_factor);

ts=1/oversampling_factor;%sampling time

nsamples = ceil(1/ts);
pulse = ones(nsamples,1); %rectangular pulse

nsymbols =10;
symbols=zeros(nsymbols,1);

%random symbol sequence
symbols = sign(rand(nsymbols,1)-0.5);

symbols

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

Icomponent = real(cenvelope);
Qcomponent= imag(cenvelope);

% subplot(4, 1, 1);
% %plot Message
% plot(time, message);
% title(["Message signal. symbols = ", mat2str(symbols)]);
% xlabel("time (s)");
% ylabel("amplitude");

% subplot(4, 1, 2);
% %plot I component
% plot(time,Icomponent);
% title("I component");
% xlabel("time (s)");
% ylabel("amplitude");

% subplot(4, 1, 3);
% %plot Q component
% plot(time, Qcomponent);
% title("Q component");
% xlabel("time (s)");
% ylabel("amplitude");

% subplot(4, 1, 4);
% %plot theta
% plot(time, theta./pi);
% title(["\\theta", "(t)/", "\\pi"]);
% xlabel("time (s)");
% ylabel("amplitude");

% print -dpng 1.png


%baseband discriminator
%differencing operation approximates derivative
Iderivative = [0;diff(Icomponent)]/ts;
Qderivative = [0;diff(Qcomponent)]/ts;
message_estimate = (1/(2*pi*kf))*(Icomponent.*Qderivative - Qcomponent.*Iderivative)./(Icomponent.^2 .+ Qcomponent.^2);

subplot(2, 1, 1);
plot(time, message);
title(["Message signal. symbols = ", mat2str(symbols)]);
xlabel("time (s)");
ylabel("amplitude");

subplot(2, 1, 2);
plot(time, message);
title("Estimated message. kf = 0.25");
xlabel("time (s)");
ylabel("amplitude");

print -dpng 4a.png

