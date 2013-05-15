deltaError = 1E-7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
masses = [1];
velocities = [1 0];
momentum = calculateLinearMomentum(masses, velocities);
expected_momentum = [1 0];
assert(momentum, expected_momentum)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
masses = [0.23 51 0.79]';
velocities = [
	1	0
	-5	9
	3	-6
];
momentum = calculateLinearMomentum(masses, velocities);
expected_momentum = [
	0.23     0
	(-5*51)  (9*51)
	0.79*3   0.79*(-6)
];
assert(momentum, expected_momentum)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
masses = [0.23 51 0.79]';
velocities = zeros(3,2,2);
velocities(:,:,1) = [
	1	0
	-5	9
	3	-6
];
velocities(:,:,2) = [
	0	1
	5	-9
	-3	6
];
momentum = calculateLinearMomentum(masses, velocities);
expected_momentum = zeros(3,2,2);
expected_momentum(:,:,1) = [
	0.23     0
	(-5*51)  (9*51)
	0.79*3   0.79*(-6)
];
expected_momentum(:,:,2) = [
	0     0.23
	(5*51)  (-9*51)
	0.79*(-3)   0.79*(6)
];
assert(momentum, expected_momentum)
