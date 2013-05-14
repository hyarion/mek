G = 6.67384E-11;
M = 5.972E24;
m = 450E3;
masses = [M m];
p0 = [0 0;412E3+6.371E6 0];
v0 = [0 0;0 7706.6];

dt = 10;
tmax = 1E4;

hold off;

[p,v,t] = orbit_Nbody(G, masses, p0,v0, dt,tmax);
size(p)
plot(p(1,1,:),p(1,2,:),p(2,1,:),p(2,2,:))

