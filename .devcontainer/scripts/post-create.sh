#!/usr/bin/env bash
set -eEuo pipefail

echo "Post-create steps"

python -m pip install --upgrade pip
python -m pip install -r requirements.txt