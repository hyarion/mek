G = 6.67384E-11;
M = 5.972E24;
masses = [
	1.989E30
	5.5E-2 * M
	8.15E-1 * M
	1 * M
	1.07E-1 * M
]';
Au = 1.49597871E11;
p0 = [
	0, 0
	4E-1 * Au, 0
	7E-1 * Au, 0
	1 * Au, 0
	1.5 * Au, 0
];
v0 = [
	0 0
	0 4.787E4
	0 3.502E4
	0 2.978E4
	0 2.4077E4
];
sunspeed = [-sum(masses' .* v0(:,1)),-sum(masses' .* v0(:,2))] ./ masses(1);
sunspeed * masses(1)
v0(1,:) = sunspeed;
v0(2:5,:) += ones(4,1) * sunspeed;

dt = 1E3;
tmax = 60*60*24*365.25 * 2;

hold off;

[p,v,t] = orbit_Nbody(G, masses, p0,v0, dt*20,tmax);
xs = rotdim(p(:,1,:));
ys = rotdim(p(:,2,:));
plot( xs,ys );
legend('Sun','Mercury','Venus','Earth','Mars');
print(gcf, '-dpng', 'uppg4_orbit_bad.png');

[p,v,t] = orbit_Nbody(G, masses, p0,v0, dt,tmax);
%size(p)
xs = rotdim(p(:,1,:));
ys = rotdim(p(:,2,:));
plot( xs,ys );
legend('Sun','Mercury','Venus','Earth','Mars');
print(gcf, '-dpng', 'uppg4_orbit.png');

printf('Linear momentum\n')
momentum = calculateLinearMomentum(masses', v);
totalMomentum = (sum(momentum,1));
%size(totalMomentum)
xs = rotdim(totalMomentum(1,1,:));
ys = rotdim(totalMomentum(1,2,:));
plot(t,sqrt(xs.^2+ys.^2),'+')
ylabel('Linear momentum (kg m^2/s)')
xlabel('Time (s)')
print(gcf, '-dpng', 'uppg4_momentum.png');
clear momentum

printf('Kinetic energy\n')
kinetic = calculateKineticEnergy(masses', v);
totalKinetic = sum(kinetic,1);
plot(t,kinetic,t,totalKinetic)
ylabel('Kinetic Energy (J)')
xlabel('Time (s)')
legend('Sun','Mercury','Venus','Earth','Mars','Total');
print(gcf, '-dpng', 'uppg4_kinetic.png');


printf('Potential energy\n')
potential = calculatePotentialEnergy(masses', p, G);
plot(t',potential,t',sum(potential,1))
ylabel('Potential Energy (J)')
xlabel('Time (s)')
legend('Sun','Mercury','Venus','Earth','Mars','Total');
%potential
print(gcf, '-dpng', 'uppg4_potential.png');

printf('Total energy\n')
plot(t, potential + kinetic, t, sum(potential + kinetic));
ylabel('Energy (J)')
xlabel('Time (s)')
legend('Sun','Mercury','Venus','Earth','Mars','Total');
print(gcf, '-dpng', 'uppg4_total_energy.png');
clear kinetic
clear totalKinetic
clear potential

printf('Suns position\n')
xs = rotdim(p(1,1,:));
ys = rotdim(p(1,2,:));
plot(xs,ys);
print(gcf, '-dpng', 'uppg4_sun_position.png');

printf('Orbital times\n')
printf('\tMerkurius: ')
xs = rotdim(p(2,1,:));
ys = rotdim(p(2,2,:));
printf('%g\n',orbit_time(xs,ys,t))

printf('\tVenus: ')
xs = rotdim(p(3,1,:));
ys = rotdim(p(3,2,:));
printf('%g\n',orbit_time(xs,ys,t))

printf('\tJorden: ')
xs = rotdim(p(4,1,:));
ys = rotdim(p(4,2,:));
printf('%g\n',orbit_time(xs,ys,t))

printf('\tMars: ')
xs = rotdim(p(5,1,:));
ys = rotdim(p(5,2,:));
printf('%g\n',orbit_time(xs,ys,t))

%        Merkurius: 6.046e+06
%        Venus: 747000
%        Jorden: 1.5698e+07
%        Mars: 3.4975e+07

