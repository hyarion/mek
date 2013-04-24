function [position,velocity,t]=orbit_1body(G,M,p0,v0,dt,tmax)
	numberOfSteps = ceil(tmax/dt);
	position = zeros(2,numberOfSteps);
	velocity = zeros(2,numberOfSteps);
	position(:,1) = p0;
	velocity(:,1) = v0;


