%% clipSignal: Clips signal out of limits
function [timeClipped, signalClipped] = clipSignal(time, signal, lowerLimit, upperLimit, timeShift = true)
	% time_start = sum(time(:) > lowerLimit); % sum( a logical array of 0 & 1 )
	% time_end = sum(time(:) < upperLimit);

	% timeClipped = time(end - time_start + 1 : time_end);
	% signalClipped = signal(end - time_start + 1 : time_end);

	time_start = time(time > lowerLimit);
	time_end = time(time < upperLimit);

	timeClipped = time( end - length(time_start) + 1 : length(time_end) );
	signalClipped = signal( end - length(time_start) + 1 : length(time_end) );

	if timeShift
		startTime = timeClipped(1);
		timeClipped = timeClipped.-startTime;
	end
end
