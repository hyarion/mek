deltaError = 1E-7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G = 1;
M = 1;
m = 1;

p0 = [1 0];
v0 = [0 1];
dt = 1;
tmax = 1;

accelerations = [];
acceleration(:,:,1) = calculateAccelerations([0 0;p0],[M m],G);

[p,v,t]=orbit_1body(G,M,m,p0,v0,dt,tmax);
assert(t,[0 1]')

expect_p = [
	p0
	p0+v0.*dt+0.5.*acceleration(2,:,1).*(dt^2)
];
assert(p,expect_p)

acceleration(:,:,2) = calculateAccelerations([0 0;expect_p(2,:)],[M m],G);
expect_v = [
	v0
	v0+0.5*(acceleration(2,:,1)+acceleration(2,:,2))*dt
];
assert(v,expect_v)
