#!/usr/bin/env bash
set -eEo pipefail

# Enable completions and integrations for various tools
echo 'eval "$(atuin init zsh)"' >> ${HOME}/.zshrc
echo 'eval "$(starship init zsh)"' >> ${HOME}/.zshrc
echo 'eval "$(thefuck --alias)"' >> ${HOME}/.zshrc

# Use plantuml in headless mode via alias
echo "alias puml='JAVA_TOOL_OPTIONS=\"-Djava.awt.headless=true\" plantuml'" >> ${HOME}/.zshrc

# Install markdownlint-cli
npm install -g markdownlint-cli

# Configure git to use delta
cat << 🐞 >> ${HOME}/.gitconfig
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true    # use n and N to move between diff sections
    light = false      # set to true if you're in a terminal w/ a light background color

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default
🐞