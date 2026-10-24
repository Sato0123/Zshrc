# applications
alias n='nvim'
alias ld='lazydocker'
alias lg='lazygit'
alias dcd='docker compose down'
alias dcup='docker compose up -d'


# Directories
setopt auto_cd

hash -d D=/Users/"$USER"/Downloads
function D() {cd /Users/"$USER"/Downloads}

# Prompt
setopt PROMPT_SUBST

GIT_INFO=()
precmd() {
  local current_branch=''
  local current_head=''
  if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
    current_branch=$(git branch --show-current)
    current_head=$(git rev-parse --short HEAD)
  fi
  GIT_INFO=("${current_branch:=''}" "${current_head:=''}")
}

PROMPT='host  : %m
path  : %d
branch: ${GIT_INFO[1]} (${GIT_INFO[2]})
	\\_$ '

## push-line
stty -ixon
bindkey '^S' push-line

## clip-buffer
clip-buffer() {
  echo -n "\$ $BUFFER" | pbcopy
  BUFFER=""
}
zle -N clip-buffer
bindkey '^G' clip-buffer

## edit command-line by vim
edit-command-line-extension() {
  local tmp="$(mktemp -p /tmp -u).zsh"
  touch "$tmp"
  echo "$BUFFER" >"$tmp"
  nvim "$tmp"
  BUFFER=$(cat "$tmp")
  CURSOR=$#BUFFER
  rm $tmp
  zle redisplay # 再描画(なくても動作するが念の為)
}
zle -N edit-command-line-extension
bindkey '^V' edit-command-line-extension
export VISUAL='nvim'

### 前回コマンドの引数再利用

bindkey '^[' insert-last-word

### 履歴のインクリメンタル検索

bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

# History

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# セッション間での履歴同期と最適化

setopt append_history   # 新しいセッションの履歴をファイル末尾に追加
setopt share_history    # 複数セッション間で履歴を共有する
setopt hist_ignore_dups # 直前と同じコマンドを履歴に追加しない

