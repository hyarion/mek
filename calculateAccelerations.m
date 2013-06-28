function [ax, ay] = calculateAccelerations(x, y, masses, gravitationalConstant)
	numberOfBodies = size(masses);

	ax = zeros(numberOfBodies,1);
	ay = zeros(numberOfBodies,1);

	for j = 1:numberOfBodies
		for k = 1:numberOfBodies
			if j ~= k
				xdiff = x(j) - x(k);
				ydiff = y(j) - y(k);

				distance = sqrt(xdiff^2 + ydiff^2);

				% calculate the size of the acceleration
				a = G .* m(k) ./ distance.^2;

				ax(j) = a * xdiff / distance;
				ay(j) = a * ydiff / distance;
			end
		end
	end
