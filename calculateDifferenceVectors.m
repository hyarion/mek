function differenceVectors=calculateDifferenceVectors(positions)
	% positions: matrix(numberOfBodies x numberOfDimensions)
	% masses:    vector(numberOfBodies)
	[numberOfBodies,numberOfDimensions] = size(positions);

	positionMatrix    = zeros(numberOfBodies, numberOfBodies, numberOfDimensions);
	differenceVectors = zeros(numberOfBodies, numberOfBodies, numberOfDimensions);

	% FUCK YOU MATLAB FOR NOT HAVING TENSOR MULTIPLICATION
	onesVector = ones(1, numberOfBodies);
	for dimension = 1:numberOfDimensions
		positionMatrix(:,:,dimension) = positions(:,dimension) * onesVector;
	end
	for dimension = 1:numberOfDimensions
		differenceVectors(:,:,dimension) = positionMatrix(:,:,dimension) - positionMatrix(:,:,dimension)';
	end
	
