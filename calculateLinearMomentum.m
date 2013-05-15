function momentum = calculateLinearMomentum(masses, velocities)
[numberOfBodies,numberOfDimensions,numberOfTimesteps] = size(velocities);
assert(size(masses),[numberOfBodies 1]);

momentum = zeros(numberOfBodies,numberOfDimensions,numberOfTimesteps);

tmpMasses = masses * ones(1,1,numberOfTimesteps);

for d = 1:numberOfDimensions
	momentum(:,d,:) = tmpMasses .* velocities(:,d,:);
endfor
