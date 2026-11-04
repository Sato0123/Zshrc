#!/bin/bash
# dotfiles をこのマシンに入れる。何度実行しても同じ結果になる。
#   ./install.sh        すべて入れる
#   ./install.sh zsh    zsh だけ入れる

set -euo pipefail

DOTFILES_DIR=$(cd "$(dirname "$0")" && pwd)
MARKER_CORE='Sato0123'
ALL="zsh vim lazyvim"

# MARKER で挟まれたブロック消し、末尾に追加
replace_block() {
  target=$1
  touch "$target"
  CMO=$2
  tmp=$(mktemp)
  # example: #### Sato0123 ####
  MARKER="${CMO}${CMO}${CMO}${CMO} ${MARKER_CORE} ${CMO}${CMO}${CMO}${CMO}"
  # マーカーブロックを削除
  awk -v m="$MARKER" '$0 == m { skip = !skip; next } !skip { print $0 }' "$target" >"$tmp"
  # 末尾に追加(標準入力をcatしている)
  {
    echo "$MARKER"
    cat
    echo "$MARKER"
  } >>"$tmp"
  cat "$tmp" >"$target"
  rm -f "$tmp"
}

install_zsh() {
  for f in "$DOTFILES_DIR"/zsh/*.zsh; do
    echo "source \"$f\""
  done | replace_block "$HOME/.zshrc" '#'
  echo "zsh: update $HOME/.zshrc"
}

install_vim() {
  for f in "$DOTFILES_DIR"/vim/*.vim; do
    echo "source $f"
  done | replace_block "$HOME/.vimrc" '"'
  echo "vim: update $HOME/.vimrc"
}

install_lazyvim() {
  replace_block "$HOME/.config/nvim/init.lua" '--' <<EOF
vim.opt.rtp:prepend("${DOTFILES_DIR}/lazyvim")
require("config.lazy")
EOF
  echo "lazyvim: update $HOME/.config/nvim/init.lua"
}

targets=${*:-$ALL}
for t in $targets; do
  case $t in
  zsh) install_zsh ;;
  vim) install_vim ;;
  lazyvim) install_lazyvim ;;
  *)
    echo "unknown target: $t" >&2
    exit 1
    ;;
  esac
done
