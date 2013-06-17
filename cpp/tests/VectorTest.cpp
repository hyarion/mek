#include <cppunit/extensions/HelperMacros.h>

#include "Vector.hpp"

using namespace mechanics;

class VectorTest : public CppUnit::TestFixture {
	CPPUNIT_TEST_SUITE( VectorTest );
		CPPUNIT_TEST( test_subtracting_negative_vector_should_work );
	CPPUNIT_TEST_SUITE_END();

	private:
		Vector a,b,o;

	public:
		void test_subtracting_negative_vector_should_work()
		{
			a = Vector(1,1);
			b = Vector(-1,-1);

			o = a - b;

			CPPUNIT_ASSERT_DOUBLES_EQUAL( 2.0, o.x, 1E-16);
			CPPUNIT_ASSERT_DOUBLES_EQUAL( 2.0, o.y, 1E-16);
		}
};

CPPUNIT_TEST_SUITE_REGISTRATION( VectorTest );
