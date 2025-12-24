"############################################################
" vim設定ファイル
"############################################################

"############################################################
" 環境設定
"############################################################
" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup

" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup

" 文字コード指定
set encoding=utf-8

" 開くファイルの文字コードをutf-8にする
set fileencodings=utf-8,cp932

" クリップボード
set clipboard+=unnamed

" ステータスライン
set laststatus=2

" 改行コードの自動認識
set fileformats=unix,dos,mac

" 行末まで移動可能
set virtualedit=onemore

" コマンドラインの補完
set wildmode=list:longest

" undo設定
if has('persistent_undo')
  let undo_path = expand('~/.vim/undo')
  exe 'set undodir=' .. undo_path
  set undofile
endif

"############################################################
" 検索設定
"############################################################
" 検索している文字列に色をつける
set hlsearch

" 入力するたびに検索
set incsearch

" 検索文字列が小文字の場合は大小区別なく検索
set ignorecase

" 検索文字列に大文字が含まれている場合は区別して検索
set smartcase

" 検索時最後まで行ったら最初に戻る
set wrapscan

" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"############################################################
" 表示設定
"############################################################
" vim カラーテーマ
" https://github.com/tomasr/molokai
colorscheme molokai
set t_Co=256

" 行番号を表示
set number

" ルーラー表示
set ruler

" タイトル表示
set title

" シンタックスハイライト
syntax on

" 入力中のコマンドを表示する
set showcmd

" カーソルのある行の色を変える
set cursorline

" 長い行は改行
set wrap

" 対応する括弧を表示
set showmatch

" TAB文字の可視化
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" ビープ音を可視化
set visualbell

"############################################################
" インデント
"############################################################
" tabの代わりにスペースになる
set expandtab

" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2

" softtab(スペース)の数
set softtabstop=2

" 行頭でのTab文字の表示幅
set shiftwidth=2

" 自動でインデント
set autoindent

"############################################################
" 操作系
"############################################################
"j + j でnormal modeに変更
imap jj <Esc>

"j + k でnormal modeに変更して:を押す
imap jk <Esc>: