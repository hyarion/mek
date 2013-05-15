deltaError = 1E-7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gravitationalConstant = 1;
masses = [1 1]';
positions = [
	0 0
	1 0
];
expected = [
	-1
	-1
];
potential = calculatePotentialEnergy(masses, positions, gravitationalConstant);
assert(potential,expected)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gravitationalConstant = 0.234789;
N = 5;
masses = rand(N,1);
positions = rand(N,2,1);
expected = zeros(N,1);
distances = sqrt(sum(calculateDifferenceVectors(positions).^2,3));
for k = 1:N
	for r = 1:N
		if r ~= k
			expected(k,1) += masses(r) ./ distances(k,r);
		end
	end
	expected(k,1) *= - masses(k) * gravitationalConstant;
end
potential = calculatePotentialEnergy(masses, positions, gravitationalConstant);
assert(potential,expected)

