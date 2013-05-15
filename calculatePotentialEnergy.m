function potential = calculatePotentialEnergy(masses,positions,gravitationalConstant)
[numberOfBodies, numberOfDimensions, numberOfTimesteps] = size(positions);
assert(size(masses),[numberOfBodies 1]);

potential = zeros(numberOfBodies, numberOfTimesteps);

distances = sqrt(sum(calculateDifferenceVectors(positions).^2,3)); % + eye(numberOfBodies);
% tmpMasses = masses * ones(1,numberOfBodies);
% tmpMasses(logical(eye(numberOfBodies))) = 0;

for t = 1:numberOfTimesteps
% 	potential(:,t) = - (tmpMasses ./ distances) * masses;
	for k = 1:numberOfBodies
		for r = 1:numberOfBodies
			if r ~= k
				potential(k,1) += masses(r) ./ distances(k,r);
			end
		end
		potential(k,1) *= - masses(k) * gravitationalConstant;
	end
end
