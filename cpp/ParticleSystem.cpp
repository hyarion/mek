#include "ParticleSystem.hpp"

#include "Particle.hpp"

using namespace mechanics;

using namespace std;

void ParticleSystem::add(Particle& particle)
{
	particles.push_back(particle);
}

void ParticleSystem::setTimeStep(double time)
{
	timeStep = time;
}

void step()
{}
