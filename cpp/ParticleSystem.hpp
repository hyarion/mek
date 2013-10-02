#pragma once

#include <vector>

namespace mechanics {
	class Particle;

	class ParticleSystem {
		public:
			std::vector<Particle> particles;
			double timeStep;

			void add(Particle& particle);
			void setTimeStep(double time);

			void step();
	};
}
