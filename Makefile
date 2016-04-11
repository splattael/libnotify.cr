CRYSTAL_BIN ?= $(shell which crystal)

all: spec

spec:
	$(CRYSTAL_BIN) spec

update:
	shards update

clean:
	rm -fr .crystal

.PHONY: spec clean
