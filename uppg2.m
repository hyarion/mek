G = 1.0;
M = 10.0;
m = 0.01;
p0 = [10, 0];
v0 = [0, 0.75];

tmax = 1E3;
dt = 0.5;

N = tmax / dt;

%[p, v, t] = orbit_1body(G,M,m,p0,v0,dt,tmax);
%T = orbit_time(p(:,1),p(:,2),t)

iterations = 15;
plot(0,0,'r*');
drawnow();
hold on;
orbitTimes = zeros(iterations,1);
totalEnergy = zeros(iterations,1);
orbitVelocities = zeros(iterations,1);
axis([-550,50, -100,200])
for n=1:iterations+1
	addedVelocity = [0 0.05*(n-1)];
	orbitVelocities(n) = v0(2) + 0.05*(n-1);
	[p, v, t] = orbit_1body(G,M,m,p0,v0+addedVelocity,dt,tmax);

	plot(p(:,1), p(:,2));
	drawnow();

	addedVelocity(2)
	T = orbit_time(p(:,1),p(:,2),t)
	orbitTimes(n) = T;

	tmax = T * 10;

	totalEnergy(n) = m*(v0(2)+addedVelocity(2)).^2 / 2 + G* m*M / 10;
	%kineticEnergyVector(1) + potentialEnergyVector(1);

	fflush(stdout);
end
hold off;
print(gcf, '-dpng', 'uppg2_orbits.png')

[AX,H1,H2] = plotyy(orbitVelocities,orbitTimes,orbitVelocities,totalEnergy);
set(get(AX(1),'Ylabel'),'String', 'Time')
set(get(AX(2),'Ylabel'),'String', 'Energy')
xlabel('Velocity (m/s)')
print(gcf, '-dpng', 'uppg2_energy.png')

% TODO: Estimate error with critical fraction
