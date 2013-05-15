G = 6.67384E-11;
M = 5.972E24;
m = 450E3;
p0 = [412E3+6.371E6 0];
v0 = [0 7706.6];

dt = 0.1;
tmax = 3E4;

plot(0,0,'g*')
hold on;

%tic();
%[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
%plot(p(:,1,:),p(:,2,:),'b')
%size(t)
%toc()

tic();
dt *= 10;
%[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
%plot(p(:,1,:),p(:,2,:),'r')
%size(t)
toc()
%T = orbit_time(p(:,1),p(:,2),t)

tic();
dt *= 10;
%[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
%plot(p(:,1,:),p(:,2,:),'g')
%size(t)
toc()
%T = orbit_time(p(:,1),p(:,2),t)

tic();
dt *= 20;
%dt
[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
%size(t)
toc()
plot(p(:,1,:),p(:,2,:),'b')
T = orbit_time(p(:,1),p(:,2),t)

tic();
dt *= 2;
%dt
[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
%size(t)
toc()
plot(p(:,1,:),p(:,2,:),'r')

tic();
dt += 200;
%dt
[p,v,t] = orbit_1body(G,M,m, p0,v0, dt,tmax);
%size(t)
toc()
plot(p(:,1,:),p(:,2,:),'y')

legend('Planet','dt = 200 s','dt = 400 s','dt = 600 s')
print(gcf, '-dpng', 'uppg2_iss.png')



hold off;
