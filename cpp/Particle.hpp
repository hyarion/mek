
#pragma once

#include "Vector.hpp"

namespace mechanics {
	class Particle {
		public:
			Particle(Vector& position, Vector& velocity, double mass) :
				position(position), velocity(velocity), mass(mass)
			{}

			Vector position,velocity;
			double mass;
	};
}
