#pragma once

#include <cmath>

namespace mechanics {
	class Vector {
		public:
			Vector()
				: x(0), y(0)
			{}

			Vector(double x, double y)
				: x(x), y(y)
			{}

			double x, y;

			Vector operator+(Vector& o) const
			{
				Vector r( x + o.x, y + o.y);
				return r;
			}
			Vector operator-(Vector& o) const
			{
				Vector r( x - o.x, y - o.y);
				return r;
			}
			Vector operator*(Vector& o) const
			{
				Vector r( x * o.x, y * o.y);
				return r;
			}

			Vector& operator+=(Vector& o)
			{
				x += o.x;
				y += o.y;

				return *this;
			}

			double length() const
			{
				return sqrt(x*x + y*y);
			}
	};
}
