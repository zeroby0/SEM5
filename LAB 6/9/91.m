oversampling_factor = 16;

%for a pulse with amplitude one, the max frequency deviation is given by kf
kf=0.25;

%increase the oversampling factor if kf (and hence frequency deviation, and hence bw of FM s 
oversampling_factor = ceil(max(kf,1)*oversampling_factor);

ts=1/oversampling_factor; %sampling time

nsamples = ceil(1/ts);
% pulse = ones(nsamples,1); %rectangular pulse
pulse_time = 0:ts:1;
pulse = sin(pi*pulse_time);

% calculating PSD

nsymbols =1000;
symbols=zeros(nsymbols,1);
nruns=1000;
fs_desired=0.1;
Nmin = ceil(1/(fs_desired*ts)); %minimum length DFT for desired frequency granularity 
message_length=1+(nsymbols-1)*nsamples+length(pulse)-1;
Nmin = max(message_length,Nmin);
% %for efficient computation, choose FFT size to be power of 2
Nfft = 2^(nextpow2(Nmin)) %FFT size = the next power of 2 at least as big as Nmin 
psd=zeros(Nfft,1);

for runs=1:nruns,
	%random symbol sequence
	symbols = sign(rand(nsymbols,1)-0.5); 
	nsymbols_upsampled = 1+(nsymbols-1)*nsamples; 
	symbols_upsampled = zeros(nsymbols_upsampled,1); 
	symbols_upsampled(1:nsamples:nsymbols_upsampled) = symbols; 
	message = conv(symbols_upsampled,pulse);
	%FM signal phase
	theta = 2*pi*kf*ts*cumsum(message);
	cenvelope = exp(j*theta);
	time = (0:length(cenvelope)-1)*ts;
	% %freq domain signal computed using DFT
	cenvelope_freq = ts*fft(cenvelope,Nfft); %FFT of size Nfft, automatically zeropads as needed 
	cenvelope_freq_centered = fftshift(cenvelope_freq); %shifts DC to center of spectrum 
	psd=psd+abs(cenvelope_freq_centered).^2;
end

psd=psd/(nruns*nsymbols);
fs=1/(Nfft*ts) %actual frequency resolution attained
% %set of frequencies for which Fourier transform has been computed using DFT
freqs = ((1:Nfft)-1-Nfft/2)*fs;
%plot the PSD
plot(freqs,psd);
title(["PSD of fm signal. kf = ", num2str(kf)]);
ylabel("Magnitude");
xlabel("Frequency (Hz)");
xlim([-1.5, 1.5]);
print -dpng 9a.png