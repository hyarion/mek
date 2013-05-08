function forces=force(G,masses,positions)
	[numberOfBodies,numberOfDimensions] = size(positions);

	forces = zeros(numberOfBodies,numberOfDimensions);

	massMatrix = masses * masses';
	massMatrix(logical(eye(numberOfBodies))) = 0;

	differenceVectors = calculateDifferenceVectors(positions)
	distanceVectors = differenceVectors.^2; % rename difference per axis squared
	
	for n=1:numberOfDimensions
		deltaPositions = differenceVectors(:,:,n);
		deltaPositions(:,:,n) = deltaPositions(:,:,n) + eye(numberOfBodies); % enable us to divide by distance

		distanceSquared = deltaPositions.^2;

		% f(j,dimension) = sum_i ((m_i * m_j ) / r_{ij}^2) * (sign(r_{ij}))
		t1 = massMatrix ./ distanceSquared;
		t2 = t1 .* sign(deltaPositions);
		forces(:,n) = sum(t2,2);
	end

	forces = forces * G;
