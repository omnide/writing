SHELL := /usr/bin/env bash -eEuo pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
.DEFAULT_GOAL := demo

OUTDIR := ../../.work/c4puml
PUML := JAVA_TOOL_OPTIONS="-Djava.awt.headless=true" plantuml

.PHONY: demo
demo:
	mkdir -p $(OUTDIR)/includes
	structurizr export -workspace dsl/catalog.dsl -format plantuml/c4plantuml -output $(OUTDIR)
	cp -f dsl/includes-c4puml.puml $(OUTDIR)/includes/c4puml.puml
	$(PUML) -o $(OUTDIR) $(OUTDIR)/*.puml