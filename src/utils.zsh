## 長い文字列を折り畳まず切り捨てる。
wide(){
  tput rmam
  "$@"
  local exit_code=$?
  tput smam
  return $exit_code
}
alias wide='wide '

## !-N で実行できるリストを出す。
relhist(){
    fc -l | tac | perl -lane 'print "!-", $.+1 ," @F[1..$#F]"' | tac
    echo "!! $history[$HISTCMD]"
}
alias '?!'=relhist

## 収録した動画をgifにする。(Mac)
## $1 -> 生成ファイルの名前
ffmpeg_out_gif_from_desktop_to_download(){
  local out_name=${1:+${1%.gif}.gif}
  out_name=${out_name:-output.gif}
  ffmpeg \
    -i "$(find ~/Desktop -type f | fzf)" \
    -vf "setpts=0.8*PTS,fps=10,scale=1500:-1:flags=lanczos" \
    "${HOME}/Downloads/${out_name}"
}

## gitリポジトリの一番上に移動する
git-top(){
  cd $(git rev-parse --show-toplevel)
}
