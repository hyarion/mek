G = 1.0;
M = 10.0;
m = 0.01;
p0 = [10, 0];
v0 = [0, 0.75];

tmax = 120;
dt = 0.01;

[p, v, t, K, P, A] = orbit_1body(G,M,m,p0,v0,dt,tmax);

plot(p(:,1),p(:,2));
hold on;
plot(0,0,'r+');
hold off;
title('Satelite orbit around large mass');
xlabel('x')
ylabel('y')
legend('Satelite','Planet');
print(gcf, '-dpng', 'uppg1_orbit.png');

plot(t, [K, P, K+P]);
title('Satelite orbit around large mass');
xlabel('Time')
ylabel('Energy')
legend('Kinetic','Potential');
print(gcf, '-dpng', 'uppg1_energy.png');
 size([m.*v(:,1), m.*v(:,2)])
plot(t,[m.*v(:,1), m.*v(:,2)]);
title('Size of linear momentum over time')
xlabel('Time');
ylabel('Linear momentum')
print(gcf, '-dpng', 'uppg1_momentum_linear.png')

plot(t,A);
title('Size of angular momentum over time')
xlabel('Time');
ylabel('Angular momentum')
print(gcf, '-dpng', 'uppg1_momentum_angular.png')

% [AX,H1,H2] = plotyy(t, sqrt(sum(v.^2,2)), t, sqrt(sum(p.^2,2)));
% title('Velocity and distance over time')
% set(get(AX(1),'Ylabel'),'String', 'Speed')
% set(get(AX(2),'Ylabel'),'String', 'Distance')
% xlabel('Time')
% print(gcf, '-dpng', 'uppg1_speed.png')
% 
% plot(t,v)
