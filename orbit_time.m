function T = orbit_time(x,y,t)

N = size(y,1);

T = NaN;
for n=2:N
	if y(n) >= 0 && y(n-1) < 0
		T = t(n);
		break
	end
end

