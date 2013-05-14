G = 6.67384E-11;
M = 5.972E24;
m = 450E3;
p0 = [412E3+6.371E6 0];
v0 = [0 7706.6];

dt = 1;
tmax = 1E4;

[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);

plot(0,0,'r*')
hold on;
plot(p(:,1,:),p(:,2,:))
hold off;
