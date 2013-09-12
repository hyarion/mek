function [positionX,positionY,velocityX,velocityY,t]=orbit_Nbody(G,m,p0,v0,dt,tmax)

	gravitationalConstant = G;

	%gravitationalConstant = 6.67384E-11;

	numberOfBodies = size(m,2);
	numberOfSteps = floor(tmax/dt) + 1;
	t         = zeros(numberOfSteps,1);
	positionX = zeros(numberOfSteps,numberOfBodies);
	positionY = zeros(numberOfSteps,numberOfBodies);
	velocityX = zeros(numberOfSteps,numberOfBodies);
	velocityY = zeros(numberOfSteps,numberOfBodies);

	% momentumX = zeros(numberOfSteps,1);
	% momentumY = zeros(numberOfSteps,1);
	kinetic   = zeros(numberOfSteps,2);
	potential = zeros(numberOfSteps,1);

	angular   = zeros(numberOfSteps,1);

	positionX(1,:) = p0(1,:);
	positionY(1,:) = p0(2,:);
                          
	velocityX(1,:) = v0(1,:)
	velocityY(1,:) = v0(2,:)

	%ax = @(x, y, p) -G * M * x / sqrt(x^2 + y^2)^3;
	%ay = @(x, y, p) -G * M * y / sqrt(x^2 + y^2)^3;

	for s = 1:numberOfSteps-1
		t(s+1) = t(s) + dt;
		x = positionX(s,:);
		y = positionY(s,:);

		[ax, ay] = acc(x,y,m,G);
		positionX(s+1,:) = x1 = positionX(s,:) .+ velocityX(s,:).*dt .+ 0.5 .* ax .* (dt^2);
		positionY(s+1,:) = y1 = positionY(s,:) .+ velocityY(s,:).*dt .+ 0.5 .* ay .* (dt^2);

		[ax1, ay1] = acc(x1,y1,m,G);
		velocityX(s+1,:) = velocityX(s,:) + 0.5 * (ax + ax1) * dt;
		velocityY(s+1,:) = velocityY(s,:) + 0.5 * (ay + ay1) * dt;
	end
	

	% kinetic = m .* (velocityX.^2 + velocityY.^2) ./ 2;
	% potential = -G .* m .* M ./ sqrt( positionX.^2 + positionY.^2);


	% angular = m .* (positionX .* velocityY - positionY .* velocityX);

end

function [fx, fy] = force(x, y, m, G)
	% Appearently numberOfBodies was otherwise occupied, meet its evil twin
	bumberOfBodies = size(m,2);
	fx = zeros(1,bumberOfBodies);
	fy = zeros(1,bumberOfBodies);
	% TODO: Calculate forces once only
	for p = 1:bumberOfBodies
		px = x(p);
		py = y(p);
		for q = 1:bumberOfBodies
			if q ~= p
				qx = x(q);
				qy = y(q);
				r = sqrt((px-qx)^2 + (py-qy)^2);
				fx(p) .+= -G .* m(p) .* m(q) .* (px .- qx) ./ r.^3;
				fy(p) .+= -G .* m(p) .* m(q) .* (py .- qy) ./ r.^3;
			end
		end
	end
end

% kinetic(1) = m * sum(v0.^2);
function [ax,ay] = acc(x,y,m,G)
	[fx, fy] = force(x,y,m,G);
	ax = fx ./ m;
	ay = fy ./ m;
end

