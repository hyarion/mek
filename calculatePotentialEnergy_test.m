deltaError = 1E-7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gravitationalConstant = 1;
masses = [1 1]';
positions = [
	0 0
	1 0
];
expected = [ -1 -1 ]';
potential = calculatePotentialEnergy(masses, positions, gravitationalConstant);
assert(potential,expected)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gravitationalConstant = 1;
masses = [3 2]';
positions = [
	0 0
	1 0
];
expected = [ -6 -6 ]';
potential = calculatePotentialEnergy(masses, positions, gravitationalConstant);
assert(potential,expected)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gravitationalConstant = 1;
masses = [3 2 1]';
positions = [
	0,0
	1,0
	0,-1
];
expected = [
	-6-3-sqrt(2)
];
potential = calculatePotentialEnergy(masses, positions, gravitationalConstant);
assert(potential,expected)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
gravitationalConstant = 0.234789;
N = 15;
masses = rand(N,1);
positions = rand(N,2,1);
expected = zeros(1);
distances = sqrt(sum(calculateDifferenceVectors(positions).^2,3));
for r = 1:N-1
	currentPotential = 0;
	for k = r+1:N
		if r ~= k
			currentPotential += masses(k) ./ distances(r,k);
		end
	end
	expected += - currentPotential * masses(r) * gravitationalConstant;
end

potential = calculatePotentialEnergy(masses, positions, gravitationalConstant);
assert(potential,expected)

