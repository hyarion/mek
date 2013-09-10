function [position,velocity,t, kinetic, potential]=orbit_1body(G,M,m,p0,v0,dt,tmax)
	masses = [M m];
	gravitationalConstant = G;

	%gravitationalConstant = 6.67384E-11;

	numberOfSteps = floor(tmax/dt) + 1;
	t         = zeros(numberOfSteps,1);
	positionX = zeros(numberOfSteps,1);
	positionY = zeros(numberOfSteps,1);
	velocityX = zeros(numberOfSteps,1);
	velocityY = zeros(numberOfSteps,1);

	% momentumX = zeros(numberOfSteps,1);
	% momentumY = zeros(numberOfSteps,1);
	kinetic   = zeros(numberOfSteps,1);
	potential = zeros(numberOfSteps,1);

	positionX(1) = p0(1);
	positionY(1) = p0(2);

	velocityX(1) = v0(1);
	velocityY(1) = v0(2);

	kinetic(1) = m * sum(v0.^2);

	ax = @(x, y) -G * M * x / sqrt(x^2 + y^2)^3;
	ay = @(x, y) -G * M * y / sqrt(x^2 + y^2)^3;

	for s = 1:numberOfSteps-1
		x = positionX(s);
		y = positionY(s);
		t(s+1) = t(s) + dt;

		positionX(s+1) = x1 = positionX(s) + velocityX(s)*dt + 0.5 * ax(x,y) * (dt^2);
		positionY(s+1) = y1 = positionY(s) + velocityY(s)*dt + 0.5 * ay(x,y) * (dt^2);

		velocityX(s+1) = velocityX(s) + 0.5 * (ax(x,y) + ax(x1,y1)) * dt;
		velocityY(s+1) = velocityY(s) + 0.5 * (ay(x,y) + ay(x1,y1)) * dt;
	end
	

	kinetic = m .* (velocityX.^2 + velocityY.^2) ./ 2;
	potential = -G .* m .* M ./ sqrt( positionX.^2 + positionY.^2);

	position = [positionX positionY];
	velocity = [velocityX velocityY];
