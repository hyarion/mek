TESTS = $(wildcard *_test.m)

TESTED_FILES = $(patsubst %_test.m,%.m,$(TESTS))

OCTAVE = octave -q

default: .uppg1 .uppg2 .uppg2_iss .uppg4

.uppg2_iss: uppg2_iss.m .uppg2_iss
	$(OCTAVE) -f $<
	touch $@

tests: $(TESTS) $(TESTED_FILES)
	@for f in $(TESTS) ; do \
	echo "Running tests in" $$f; \
	$(OCTAVE) -f $$f; \
	done

.uppg%: uppg%.m
	$(OCTAVE) -f $<
	touch $@
