#!/usr/bin/env bash
set -eEo pipefail

source ./library.sh

# nanolayer is a cli utility which keeps container layers as small as possible
# source code: https://github.com/devcontainers-contrib/nanolayer
# `ensure_nanolayer` is a bash function that will find any existing nanolayer installations, 
# and if missing - will download a temporary copy that automatically get deleted at the end 
# of the script
ensure_nanolayer nanolayer_location "v0.5.5"

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/apt-get-packages:1.0.6" \
    --option packages='python3-distutils,delta,fd-find,fzf,ripgrep,thefuck'

ln -s /usr/bin/batcat /usr/bin/bat
ln -s /usr/bin/fdfind /usr/bin/fd

$nanolayer_location \
    install \
    devcontainer-feature \
    "ghcr.io/devcontainers-contrib/features/gh-release:1.0.24" \
    --option repo='Peltoche/lsd' --option binaryNames='lsd'

echo 'Done!'