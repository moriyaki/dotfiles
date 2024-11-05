set encoding=utf-8
scriptencodin utf-8
source $VIMRUNTIME/defaults.vim
filetype plugin on

try
  " setting
  call plug#begin('$HOME/.vim/plugged/')
  " colorscheme
  Plug 'sjl/badwolf'
  Plug 'tomasr/molokai'

  Plug 'kana/vim-submode' " Submode.vim
  Plug 'vim-jp/vimdoc-ja' " 日本語ドキュメント
  Plug 'bronson/vim-trailing-whitespace' "行末空行ハイライト
  Plug 'nathanaelkane/vim-indent-guides' " インデントハイライト
  Plug 'itchyny/lightline.vim' " ステータスライン
   Plug 'lambdalisue/fern.vim' "ファイラー/まだ待つ
  call plug#end()

  colorscheme molokai
catch
  PlugInstall
  colorscheme murphy
endtry
set background=dark

let g:badwolf_tabline = 3
let g:badwolf_darkgutter = 1

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'tagbar']

" lightline
let g:lightline = {
	\ 'active': {
	\   'left': [ [ 'mode', 'paste'], ['filename', 'readonly', 'modified'], ]
	\ }
	\ }

" End Auto PlugInstall
let g:ranger_map_keys = 0

if v:version >= 800
  set emoji "絵文字を全角
  set termguicolors " ターミナルでGUIカラーを使う
endif

set modifiable
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別
set fileformats=unix,dos,mac " 改行コードの自動判別
set formatoptions=q
set autochdir " カレントディレクトリに移動
set noswapfile " スワップファイルを作らない
set belloff=all "beep抑制
set wildmode=longest,list " 共通する最長の文字列を補完し、次から他の候補を羅列する
set wildmenu

set ttyfast " ターミナル接続を高速に
set title " ウィンドウタイトル設定
set number " 行番号表示
set cursorline " カーソル行ハイライト
set cursorcolumn " カーソル列ハイライト
set ambiwidth=double " Unicode行末対策
" set nowrap "テキストを折り返さない

set expandtab " タブの代わりに空白
set tabstop=2 " タブ文字の幅
set shiftwidth=2 " 自動インデントの幅
set softtabstop=2 " 連続した空白でタブやバックスペースの幅
set smartindent " スマートインデント
set autoindent " オートインデント
set smarttab " Tabでshiftwidthだけインデント
"set paste " ペースト時のインデント崩れを回避？

set ignorecase " 検索で大文字小文字を無視
set smartcase " (ignorecase時)小文字入力の時のみ大文字小文字を無視
set hlsearch " ハイライトサーチ
set incsearch " インクリメンタルサーチ
set nowrapscan " 末尾まできたら先頭からサーチ
set laststatus=2 " ステータスラインを常に表示
"set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" .vimrc書き換えたら自動読み込み
augroup myvimrc
  autocmd!
  autocmd BufWritePost *vimrc source $MYVIMRC | set foldmethod=marker
augroup END
" F6 で反映(緊急用)
nnoremap <F6> :<C-u>source $MYVIMRC<CR> :source $MYGVIMRC<CR>

nnoremap Y y$

" Spaceキーバインド---------------------
nnoremap <silent> <Space>v :tabnew $MYVIMRC<CR>
nnoremap <silent> <Space>o :tabnew<CR>
nnoremap <silent> <Space>n :tabnext<CR>
nnoremap <silent> <Space>p :tabprev<CR>
nnoremap <silent> <Space>x :tabclose!<CR>
nnoremap <silent> <Space>f :Fern . <CR>

" Terminalを space t で開く
if has("win32")
  nnoremap <silent> <Space>t :<C-u>term ++close ++rows=15 Ubuntu<CR>
else
  nnoremap <silent> <Space>t :<C-u>term ++close ++rows=15<CR>
endif

