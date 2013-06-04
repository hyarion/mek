function T = orbit_time(x,y,t)

N = max(size(y));

T = NaN;
for n=3:N
	%printf('%5d\t%9.6f\t%9.6f\t%9.6f\n',n,t(n),x(n),y(n))
	if (y(n) >= 0) && (y(n-1) <= 0)
		T = t(n);
		break
	end
end

