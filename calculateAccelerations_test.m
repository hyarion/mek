deltaError = 1E-7;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = [0 0
     1 1];
m = [1 1];
G = 1;
expected = [
	 0.5/sqrt(2),  0.5/sqrt(2)
	-0.5/sqrt(2), -0.5/sqrt(2)
];
assert(calculateAccelerations(p,m,G),expected,deltaError)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = [0 0
     1 1];
m = [1 1];
G = 2;
expected = [
	 1.0/sqrt(2),  1.0/sqrt(2)
	-1.0/sqrt(2), -1.0/sqrt(2)
];
assert(calculateAccelerations(p,m,G),expected,deltaError)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p = [0 0
     1 1];
m = [2 1];
G = 2;
expected = [
	 1.0/sqrt(2),  1.0/sqrt(2)
	-2.0/sqrt(2), -2.0/sqrt(2)
];
assert(calculateAccelerations(p,m,G),expected,deltaError)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% p = [1 0
%      0 1];
% m = [2 1];
% G = 2;
% 
% rs = calculateDifferenceVectors(p);
% r = sqrt(sum(rs(2,1,:).^2,3));
% magicPotion = G * m(1) * m(2) / r.^2;
% expected = magicPotion * (rs ./ r);
% assert(calculateAccelerations(p,m,G),expected,deltaError)
