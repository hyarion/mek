G = 6.67384E-11;
M = 5.972E24;
m = 450E3;
p0 = [412E3+6.371E6 0];
v0 = [0 7706.6];

dt = 200;
tmax = 7E3;

plot(0,0,'g*')
hold on;

colors = ['c'];
for n = 1:10
	tic();
	[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
	plot(p(:,1,:),p(:,2,:),1+mod(n,6))
	%size(t)
	toc()
	dt
	T = orbit_time(p(:,1),p(:,2),t)

	previousTs(n) = T;
	dt /= 2;
	fflush(stdout);
end
print(gcf, '-dpng', 'uppg2_iss.png')

hold off;
plot(previousTs);
print(gcf, '-dpng', 'uppg2_iss_time.png')
