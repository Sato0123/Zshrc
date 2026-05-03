# Zshrc
## Install
~~~
cd ~ && git clone git@github.com:Sato0123/Zshrc.git;
mv ~/.zshrc ~/.zshrc_old ; cat <(cat Zshrc/README.md | grep -v ~~~ | tail -n +10) > ~/.zshrc
rm -Rf Zshrc
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
### コマンドラインをvimで編集
~~~
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^V' edit-command-line
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
