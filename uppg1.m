G = 1.0;
M = 10.0;
m = 0.01;
p0 = [10, 0];
v0 = [0, 0.75];

tmax = 1000;
dt = 1;

global kineticEnergyVector;
global potentialEnergyVector;

[p, v, t] = orbit_1body(G,M,m,p0,v0,dt,tmax);

% plot(p(:,1),p(:,2));
% hold on;
% plot(0,0,'r+');
% hold off;
% title('Satelite orbit around large mass');
% legend('Satelite','Planet');
size(potentialEnergyVector);
size(kineticEnergyVector');
plot(t, [potentialEnergyVector kineticEnergyVector (potentialEnergyVector+kineticEnergyVector)]);
legend('pot','kin','sum')
