# dotfiles

[Sato0123](https://github.com/Sato0123) の設定ファイル置き場。

## インストール

```sh
git clone git@github.com:Sato0123/dotfiles.git ~/dotfiles
~/dotfiles/install.sh          # すべて入れる（zsh, vim）
~/dotfiles/install.sh zsh      # zsh だけ入れる
~/dotfiles/install.sh vim      # vim だけ入れる
```

何度実行しても同じ結果になります。`~/.zshrc` / `~/.vimrc` のうち、マーカー行で挟まれた部分だけを書き換えます。

| 対象 | 書き換えるファイル | マーカー |
| --- | --- | --- |
| zsh | `~/.zshrc` | `#### Sato0123 ####` |
| vim | `~/.vimrc` | `"""" Sato0123 """"` |

リポジトリの場所を移したときや、`zsh/` `vim/` にファイルを足したときは、もう一度実行してください。

## アンインストール

```sh
~/dotfiles/uninstall.sh        # すべて外す
~/dotfiles/uninstall.sh zsh    # zsh だけ外す
~/dotfiles/uninstall.sh vim    # vim だけ外す
```

マーカーで挟まれた部分を削除します。それ以外の行には触りません。

## zsh/

`zsh/*.zsh` を `~/.zshrc` から読み込みます。

### bases.zsh
  必要なコア機能

Requirements
- neovim
- lazygit
- lazydocker
- docker
- docker compose
- git

### utils.zsh
  あると嬉しい道具箱

Requirements
- tac
- fzf
- ffmpeg

## vim/

`vim/*.vim` を `~/.vimrc` から読み込みます。

### base.vim
  基本設定（行番号・検索ハイライトなど）とキーマップ

| モード | キー | 動作 |
| --- | --- | --- |
| 挿入 | `jk` | ノーマルモードに戻る |
| ノーマル | `QQ` | 保存せずに閉じる（`:q!`） |
| ビジュアル | `s` | 選択範囲内で置換（`:s/\%V`） |
