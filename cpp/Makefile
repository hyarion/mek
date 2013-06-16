CXX = clang++
CC  = clang

CPPFLAGS += -I.
LDLIBS   += -lm
TESTLIBS += -lcppunit

OBJS = $(patsubst %.cpp,%.o,$(wildcard *.cpp))

TESTOBJS = $(patsubst %.cpp,%.o,$(wildcard tests/*.cpp))

default: run_tests

target: $(OBJS)
	@echo yaay

tests/AllTests: $(TESTOBJS)
	$(LINK.o) $^ $(LDLIBS) $(TESTLIBS) -o $@

run_tests: tests/AllTests
	$^
.PHONY: run_tests
