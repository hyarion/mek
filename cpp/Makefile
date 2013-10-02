CXX = clang++
CC  = clang

CPPFLAGS += -I.
LDLIBS   += -lm -lstdc++
TESTLIBS += -lcppunit

OBJS = $(patsubst %.cpp,%.o,$(wildcard *.cpp))

TESTOBJS = $(patsubst %.cpp,%.o,$(wildcard tests/*.cpp))

default: run_tests

tests/AllTests: $(TESTOBJS) $(OBJS)
	$(LINK.o) $^ $(LDLIBS) $(TESTLIBS) -o $@

run_tests: tests/AllTests
	$^
.PHONY: run_tests

clean:
	$(RM) $(OBJS) $(TESTOBJS) tests/AllTests
