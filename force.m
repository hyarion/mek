function forces=force(G,masses,x, y)
	[numberOfBodies] = size(masses, 1);

	forces = calculateAccelerations(x, y, masses, G) .* masses;
