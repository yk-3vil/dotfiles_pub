# Vim Cheat Sheet

Leader key: `Space`

## Custom Keybindings (.vimrc)

### Mode Switching

| Key | Mode | Action |
|-----|------|--------|
| `jj` | Insert | Normal mode に戻る |
| `jk` | Insert | Normal mode に戻り `:` を入力 |

### Search

| Key | Mode | Action |
|-----|------|--------|
| `Esc Esc` | Normal | 検索ハイライト解除 |

### Buffer Navigation

| Key | Mode | Action |
|-----|------|--------|
| `Alt-,` | Normal | 前のバッファへ移動 |
| `Alt-.` | Normal | 次のバッファへ移動 |
| `Alt-1`~`Alt-9` | Normal | バッファ番号指定ジャンプ |
| `Alt-c` | Normal | 現在のバッファを閉じる |

### NERDTree (File Explorer)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl-n` | Normal | NERDTree 開閉 |
| `Ctrl-Shift-e` | Normal | NERDTree 開閉 |
| `Space nf` | Normal | 現在のファイルを NERDTree 上で表示 |

### Fuzzy Finder (fzf)

| Key | Mode | Action |
|-----|------|--------|
| `Space ff` | Normal | ファイル検索 |
| `Space fg` | Normal | Ripgrep テキスト検索 |
| `Space fb` | Normal | バッファ一覧 |
| `Space fh` | Normal | ヘルプタグ検索 |
| `Space fk` | Normal | キーマッピング一覧 |
| `Space fo` | Normal | ファイル履歴 |
| `Space f/` | Normal | 現在バッファ内の行検索 |
| `Space fgs` | Normal | Git status ファイル一覧 |

### LSP

| Key | Mode | Action |
|-----|------|--------|
| `gd` | Normal | 定義へジャンプ |
| `gD` | Normal | 宣言へジャンプ |
| `gy` | Normal | 型定義へジャンプ |
| `gr` | Normal | 参照一覧 |
| `K` | Normal | ホバー情報表示 |
| `Ctrl-k` | Normal | シグネチャヘルプ |
| `Space fm` | Normal | ドキュメントフォーマット |
| `Space rn` | Normal | リネーム |
| `Space e` | Normal | 診断一覧表示 |
| `Space q` | Normal | Location list を開く |
| `]d` | Normal | 次の診断へ |
| `[d` | Normal | 前の診断へ |

### Autocomplete

| Key | Mode | Action |
|-----|------|--------|
| `Tab` | Insert | 次の補完候補 (ポップアップ表示中) |
| `Shift-Tab` | Insert | 前の補完候補 (ポップアップ表示中) |
| `Enter` | Insert | 補完候補を確定 (ポップアップ表示中) |
| `Ctrl-Space` | Insert | 補完を強制表示 |

### Snippet (vim-vsnip)

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl-j` | Insert/Select | スニペット展開 |
| `Ctrl-l` | Insert/Select | 次のプレースホルダへ |
| `Ctrl-h` | Insert/Select | 前のプレースホルダへ |

### Git (GitGutter)

| Key | Mode | Action |
|-----|------|--------|
| `]h` | Normal | 次の hunk へ |
| `[h` | Normal | 前の hunk へ |
| `Space hs` | Normal | hunk をステージ |
| `Space hr` | Normal | hunk を元に戻す |
| `Space hp` | Normal | hunk をプレビュー |

### Git (Fugitive / git-messenger)

| Key | Mode | Action |
|-----|------|--------|
| `Space gs` | Normal | Git status |
| `Space gb` | Normal | Git blame |
| `Space gd` | Normal | Git diff (split) |
| `Space gh` | Normal | 現在ファイルの Git log |
| `Space gH` | Normal | プロジェクト全体の Git log |
| `Space gm` | Normal | カーソル行のコミットメッセージ表示 |

### Diagnostics / Quickfix

| Key | Mode | Action |
|-----|------|--------|
| `Space xx` | Normal | Quickfix ウィンドウを開く |
| `Space xq` | Normal | Quickfix ウィンドウを開く |

### Window Resize

| Key | Mode | Action |
|-----|------|--------|
| `Ctrl-e` | Normal | ウィンドウリサイズモード開始 (winresizer) |

### Which Key

| Key | Mode | Action |
|-----|------|--------|
| `Space` | Normal/Visual | キーマッピングガイド表示 |

---

## General Vim Keybindings

### Cursor Movement

| Key | Action |
|-----|--------|
| `h` `j` `k` `l` | 左 / 下 / 上 / 右 |
| `w` | 次の単語の先頭へ |
| `b` | 前の単語の先頭へ |
| `e` | 単語の末尾へ |
| `W` `B` `E` | WORD 単位 (空白区切り) |
| `0` | 行頭へ |
| `^` | 行頭の非空白文字へ |
| `$` | 行末へ |
| `gg` | ファイル先頭へ |
| `G` | ファイル末尾へ |
| `{number}G` | 指定行へジャンプ |
| `{` / `}` | 段落単位で上 / 下 |
| `(` / `)` | 文単位で前 / 後 |
| `%` | 対応する括弧へ |
| `H` / `M` / `L` | 画面の上 / 中央 / 下 |
| `Ctrl-u` / `Ctrl-d` | 半画面スクロール (上 / 下) |
| `Ctrl-b` / `Ctrl-f` | 1画面スクロール (上 / 下) |
| `zz` / `zt` / `zb` | カーソル行を画面中央 / 上 / 下に |
| `f{char}` / `F{char}` | 行内で文字を前方 / 後方検索 |
| `t{char}` / `T{char}` | 文字の手前 / 後方検索 |
| `;` / `,` | f/t 検索の次 / 前の一致 |

### Insert Mode

| Key | Action |
|-----|--------|
| `i` / `a` | カーソルの前 / 後にインサート |
| `I` / `A` | 行頭 / 行末にインサート |
| `o` / `O` | 下 / 上に新しい行を挿入 |
| `s` | 文字を削除してインサート |
| `S` | 行を削除してインサート |
| `C` | カーソルから行末まで削除してインサート |
| `gi` | 最後にインサートした位置に戻る |

### Edit (Normal Mode)

| Key | Action |
|-----|--------|
| `x` | カーソル下の文字を削除 |
| `dd` | 行を削除 (カット) |
| `D` | カーソルから行末まで削除 |
| `yy` | 行をヤンク (コピー) |
| `Y` | 行をヤンク |
| `p` / `P` | カーソルの後 / 前にペースト |
| `u` | アンドゥ |
| `Ctrl-r` | リドゥ |
| `.` | 直前の操作を繰り返す |
| `J` | 次の行を現在の行に結合 |
| `~` | 大文字/小文字を切り替え |
| `>>` / `<<` | インデント追加 / 削除 |
| `==` | 自動インデント |
| `gU{motion}` | 大文字に変換 |
| `gu{motion}` | 小文字に変換 |

### Operator + Motion / Text Object

| Key | Action |
|-----|--------|
| `d{motion}` | 削除 (例: `dw`, `d$`, `dip`) |
| `c{motion}` | 変更 (例: `cw`, `ci"`, `ct)`) |
| `y{motion}` | ヤンク (例: `yw`, `yi{`, `yap`) |
| `>{motion}` | インデント追加 |
| `<{motion}` | インデント削除 |

#### Text Objects

| Key | Object |
|-----|--------|
| `iw` / `aw` | 単語 (inner / a) |
| `iW` / `aW` | WORD |
| `is` / `as` | 文 |
| `ip` / `ap` | 段落 |
| `i"` / `a"` | ダブルクォート内 |
| `i'` / `a'` | シングルクォート内 |
| `i)` / `a)` | 括弧内 |
| `i]` / `a]` | 角括弧内 |
| `i}` / `a}` | 波括弧内 |
| `it` / `at` | タグ内 |

### Visual Mode

| Key | Action |
|-----|--------|
| `v` | 文字選択モード |
| `V` | 行選択モード |
| `Ctrl-v` | 矩形選択モード |
| `gv` | 前回の選択範囲を再選択 |
| `o` | 選択範囲の反対側端へ移動 |

### Search & Replace

| Key | Action |
|-----|--------|
| `/{pattern}` | 前方検索 |
| `?{pattern}` | 後方検索 |
| `n` / `N` | 次 / 前の検索結果 |
| `*` / `#` | カーソル下の単語を前方 / 後方検索 |
| `:%s/old/new/g` | ファイル全体で置換 |
| `:%s/old/new/gc` | 確認付き置換 |
| `:s/old/new/g` | 現在行で置換 |

### Window Management

| Key | Action |
|-----|--------|
| `Ctrl-w s` | 水平分割 |
| `Ctrl-w v` | 垂直分割 |
| `Ctrl-w h/j/k/l` | ウィンドウ間移動 |
| `Ctrl-w H/J/K/L` | ウィンドウ位置変更 |
| `Ctrl-w =` | ウィンドウサイズ均等化 |
| `Ctrl-w q` | ウィンドウを閉じる |
| `Ctrl-w o` | 他のウィンドウを全て閉じる |
| `Ctrl-w T` | ウィンドウを新しいタブに移動 |

### Command Line

| Key | Action |
|-----|--------|
| `:w` | 保存 |
| `:q` | 終了 |
| `:wq` / `ZZ` | 保存して終了 |
| `:q!` / `ZQ` | 保存せず終了 |
| `:e {file}` | ファイルを開く |
| `:bn` / `:bp` | 次 / 前のバッファ |
| `:bd` | バッファを閉じる |
| `:ls` | バッファ一覧 |
| `:reg` | レジスタ一覧 |

### Marks & Jumps

| Key | Action |
|-----|--------|
| `m{a-z}` | マークを設定 (ローカル) |
| `m{A-Z}` | マークを設定 (グローバル) |
| `` `{mark} `` | マーク位置へジャンプ |
| `'{mark}` | マーク行の先頭へジャンプ |
| `` `. `` | 最後に編集した位置へ |
| `''` | 直前のジャンプ元へ戻る |
| `Ctrl-o` / `Ctrl-i` | ジャンプリストを戻る / 進む |

### Macros

| Key | Action |
|-----|--------|
| `q{register}` | マクロ記録開始 |
| `q` | マクロ記録終了 |
| `@{register}` | マクロ再生 |
| `@@` | 直前のマクロを再生 |
| `{n}@{register}` | マクロを n 回再生 |

### Registers

| Key | Description |
|-----|-------------|
| `"` | 無名レジスタ (default) |
| `"0` | ヤンク専用レジスタ |
| `"1`~`"9` | 削除履歴レジスタ |
| `"+` | システムクリップボード |
| `"_` | ブラックホールレジスタ |
| `"/` | 最後の検索パターン |
| `".` | 最後にインサートしたテキスト |
| `":` | 最後に実行したコマンド |

### Folding

| Key | Action |
|-----|--------|
| `za` | 折りたたみの開閉 |
| `zo` / `zc` | 折りたたみを開く / 閉じる |
| `zR` / `zM` | 全ての折りたたみを開く / 閉じる |

---

## Plugin: vim-surround

| Key | Action |
|-----|--------|
| `ys{motion}{char}` | 囲みを追加 (例: `ysiw"`) |
| `cs{old}{new}` | 囲みを変更 (例: `cs"'`) |
| `ds{char}` | 囲みを削除 (例: `ds"`) |
| `S{char}` | Visual mode で選択範囲を囲む |

## Plugin: vim-commentary

| Key | Action |
|-----|--------|
| `gcc` | 行をコメントトグル |
| `gc{motion}` | 範囲をコメントトグル (例: `gcip`) |
| `gc` | Visual mode でコメントトグル |

## Installed Plugins Reference

| Plugin | Description |
|--------|-------------|
| sonokai | カラースキーム |
| NERDTree + vim-devicons | ファイルエクスプローラー |
| fzf + fzf.vim | ファジーファインダー |
| lightline + bufferline | ステータスライン / バッファタブ |
| vim-lsp + vim-lsp-settings | Language Server Protocol |
| asyncomplete | 自動補完 |
| vim-vsnip + friendly-snippets | スニペット |
| auto-pairs | 括弧自動補完 |
| vim-gitgutter | Git 差分表示 |
| vim-fugitive | Git 操作 |
| git-messenger | コミットメッセージ表示 |
| vim-commentary | コメントトグル |
| vim-surround | 囲み操作 |
| vim-repeat | `.` リピート強化 |
| indentLine | インデントガイド |
| winresizer | ウィンドウリサイズ |
| vim-which-key | キーマップガイド |
