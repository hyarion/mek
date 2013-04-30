G = 1.0;
M = 10.0;
m = 0.01;
p0 = [10, 0];
v0 = [0, 0.75];

tmax = 1000;
dt = 0.5;

global kineticEnergyVector;
global potentialEnergyVector;

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

% size(potentialEnergyVector);
% size(kineticEnergyVector');
plot(t, [potentialEnergyVector kineticEnergyVector (potentialEnergyVector+kineticEnergyVector)]);
title('Energy over time');
xlabel('Time (s)');
ylabel('Energy');
legend('pot','kin','sum')
print(gcf, '-dpng', 'uppg1_energy.png')

[AX,H1,H2] = plotyy(t, sqrt(sum(v.^2,2)), t, sqrt(sum(p.^2,2)));
title('Velocity and distance over time')
set(get(AX(1),'Ylabel'),'String', 'Speed (m/s)')
set(get(AX(2),'Ylabel'),'String', 'Distance (m)')
xlabel('Time (s)')
print(gcf, '-dpng', 'uppg1_speed.png')

plot(t,v)
