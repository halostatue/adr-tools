TESTS:=$(wildcard tests/*.sh)
SRC:=$(wildcard src/*)

# Run tests outside the project directory so that they cannot interfere with
# the project's own ADR directory
BUILDDIR:=/tmp/adr-tools-build

check: $(TESTS:tests/%.sh=$(BUILDDIR)/tests/%.diff)
	@echo SUCCESS

recheck: clean check

tests/adr-config.expected: tests/adr-config.expected.tmpl
	@sed -e "s!__PWD__!$(shell pwd -P)!g" < $< > $@

$(BUILDDIR)/tests/%.diff: $(BUILDDIR)/tests/%.output tests/%.expected
	@diff --side-by-side $^ > $@ || ! cat -n $@
	@#diff --side-by-side --width 225 $^ > $@ || ! cat -n $@
	@#diff -u $^ > $@ || ! cat $@

$(BUILDDIR)/tests/%.output: tests/%.sh tests/%.expected $(SRC)
	@echo TEST: $*
	@rm -rf $(dir $@)/$*
	@mkdir -p $(dir $@)/$*
	@(cd $(dir $@)/$* && \
		PATH=$(abspath src):$(abspath tests):$$PATH \
	  ADR_DATE=1992-01-12 \
	  VISUAL= \
	  EDITOR= \
	  PS4='+ ' \
	    /bin/sh -v $(abspath $<) > $(abspath $@) 2>&1) || ! cat $@

clean:
	@rm -rf $(BUILDDIR) tests/adr-config.expected

show-%:
	@echo "$* ($(flavor $*)) = $($*)"

.PHONY: all clean
.PRECIOUS: $(BUILDDIR)/tests/%.output
.DELETE_ON_ERROR:
