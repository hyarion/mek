deltaError = 1E-7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
masses = [1];
velocities = [0];
expected = [0];
energy = calculateKineticEnergy(masses,velocities);
assert(energy,expected)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
masses = [1];
velocities = [1];
expected = [0.5];
energy = calculateKineticEnergy(masses,velocities);
assert(energy,expected)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
masses = [1 2]';
velocities = [
	0  1
	-1 0
];
expected = [
	0.5
	1
];
energy = calculateKineticEnergy(masses,velocities);
assert(energy,expected)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
masses = [
	1
	3
];
velocities = zeros(2,3,2);
velocities(:,:,1) = [
	1 2 3
	4 5 6
];
velocities(:,:,2) = [
	1  0 3
	4 -5 6
];
expected = [
	sqrt(14)/2,         sqrt(10)/2
	sqrt(16+25+36)*3/2, sqrt(16+25+36)*3/2
];
assert(calculateKineticEnergy(masses,velocities),expected)
