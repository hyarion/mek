function forces=force(G,masses,positions)
	[numberOfBodies,numberOfDimensions] = size(positions);

	forces = zeros(numberOfBodies,numberOfDimensions);

	forces = calculateAccelerations(positions, masses, G) .* (masses' * ones(1,numberOfDimensions));
