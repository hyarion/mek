G = 1.0;
M = 10.0;
m = 0.01;
p0 = [10, 0];
v0 = [0, 0.75];

tmax = 100;
dt = 0.01;

[p, v, t] = orbit_1body(G,M,m,p0,v0,dt,tmax);

plot(p(:,1),p(:,2));
hold on;
plot(0,0,'r+');
hold off;
title('Satelite orbit around large mass');
xlabel('x')
ylabel('y')
legend('Satelite','Planet');
print(gcf, '-dpng', 'uppg1_orbit.png');

masses = [M m]';
positions = zeros(2,2,size(v,1));
for n = 1:size(v,2)
	positions(2,n,:) = p(:,n);
end
potentialEnergy = calculatePotentialEnergy(masses,positions,G);
potentialEnergy = potentialEnergy(2,:);
velocities = zeros(2,2,size(v,1));
for n = 1:size(v,2)
	velocities(2,n,:) = v(:,n);
end
kineticEnergy = calculateKineticEnergy(masses, velocities);
kineticEnergy = kineticEnergy(2,:);
% size(potentialEnergyVector);
% size(kineticEnergyVector');
plot(t, potentialEnergy, t, kineticEnergy, t,(potentialEnergy+kineticEnergy));
title('Energy over time');
xlabel('Time');
ylabel('Energy');
legend('Potential','Kinetic','Total')
print(gcf, '-dpng', 'uppg1_energy.png')

momentum = calculateLinearMomentum(masses,velocities);
xs = rotdim(momentum(2,1,:));
ys = rotdim(momentum(2,2,:));
plot(t,xs.^2+ys.^2);
title('Size of linear momentum over time')
xlabel('Time');
ylabel('Linear momentum')
print(gcf, '-dpng', 'uppg1_momentum.png')

[AX,H1,H2] = plotyy(t, sqrt(sum(v.^2,2)), t, sqrt(sum(p.^2,2)));
title('Velocity and distance over time')
set(get(AX(1),'Ylabel'),'String', 'Speed')
set(get(AX(2),'Ylabel'),'String', 'Distance')
xlabel('Time')
print(gcf, '-dpng', 'uppg1_speed.png')

plot(t,v)
