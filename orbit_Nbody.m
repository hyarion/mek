function [position,velocity,t]=orbit_Nbody(G,m,x0,y0,vx0,vy0,dt,tmax)
	masses = m;
	gravitationalConstant = G;
	numberOfBodies = size(m,1);
	numberOfSteps = floor(tmax/dt) + 1;

	t  = zeros(numberOfSteps,1);
	x  = zeros(numberOfBodies,numberOfSteps);
	y  = zeros(numberOfBodies,numberOfSteps);
	vx = zeros(numberOfBodies,numberOfSteps);
	vy = zeros(numberOfBodies,numberOfSteps);
	ax = zeros(numberOfBodies,numberOfSteps);
	ay = zeros(numberOfBodies,numberOfSteps);

	x(:,1) = x0;
	y(:,1) = y0;
	vx(:,1) = vx0;
	vy(:,1) = vy0;
	[ax(:,1), ay(:,1)] = calculateAccelerations(x(:,1), y(:,1), masses, gravitationalConstant);

	for s = 1:numberOfSteps-1
		t(s+1) = t(s) + dt;

		x(:,s+1) = x(:,s) + vx(:,s)*dt + 0.5 * ax(:,s) * (dt^2);
		y(:,s+1) = y(:,s) + vy(:,s)*dt + 0.5 * ay(:,s) * (dt^2);

		[ax(:,s+1), ay(:,s+1)] = calculateAccelerations(x(:,s), y(:,s), masses, gravitationalConstant);

		vx(:,s+1) = vx(:,s) + 0.5 * (ax(:,s+1) + ax(:,s)) * dt;
		vy(:,s+1) = vy(:,s) + 0.5 * (ay(:,s+1) + ay(:,s)) * dt;
	end

