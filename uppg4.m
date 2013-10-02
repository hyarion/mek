DAYLENGTH = 24 * 60 * 60;
G = 6.67384E-11;
%M = 5.9721986E24;
masses = [
	1.988435E30
	3.3022E23
	4.869E24
	5.9721986E24;
	6.4191E23
]';
Au = 1.49597871E11;
p0 = [
	0, 0
	5.7909100E10, 0
	1.08208000E11, 0
	1.49598261E11, 0
	2.27939100E11, 0
]';
v0 = [
	0 0
	0 4.787E4
	0 3.502E4
	0 2.978E4
	0 2.4077E4
]';
format long;
sunspeed = [-sum(masses .* v0(1,:));-sum(masses .* v0(2,:))] ./ masses(1);
sunspeed * masses(1);
v0(:,1) = sunspeed;
v0(:,2:5) += sunspeed * ones(1,4);

%linear_momentum = (ones(1,2) * masses) .* v0
%sum(linear_momentum)

dt = 1E3;
tmax = 60*60*24*365.25 * 2;

hold off;


printf('Bad orbit\n')
if 2 == exist('data_bad.bin')
	load('-binary', 'data_bad.bin', 'px', 'py', 'vx', 'vy', 't', 'Ek', 'Ep')
else
	[px,py,vx,vy,t, Ek,Ep] = orbit_Nbody(G, masses, p0,v0, dt*5E2,tmax);
	save('-binary', 'data_bad.bin', 'px', 'py', 'vx', 'vy', 't', 'Ek', 'Ep')
end
xs = px;
ys = py;
plot( xs,ys );
legend('Sun','Mercury','Venus','Earth','Mars');
print(gcf, '-dpng', 'uppg4_orbit_bad.png');

printf('Good orbit\n')
if 2 == exist('data.bin')
	load('-binary', 'data.bin', 'px', 'py', 'vx', 'vy', 't', 'Ek', 'Ep')
else
	[px,py,vx,vy,t, Ek,Ep] = orbit_Nbody(G, masses, p0,v0, dt,tmax);
	save('-binary', 'data.bin', 'px', 'py', 'vx', 'vy', 't', 'Ek', 'Ep')
end
%%size(p)
xs = px;
ys = py;
plot( xs,ys );
legend('Sun','Mercury','Venus','Earth','Mars');
print(gcf, '-dpng', 'uppg4_orbit.png');

epic_masses = ones(size(vx,1),1) * (masses);
printf('Linear momentum\n')
Px = epic_masses .* vx;
Py = epic_masses .* vy;
TotPx = sum(Px,2);
TotPy = sum(Py,2);
P = sqrt([TotPx Px].^2 + [TotPy Py].^2);
plot(t,P)
axis([0, 7e7, -2e28/2, 4e29])
legend('Total', 'Sun','Mercury','Venus','Earth','Mars');
print(gcf, '-dpng', 'uppg4_momentum.png');

printf('Angular momentum\n')
centre_mass_x = epic_masses .* px ./ sum(masses);
centre_mass_y = epic_masses .* py ./ sum(masses);

A = epic_masses .* ( (px - centre_mass_x) .* vy - (py - centre_mass_y) .* vx );
plot(t,[sum(A,2) A])
axis([0, 7e7, -1e40/2, 6e40])
legend('Total', 'Sun','Mercury','Venus','Earth','Mars');
print(gcf, '-dpng', 'uppg4_angular.png');

printf('Kinetic energy\n')
K = epic_masses .* (vx.^2 + vy.^2) ./ 2;
plot(t,[sum(K,2) K])
axis([0, 7e7, -1e33/2, 7e33])
legend('Total','Sun','Mercury','Venus','Earth','Mars');
print(gcf, '-dpng', 'uppg4_kinetic.png');

%printf('Linear momentum\n')
%momentum = calculateLinearMomentum(masses, v);
%totalMomentum = (sum(momentum,1));
%%size(totalMomentum)
%xs = rotdim(totalMomentum(1,1,:));
%ys = rotdim(totalMomentum(1,2,:));
%plot(t,sqrt(xs.^2+ys.^2),'+')
%ylabel('Linear momentum (kg m^2/s)')
%xlabel('Time (s)')
%print(gcf, '-dpng', 'uppg4_momentum.png');
%clear momentum

%kinetic = calculateKineticEnergy(masses', v);
%totalKinetic = sum(kinetic,1);
size(Ek)
plot(t,[Ek,Ep,Ek+Ep])
ylabel('Energy (J)')
xlabel('Time (s)')
legend('Kinetic','Potential','Total');
print(gcf, '-dpng', 'uppg4_energy.png');


printf('Suns position\n')
xs = px(:,1);
ys = py(:,1);
plot(xs,ys);
print(gcf, '-dpng', 'uppg4_sun_position.png');

printf('Orbital times\n')
printf('\tMerkurius: ')
xs = px(:,2);
ys = py(:,2);
printf('%g\n',orbit_time(xs,ys,t)/DAYLENGTH)

printf('\tVenus: ')
xs = px(:,3);
ys = py(:,3);
printf('%g\n',orbit_time(xs,ys,t)/DAYLENGTH)

printf('\tJorden: ')
xs = px(:,4);
ys = py(:,4);
printf('%g\n',orbit_time(xs,ys,t)/DAYLENGTH)

printf('\tMars: ')
xs = px(:,5);
ys = py(:,5);
printf('%g\n',orbit_time(xs,ys,t)/DAYLENGTH)

%        Merkurius: 6.046e+06
%        Venus: 747000
%        Jorden: 1.5698e+07
%        Mars: 3.4975e+07

