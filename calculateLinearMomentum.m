function momentum = calculateLinearMomentum(masses, velocities)
[numberOfBodies,numberOfDimensions,numberOfTimesteps] = size(velocities);
assert(size(masses),[numberOfBodies 1]);

momentum = zeros(numberOfBodies,numberOfDimensions,numberOfTimesteps);

tmpMasses = masses * ones(1,numberOfDimensions);

for t = 1:numberOfTimesteps
	momentum(:,:,t) = tmpMasses .* velocities(:,:,t);
endfor
