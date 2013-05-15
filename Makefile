TESTS = $(wildcard *_test.m)

TESTED_FILES = $(patsubst %_test.m,%.m,$(TESTS))

OCTAVE = octave -q

tests: $(TESTS) $(TESTED_FILES)
	@for f in $(TESTS) ; do \
	echo "Running tests in" $$f; \
	$(OCTAVE) -f $$f; \
	done

uppg%: uppg%.m
	$(OCTAVE) -f $<
.PHONY: uppg1
