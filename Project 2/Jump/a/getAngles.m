%% getAngles: get directional angles of a 3d vector
function [angle_time, angle_x, angle_y, angle_z, mag_sig] = getAngles(sig_time, sig_x, sig_y, sig_z)
	mag_sig = (sig_x.^2 + sig_y.^2 + sig_z.^2).^0.5;
	
	dc_x = sig_x./mag_sig;
	dc_y = sig_y./mag_sig;
	dc_z = sig_z./mag_sig;

	angle_x = acos(dc_x);
	angle_y = acos(dc_y);
	angle_z = acos(dc_z);

	angle_time = sig_time;
end
