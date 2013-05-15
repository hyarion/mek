function potential = calculatePotentialEnergy(masses,positions,gravitationalConstant)
[numberOfBodies, numberOfDimensions, numberOfTimesteps] = size(positions);
assert(size(masses),[numberOfBodies 1]);

potential = zeros(numberOfBodies,numberOfTimesteps);

% tmpMasses = masses * ones(1,numberOfBodies);
% tmpMasses(logical(eye(numberOfBodies))) = 0;

for t = 1:numberOfTimesteps
% 	potential(:,t) = - (tmpMasses ./ distances) * masses;
	distances = sqrt(sum(calculateDifferenceVectors(positions(:,:,t)).^2,3));
	%distances./1.49597871E11
	% + eye(numberOfBodies);
	for r = 1:numberOfBodies
		%printf('\tr: %d\n',r)
		for k = 1:numberOfBodies
			%printf('\t\tk: %d\n',k)
			if r ~= k
				potential(r,t) += masses(k) ./ distances(r,k);
				%printf('\t\t\tv: %g\n',masses(k) ./ distances(r,k))
			end
		end
		%printf('\t\tmasses(r): %g\n',masses(r))
		potential(r,t) *= (-masses(r)) * gravitationalConstant;
	end
end

