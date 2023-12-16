SHELL := /usr/bin/env bash -eEuo pipefail -c
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
.DEFAULT_GOAL := serve

# Listed first so it appears first in Task Explorer
.PHONY: serve
serve:
	mkdocs serve

.PHONY: linkcheck
linkcheck:
	@echo "Checking links..."
	mkdocs-linkcheck -r -l docs/ --exclude images/

.PHONY: lint
lint: linkcheck

.PHONY: mdlint
mdlint:
	markdownlint ./docs

