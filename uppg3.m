G = 6.67384E-11;
M = 5.972E24;
m = [450E3 M];
p0 = [412E3+6.371E6 0
     0 0];
v0 = [0 7706.6
     0 0]';

dt = 200;
tmax = 7E3;

plot(0,0,'g*')
hold on;

colors = ['c'];
previousTs = zeros(5,2);
for n = 1:10
	tic();
	[px,py,vx,vy,t] = orbit_Nbody(G,m, p0,v0, dt,tmax);
	p=[px py];
	v=[vx vy];

	plot(px(:,1),py(:,1),1+mod(n,6))
	%size(t)
	toc()
	dt
	T = orbit_time(px(:,1),py(:,1),t)

	previousTs(n,:) = [dt T];
	dt /= 2;
	fflush(stdout);
end
print(gcf, '-dpng', 'uppg3_iss.png')

hold off;
semilogx(previousTs(:,1),previousTs(:,2),'-+');
set(gca (), "xdir", "reverse")
ylabel('Orbital Time (S)')
xlabel('dt (S)')
print(gcf, '-dpng', 'uppg3_iss_time.png')

