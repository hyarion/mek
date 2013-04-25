function acelerations = calculateAccelerations(positions, masses, gravitationalConstant)
	[numberOfBodies,numberOfDimensions] = size(positions);

	differenceVectors = calculateDifferenceVectors(positions);
	distanceVectors = differenceVectors.^2; % rename difference per axis squared
	distanceCube = sqrt(sum(distanceVectors, 3)).^3;
	
	distanceCube += eye(numberOfBodies);

	accelerations = zeros(numberOfBodies,numberOfDimensions);
	for dimension = 1:numberOfDimensions
		tmp1 = gravitationalConstant * masses;
		tmp2 = differenceVectors(:,:,dimension);
		acelerations(:,dimension) = tmp1 * (tmp2 ./ distanceCube);
	end

