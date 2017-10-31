message = [1, 0, 0, 1, 0, 1];
dt = 0.01;

% message = [1, -1, -1, 1, -1, 1];

rows = 3;
cols = 1;

%% getRef: generates reference sinc function
function [time, signal] = getRef(bit, time_offset, dt)
	time = time_offset:dt:(time_offset + 1 - dt);
	signal = sinc(time.-0.5.*4).*bit;
end

%% getMessage: generate message signa;
function [time, signal] = getMessage(message, dt)
	count = 0;
	time = [];
	signal =[];

	for t = message
		[t_time, t_signal]= getRef(t, count, dt);
		time = [time, t_time];
		signal = [signal, t_signal];
		count = count + 1;
	end
end

[t_m, x_m] = getMessage(message, dt);

size(t_m)
size(x_m)

subplot(rows, cols, 1);

plot(t_m, x_m);
title("a: Binary modulation");
xlabel("Time (s)");
ylabel("Amplitude");



%%%%%%%%%%%%%%%%

amp = 0.4;
fc = 10;

%% getIcarrier: get cos
function [time, signal] = getIcarrier(amp, fc, length, dt)
	time = 0:dt:length - dt;
	signal = cos(2*pi*fc*time).*amp;
end

function [time, signal] = getQcarrier(amp, fc, length, dt)
	time = 0:dt:length - dt;
	signal = sin(2*pi*fc*time).*amp;
end

[t_up, x_up] = getIcarrier(amp, fc, length(message), dt);

x_up = x_up.*x_m;


subplot(rows, cols, 2);

plot(t_up, x_up);

title("b: AM wave");
xlabel("time (s)");
ylabel("Amplitude");



%%%%%%%%%%%%%%%%%

%% diodeFilter: makes all values less than zero 0
function [result] = diodeFilter(vector)
	vector(vector < 0) = 0;
	result = vector;
end
	

%% RCFilter:
function [time_f, signal_f] = RCfilter(time, signal, RC)
	% t_response = 0:ns/length(time):ns;
	
	% 1/fc < RC < 1/b
	% b = 1.5 KHz

	t_response = time;

	dt = 1/40;

	u_response = ones(length(signal), 1);


	temp_t = t_response./RC;
	temp_t = temp_t.*-1;

	temp_t_exp = arrayfun( @(x) exp(x), temp_t);

	u_response = u_response.*temp_t_exp;

	u_response = u_response(1,:);

	% size(t_response)
	% size(u_response)

	[time_f, signal_f]  = contconv(signal, u_response, time(1), t_response(1), dt);
	time_f = time_f.*2./5;
end

%% DBblock: function description
function [time_dcblock, signal_dcblock] = DCblock(time, signal)

	meanSignal = mean(signal)

	time_dcblock = time;
	signal_dcblock = signal.-meanSignal;

end



T_in = t_up;
X_in = x_up;

X_in = diodeFilter(X_in); % diode filter

RC = 0.6;
% RC = 5;

[T_out, X_out] = RCfilter(T_in, X_in, RC);

% [T_out, X_out] = DCblock(T_out, X_out);


subplot(rows, cols, 3);
plot(T_out, X_out);
title("c: demodulated");
xlabel("time (s)");
ylabel("Amplitude");
xlim([0, 6]);


	





print -dpng 4.png

