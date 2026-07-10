# Zshrc
## Install （~/.zshrcが上書きされるので注意)
~~~
cd ~ && git clone https://github.com/Sato0123/Zshrc.git;
mv ~/.zshrc ~/.zshrc_old ; cat <(cat Zshrc/README.md | tail -n +10 | grep -v ~~~ ) > ~/.zshrc;
source ~/.zshrc && rm -Rf Zshrc
~~~

# 設定ファイルの解説
## **alias**
### git
~~~
alias gittree='git log --graph --oneline --all --color=always | less -R'
~~~
### lazygit
~~~
alias lg='lazygit'
~~~
### lazydocker
~~~
alias ld='lazydocker'
~~~
## ディレクトリ移動
### cdコマンド省略でディレクトリに遷移
~~~
setopt auto_cd
~~~
### ~directory_nameでディレクトリに移動できるようにする(cpなどコマンド内でも解決できる)
~~~
hash -d D=/Users/"$USER"/Downloads
~~~
### ディレクトリ移動をコマンドのようにする
~~~
# D と入力するだけでDownloadsフォルダに移動する
function D() {cd /Users/"$USER"/Downloads}
# 以下によく使うディレクトリを追加してください
~~~
## プロンプトの見た目
~~~
PROMPT="%d %% 
      \_ "
~~~
## コマンド入力
### コマンド入力の一時中断と退避
~~~
stty -ixon
bindkey '^S' push-line
~~~

### 現在のコマンドをクリップボードに追加
~~~
clip-buffer() {
  echo -n "\$ $BUFFER" | pbcopy
  BUFFER=""
}

zle -N clip-buffer
bindkey '^G' clip-buffer
~~~

### コマンドラインをvimで編集
~~~
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^V' edit-command-line
~~~

### コマンドラインをnvimで編集
~~~
edit-command-line-extension(){
  local tmp="$(mktemp -p /tmp -u).sh" # ランダムなファイルを生成 macじゃない場合の動作は未確認
  touch "$tmp"
  echo "$BUFFER" > "$tmp" # バッファをファイルに取り込む
  nvim "$tmp"
  BUFFER=$(cat "$tmp") # バッファに編集内容を入れる
  CURSOR=$#BUFFER
  rm $tmp # 一時ファイル削除
  zle redisplay # 再描画(なくても動作するが念の為)
}
zle -N edit-command-line-extension
bindkey '^V' edit-command-line-extension
export VISUAL='nvim'
~~~

### 前回コマンドの引数再利用
~~~
bindkey '^[' insert-last-word
~~~
### 履歴のインクリメンタル検索
~~~
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
# 履歴保存キャパシティ設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
# セッション間での履歴同期と最適化
setopt append_history   # 新しいセッションの履歴をファイル末尾に追加
setopt share_history    # 複数セッション間で履歴を共有する
setopt hist_ignore_dups # 直前と同じコマンドを履歴に追加しない
~~~
## Python関連
### uv tool で入れたものを直接使えるようにする
~~~
export PATH="$HOME/.local/bin:$PATH"
~~~
