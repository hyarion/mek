function T = orbit_time(x,y,t)

N = max(size(y));

T = NaN;

x -= mean(x);
y -= mean(y);

a = angle(x + y*i);

minimum = a(1);
halftime = 0;

for n=2:N
	%printf('%5d\t%9.6f\t%9.6f\t%9.6f\n',n,t(n),x(n),y(n))
	if halftime == 0
		if a(n) < minimum
			halftime = n;
		end
	else
		if a(n) > minimum
			T = t(n);
			break
		end
	end
end

