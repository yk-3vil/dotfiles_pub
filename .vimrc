"############################################################
" vim設定ファイル
"
" 初回起動時 :PlugInstall を実行し、自動ダウンロードされる
"############################################################

"############################################################
" vim-plug 自動インストール
"############################################################
let data_dir = '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo ' . data_dir . '/autoload/plug.vim --create-dirs'
    \ . ' https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"############################################################
" プラグイン
"############################################################
call plug#begin('~/.vim/plugged')

" カラースキーム
Plug 'sainnhe/sonokai'

" ファイルエクスプローラー
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

" ファジーファインダー
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ステータスライン + バッファライン
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" LSP + 補完
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'

" スニペット
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" 自動括弧閉じ
Plug 'jiangmiao/auto-pairs'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'rhysd/git-messenger.vim'

" コメントトグル
Plug 'tpope/vim-commentary'

" 囲み操作
Plug 'tpope/vim-surround'

" リピート強化
Plug 'tpope/vim-repeat'

" インデントガイド
Plug 'Yggdroot/indentLine'

" ウィンドウリサイズ
Plug 'simeji/winresizer'

" キーマップヘルパー
Plug 'liuchengxu/vim-which-key'

call plug#end()

"############################################################
" リーダーキー
"############################################################
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

"############################################################
" 環境設定
"############################################################
set nomodeline
set nowritebackup
set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf-8,cp932
set clipboard=unnamedplus
set laststatus=2
set fileformats=unix,dos,mac
set virtualedit=onemore
set wildmode=list:longest
set wildmenu
set hidden
set mouse=a
set updatetime=300
set shortmess+=c

" undo 永続化
if has('persistent_undo')
  let undo_path = expand('~/.vim/undo')
  if !isdirectory(undo_path)
    call mkdir(undo_path, 'p')
  endif
  execute 'set undodir=' . undo_path
  set undofile
endif

"############################################################
" 検索設定
"############################################################
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan

" ESC連打でハイライト解除
nnoremap <Esc><Esc> :nohlsearch<CR>

"############################################################
" 表示設定
"############################################################
if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

set number relativenumber
set ruler
set title
syntax on
set showcmd
set cursorline
set cursorcolumn
set wrap
set showmatch
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set numberwidth=4
set signcolumn=yes
set scrolloff=8

"############################################################
" カラースキーム
"############################################################
let g:sonokai_style = 'default'
let g:sonokai_enable_italic = 0
silent! colorscheme sonokai

"############################################################
" インデント
"############################################################
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent

"############################################################
" キーマッピング (基本)
"############################################################
" jj でノーマルモードに戻る
inoremap jj <Esc>
" jk でノーマルモードに戻り : を入力
inoremap jk <Esc>:

"############################################################
" ステータスライン (lightline)
"############################################################
set showtabline=2

let g:lightline = {
  \ 'colorscheme': 'sonokai',
  \ 'active': {
  \   'left': [['mode', 'paste'], ['gitbranch', 'readonly', 'filename', 'modified']],
  \   'right': [['lineinfo'], ['percent'], ['encoding', 'fileformat', 'filetype']],
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \ },
  \ 'tabline': {
  \   'left': [['buffers']],
  \   'right': [['close']],
  \ },
  \ 'component_expand': {
  \   'buffers': 'lightline#bufferline#buffers',
  \ },
  \ 'component_type': {
  \   'buffers': 'tabsel',
  \ },
  \ 'component': {
  \   'lineinfo': '%3l:%-2v',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '|', 'right': '|' },
  \ }

let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline.component_raw = {'buffers': 1}

" バッファ移動
nnoremap <silent> <A-,> :bprevious<CR>
nnoremap <silent> <A-.> :bnext<CR>
" バッファ番号指定移動
nmap <silent> <A-1> <Plug>lightline#bufferline#go(1)
nmap <silent> <A-2> <Plug>lightline#bufferline#go(2)
nmap <silent> <A-3> <Plug>lightline#bufferline#go(3)
nmap <silent> <A-4> <Plug>lightline#bufferline#go(4)
nmap <silent> <A-5> <Plug>lightline#bufferline#go(5)
nmap <silent> <A-6> <Plug>lightline#bufferline#go(6)
nmap <silent> <A-7> <Plug>lightline#bufferline#go(7)
nmap <silent> <A-8> <Plug>lightline#bufferline#go(8)
nmap <silent> <A-9> <Plug>lightline#bufferline#go(9)
" バッファ閉じる
nnoremap <silent> <A-c> :bdelete<CR>

"############################################################
" ファイルエクスプローラー (NERDTree)
"############################################################
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 30
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeIgnore = ['\.git$', '\.DS_Store$', '__pycache__$']

" 最後のバッファが閉じた場合にNERDTreeも閉じる
autocmd BufEnter * if winnr('$') == 1
  \ && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-S-e> :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>

"############################################################
" ファジーファインダー (fzf.vim)
"############################################################
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:fzf_preview_window = ['right,55%', 'ctrl-/']

nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>fg :Rg<CR>
nnoremap <silent> <Leader>fb :Buffers<CR>
nnoremap <silent> <Leader>fh :Helptags<CR>
nnoremap <silent> <Leader>fk :Maps<CR>
nnoremap <silent> <Leader>fo :History<CR>
nnoremap <silent> <Leader>f/ :BLines<CR>
nnoremap <silent> <Leader>fgs :GFiles?<CR>

"############################################################
" LSP (vim-lsp)
"############################################################
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_diagnostics_signs_enabled = 1
let g:lsp_diagnostics_signs_error = {'text': '●'}
let g:lsp_diagnostics_signs_warning = {'text': '●'}
let g:lsp_diagnostics_signs_information = {'text': '●'}
let g:lsp_diagnostics_signs_hint = {'text': '●'}
let g:lsp_diagnostics_virtual_text_enabled = 1
let g:lsp_diagnostics_virtual_text_prefix = ' ● '
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_fold_enabled = 0

function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete

  " ナビゲーション
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gD <plug>(lsp-declaration)
  nmap <buffer> <C-k> <plug>(lsp-signature-help)

  " アクション
  nmap <buffer> <Leader>fm <plug>(lsp-document-format)

  " 型定義
  nmap <buffer> gy <plug>(lsp-type-definition)

  " 診断
  nmap <buffer> <Leader>e <plug>(lsp-document-diagnostics)
  nmap <buffer> <Leader>q :lopen<CR>
  nmap <buffer> ]d <plug>(lsp-next-diagnostic)
  nmap <buffer> [d <plug>(lsp-previous-diagnostic)

  " リファレンス・リネーム
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> <Leader>rn <plug>(lsp-rename)
  nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
  autocmd!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"############################################################
" 自動補完 (asyncomplete)
"############################################################
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

" Tab / S-Tab で候補選択
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR>    pumvisible() ? asyncomplete#close_popup() : "\<CR>"
imap <C-Space> <Plug>(asyncomplete_force_refresh)

" 補完候補の preview ウィンドウを自動で閉じる
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"############################################################
" スニペット (vim-vsnip)
"############################################################
imap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
smap <expr> <C-j> vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'
imap <expr> <C-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-l>'
smap <expr> <C-l> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-l>'
imap <expr> <C-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-h>'
smap <expr> <C-h> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-h>'

"############################################################
" Git ガター表示 (vim-gitgutter)
"############################################################
let g:gitgutter_sign_added = '│'
let g:gitgutter_sign_modified = '│'
let g:gitgutter_sign_removed = '_'
let g:gitgutter_sign_removed_first_line = '‾'
let g:gitgutter_sign_modified_removed = '~'

" hunk ナビゲーション
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" hunk 操作
nmap <Leader>hs <Plug>(GitGutterStageHunk)
nmap <Leader>hr <Plug>(GitGutterUndoHunk)
nmap <Leader>hp <Plug>(GitGutterPreviewHunk)

"############################################################
" Git コミットメッセージ表示 (git-messenger.vim)
"############################################################
let g:git_messenger_always_into_popup = v:true
let g:git_messenger_include_diff = 'current'

nnoremap <silent> <Leader>gm :GitMessenger<CR>

"############################################################
" Git 操作 (vim-fugitive)
"############################################################
nnoremap <silent> <Leader>gb :Git blame<CR>
nnoremap <silent> <Leader>gd :Gdiffsplit<CR>
nnoremap <silent> <Leader>gh :0Gclog<CR>
nnoremap <silent> <Leader>gH :Gclog<CR>
nnoremap <silent> <Leader>gs :Git<CR>

"############################################################
" ウィンドウリサイズ (winresizer)
"############################################################
let g:winresizer_start_key = '<C-e>'

"############################################################
" インデントガイド (indentLine)
"############################################################
let g:indentLine_char = '│'
let g:indentLine_enabled = 1

"############################################################
" キーマップヘルパー (vim-which-key)
"############################################################
nnoremap <silent> <Leader> :WhichKey '<Space>'<CR>
vnoremap <silent> <Leader> :WhichKeyVisual '<Space>'<CR>

let g:which_key_map = {}
let g:which_key_map.f = { 'name': '+Find' }
let g:which_key_map.g = { 'name': '+Git' }
let g:which_key_map.h = { 'name': '+Hunk' }
let g:which_key_map.n = { 'name': '+NERDTree' }
let g:which_key_map.x = { 'name': '+Diagnostics' }

autocmd! User vim-which-key call which_key#register('<Space>', 'g:which_key_map')

"############################################################
" TODO ハイライト
"############################################################
augroup todo_highlight
  autocmd!
  autocmd Syntax * call matchadd('Todo', '\v\W\zs(TODO|FIXME|HACK|XXX|NOTE|BUG|WARN)')
augroup END

"############################################################
" 診断パネル (quickfix 活用)
"############################################################
nnoremap <silent> <Leader>xx :copen<CR>
nnoremap <silent> <Leader>xq :copen<CR>

"############################################################
" 自動コマンド
"############################################################
augroup custom_autocmds
  autocmd!
  set autoread
  autocmd FocusGained,BufEnter * checktime
augroup END

"############################################################
" ビープ音を無効化
"############################################################
set visualbell
set t_vb=
