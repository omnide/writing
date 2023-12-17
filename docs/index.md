---
title: Writing Kit
---

# :writing_hand_tone4: Writing Kit

Writing kit is a template repository for creating documentation sites using
[squidfunk's mkdocs-material](https://squidfunk.github.io/mkdocs-material) project. It includes a
hand-crafted [devcontainer](https://containers.dev) experience to make activities that are adjacent
to writing and publishing easier.

For software engineers, most important work entails writing professional, technical prose in
combination with diagrams, code snippets and other visual aids. This template project provides an
opinionated selection of tools and patterns that are useful for composing clear and efficient
documents.

## :material-microsoft-visual-studio-code: Devcontainer

The devcontainer includes a variety of useful tools for writing, data manipulation and diagrams. It
is built on top of the python base devcontainer primarily in support of MkDocs. Support for
additional programming languages is layered on top. See also the
[full details on the devcontainer composition](devcontainer/index.md).

### Material for MkDocs

#### Neoteroi's plugins

The [plugins from neoteroi](https://www.neoteroi.dev/mkdocs-plugins/) provide extra visualizations
that are useful alternatives to common tables and lists.

- [cards](examples/cards/index.md)
- [gantt](examples/gantt/index.md)
- [timeline](examples/timeline/index.md)

### Structurizr and PlantUML

### Modern Unix utilities via Nixpkgs

- atuin - shell history replacement
- bat - better cat
- cue - cuelang config language cli
- delta - better diff viewer, auto-wired to augment `git diff`
- direnv - customize env vars when entering a directory with `.envrc`
- eza - alternative to ls
- fd - fast, friendly replacement for `find`, with sensible defaults
- fzf - fuzzy find to locate files while constructing commands, i.e. `$(fzf)`
- gh - github cli
- jq - json query cli
- lsd - alternative to ls, displays type icons by default
- ripgrep - faster grep
- starship - more informative prompt for integrated terminal
- thefuck - fuck cli for autocorrecting mistyped commands
- yq - yaml query cli

###

## Conventions
