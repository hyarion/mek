G = 6.67384E-11;
M = 5.972E24;
m = 450E3;
p0 = [412E3+6.371E6 0];
v0 = [0 7706.6];

dt = 0.1;
tmax = 3E4;

plot(0,0,'r*')
hold on;

%tic();
%[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
%plot(p(:,1,:),p(:,2,:),'b')
%size(t)
%toc()

%tic();
dt *= 10;
%[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
%plot(p(:,1,:),p(:,2,:),'r')
%size(t)
%toc()

%tic();
dt *= 10;
%[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
%plot(p(:,1,:),p(:,2,:),'g')
%size(t)
%toc()

tic();
dt *= 10;
dt
[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
plot(p(:,1,:),p(:,2,:),'m')
size(t)
toc()

tic();
dt *= 10;
dt
[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
plot(p(:,1,:),p(:,2,:),'y')
size(t)
toc()

orbit_time(p(:,1),p(:,2),t)

hold off;
