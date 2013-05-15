G = 1.0;
M = 10.0;
m = 0.01;
p0 = [10, 0];
v0 = [0, 0.75];

tmax = 1E5;
dt = 0.5;

N = tmax / dt;

%global kineticEnergyVector;
%global potentialEnergyVector;

%[p, v, t] = orbit_1body(G,M,m,p0,v0,dt,tmax);
%T = orbit_time(p(:,1),p(:,2),t)

plot(0,0,'r*');
drawnow();
hold on;
orbitTimes = [];
totalEnergy = [];
for n=0:4
	addedVelocity = [0 0.24 + 0.0025*n];
	[p, v, t] = orbit_1body(G,M,m,p0,v0+addedVelocity,dt,tmax);

	plot(p(:,1), p(:,2));
	drawnow();

	T = orbit_time(p(:,1),p(:,2),t)
	orbitTimes(n+1) = T;

	totalEnergy(n+1) = kineticEnergyVector(1) + potentialEnergyVector(1);

	fflush(stdout);
end
hold off;

plotyy(1:2, orbitTimes, totalEnergy);

% TODO: Estimate error with critical fraction
