#!/usr/bin/env zsh

set -euo pipefail

if [[ ! -f ~/.zshrc ]]; then
  echo ".zshrc is not found at HOME" 
  exit 1
fi

MAKER='#### Sato0123/Zshrc ####'

SCRIPT_DIR="${0:A:h}/src"

cat <<EOF >> ~/.zshrc
${MAKER}
source "${SCRIPT_DIR}/bases.zsh"
source "${SCRIPT_DIR}/utils.zsh"
${MAKER}
EOF
