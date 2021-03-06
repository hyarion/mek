deltaError = 1E-6;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
G = 1.0;
m = [1 1];
p = [0 0
     1 1];
expected = [
	 0.5/sqrt(2),  0.5/sqrt(2)
	-0.5/sqrt(2), -0.5/sqrt(2)
];
assert(force(G,m,p),expected, deltaError)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
