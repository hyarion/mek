function [position,velocity,t, kinetic, potential, angular]=orbit_2body(G,m,p0,v0,dt,tmax)

	masses = m;
	gravitationalConstant = G;

	%gravitationalConstant = 6.67384E-11;

	numberOfSteps = floor(tmax/dt) + 1;
	t         = zeros(numberOfSteps,1);
	positionX = zeros(numberOfSteps,2);
	positionY = zeros(numberOfSteps,2);
	velocityX = zeros(numberOfSteps,2);
	velocityY = zeros(numberOfSteps,2);

	% momentumX = zeros(numberOfSteps,1);
	% momentumY = zeros(numberOfSteps,1);
	kinetic   = zeros(numberOfSteps,2);
	potential = zeros(numberOfSteps,1);

	angular   = zeros(numberOfSteps,1);

	positionX(1,:) = p0(1,:);
	positionY(1,:) = p0(2,:);

	velocityX(1,:) = v0(1,:);
	velocityY(1,:) = v0(2,:);

	% kinetic(1) = m * sum(v0.^2);
	function [ax,ay] = acc(x,y)
		x = x(1) - x(2);
		y = y(1) - y(2);

		r3 = sqrt(x^2 + y^2)^3;

		ax(1) = -G * m(2) * x /r3;
		ay(1) = -G * m(2) * y /r3;
		ax(2) = -G * m(1) * (-x) /r3;
		ay(2) = -G * m(1) * (-y) /r3;
	end

	%ax = @(x, y, p) -G * M * x / sqrt(x^2 + y^2)^3;
	%ay = @(x, y, p) -G * M * y / sqrt(x^2 + y^2)^3;

	for s = 1:numberOfSteps-1
		t(s+1) = t(s) + dt;
		x = positionX(s,:);
		y = positionY(s,:);

		positionX(s+1,:) = x1 = positionX(s,:) + velocityX(s,:)*dt + 0.5 * acc(x,y) * (dt^2);
		positionY(s+1,:) = y1 = positionY(s,:) + velocityY(s,:)*dt + 0.5 * acc(x,y) * (dt^2);

		velocityX(s+1,:) = velocityX(s,:) + 0.5 * (ax(x,y) + ax(x1,y1)) * dt;
		velocityY(s+1,:) = velocityY(s,:) + 0.5 * (ay(x,y) + ay(x1,y1)) * dt;
	end
	

	% kinetic = m .* (velocityX.^2 + velocityY.^2) ./ 2;
	% potential = -G .* m .* M ./ sqrt( positionX.^2 + positionY.^2);


	% angular = m .* (positionX .* velocityY - positionY .* velocityX);

	position = [positionX positionY];
	velocity = [velocityX velocityY];
