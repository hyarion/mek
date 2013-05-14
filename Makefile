TESTS  = calculateAccelerations_test.m
TESTS += calculateDifferenceVectors_test.m

TESTED_FILES = $(patsubst %_test.m,%.m,$(TESTS))

OCTAVE = octave -q

tests: $(TESTS) $(TESTED_FILES)
	@for f in $(TESTS) ; do \
	echo "Running tests in" $$f; \
	$(OCTAVE) -f $$f; \
	done
