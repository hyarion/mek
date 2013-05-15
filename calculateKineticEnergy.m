function energy = calculateKineticEnergy(masses,velocities)
[numberOfBodies, numberOfDimensions, numberOfTimesteps] = size(velocities);
assert(size(masses),[numberOfBodies 1]);

energy = zeros(numberOfBodies, numberOfTimesteps);

for t = 1:numberOfTimesteps
	%v2 = velocities(:,:,t).^2
	%e = sqrt(sum(v2,2))
	%m = masses
	%em = e .* m
	energy(:,t) = masses .* sqrt(sum(velocities(:,:,t).^2,2)) ./ 2;
end
