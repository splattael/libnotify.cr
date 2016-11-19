CRYSTAL_BIN ?= $(shell which crystal)
PREFIX ?= $(CURDIR)
BINDIR = $(PREFIX)/bin
VERSION = $(shell $(CRYSTAL_BIN) run $(BINDIR)/version)

all: spec

spec:
	$(CRYSTAL_BIN) spec

update:
	shards update

clean:
	rm -fr .crystal

release:
	git commit -av -e -m "Release v${VERSION}" && \
	git tag -f v${VERSION} && \
	git push && \
	git push --tags -f

.PHONY: spec clean
