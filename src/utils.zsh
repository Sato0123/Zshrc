## 長い文字列を折り畳まず切り捨てる。
wide() {
  tput rmam
  "$@"
  local exit_code=$?
  tput smam
  return $exit_code
}

## !-N で実行できるリストを出す。
alias '?!'=relhist
relhist () {
	fc -l | tac | perl -lane 'print "!-", $.+1 ," @F[1..$#F]"' | tac
}
