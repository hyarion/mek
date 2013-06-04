function [position,velocity,t]=orbit_Nbody(G,m,p0,v0,dt,tmax)
	masses = m;
	%gravitationalConstant = 6.67384E-11;
	gravitationalConstant = G;
	[numberOfBodies,numberOfDimensions] = size(p0);


	numberOfSteps = floor(tmax/dt) + 1;
	t         = zeros(numberOfSteps,1);
	position  = zeros(numberOfBodies,numberOfDimensions,numberOfSteps);
	velocity  = zeros(numberOfBodies,numberOfDimensions,numberOfSteps);
	acceleration = zeros(numberOfBodies,numberOfDimensions,numberOfSteps);

	% Debug
	%global kineticEnergyVector = zeros(numberOfSteps,1);

	position(:,:,1) = p0;
	velocity(:,:,1) = v0;
	acceleration(:,:,1) = calculateAccelerations(position(:,:,1),masses, gravitationalConstant);

	%tmp = calculateAccelerations(positions, masses, gravitationalConstant);
	%sateliteAcceleration(1,:) = tmp(2,:);

	%global potentialEnergy;
	%global potentialEnergyVector;
	%potentialEnergyVector = zeros(numberOfSteps,1);
	% size(potentialEnergyVector)

	for s = 1:numberOfSteps-1
		t(s+1) = t(s) + dt;

		position(:,:,s+1) = position(:,:,s) + velocity(:,:,s)*dt + 0.5 * acceleration(:,:,s) * (dt^2);

		acceleration(:,:,s+1) = calculateAccelerations(position(:,:,s+1), masses, gravitationalConstant);

		velocity(:,:,s+1) = velocity(:,:,s) + 0.5 * (acceleration(:,:,s+1) + acceleration(:,:,s)) * dt;

		%potentialEnergyVector(s+1) = potentialEnergy(1);
		if rem(s,5E3) == 0
			printf('.',stderr)
			fflush(stderr);
		end
	end
	printf('\n',stderr)

	% plot(position(:,1,:), position(:,2,:))
	
	%kineticEnergyVector = sum(velocity.^2, 2) .* (m/2);
	% size(kineticEnergyVector)
