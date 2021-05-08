" set encoding=utf-8
" scriptencoding utf-8
source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
" }}}

" usability {{{" set t_Co=256は256色対応のターミナルソフトでのみ作用するので、Winのコマンドプロンプト使っている人などは ダブルコーテーションでコメントアウトしといて
set t_Co=256
" 色づけを on にする
syntax on
" カラースキーマを設定する。jellybeansは最初はないカラースキーマだが、次回説明するプラグインにて説明する。
"colorscheme jellybeans
" 今のところ好きなカラースキーマを使っていて大丈夫。
" colorscheme desert
set bg=dark

" colorscheme gruvbox
" ターミナルの右端で文字を折り返さない
" set nowrap

" tempファイルを作らない。編集中に電源落ちまくるし、とかいう人はコメントアウトで
set noswapfile

" ハイライトサーチを有効にする。文字列検索は /word とか * ね
set hlsearch
" 大文字小文字を区別しない(検索時)
set ignorecase
" ただし大文字を含んでいた場合は大文字小文字を区別する(検索時)
set smartcase

" カーソル位置が右下に表示される
set ruler
" 行番号を付ける
set number
" タブ文字の表示 ^I で表示されるよ
set list
" コマンドライン補完が強力になる
set wildmenu
" コマンドを画面の最下部に表示する
set showcmd
" クリップボードを共有する(設定しないとvimとのコピペが面倒です)
set clipboard=unnamed

" 改行時にインデントを引き継いで改行する
set autoindent
" インデントにつかわれる空白の数
set shiftwidth=4
" <Tab>押下時の空白数
set softtabstop=4
" <Tab>押下時に<Tab>ではなく、ホワイトスペースを挿入する
set expandtab
" <Tab>が対応する空白の数
set tabstop=4
" 相対行表示
set relativenumber
" インクリメント、デクリメントを16進数にする(0x0とかにしなければ10進数です。007をインクリメントすると010になるのはデフォルト設定が8進数のため)
set nf=hex
" マウス使えます
" set mouse=a

" インサートモードの時に C-j でノーマルモードに戻る
imap <C-j> <esc>
" [ って打ったら [] って入力されてしかも括弧の中にいる(以下同様)
imap [ []<left>
imap ( ()<left>
imap { {}<left>

" ２回esc を押したら検索のハイライトをヤメる
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" }}}


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('$HOME/.cache/dein')

" Let dein manage dein
" Required:
call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" vimprocだけは最初にインストールしてほしい
" if dein#check_install(['vimproc'])
"   call dein#install(['vimproc'])
" endif:

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" ターミナルを開く
" a:1 new or vnew or tabnew(default is new)
" a:2 path (default is current)
" a:3 shell (default is &shell)
function! s:open_terminal(...) abort
    let open_type = 'new'
    let shell = &shell
    let path = getcwd()

    if a:0 > 0 && a:0 !=# ''
        let open_type = a:1
    endif
    if a:0 > 1 && a:2 !=# ''
        let path = a:2
    endif
    if a:0 > 2 && a:3 !=# ''
        let shell = a:3
    endif
    if open_type ==# 'new'
        let open_type = 'bo ' .. open_type
    endif
    exe printf('%s | lcd %s', open_type, path)
    exe printf('term ++curwin ++close %s', shell)
    exe 'call term_setrestore("%", printf("++close bash -c \"cd %s && bash\"", getcwd()))'
endfunction

command! -nargs=* OpenTerminal call s:open_terminal(<f-args>)

""  ターミナルを開く
noremap <silent> <C-s>\ :OpenTerminal vnew<CR>
noremap <silent> <C-s>- :OpenTerminal<CR>
noremap <silent> <C-s>^ :OpenTerminal tabnew<CR>
tnoremap <silent> <C-s>\ <C-w>:OpenTerminal vnew<CR>
tnoremap <silent> <C-s>- <C-w>:OpenTerminal<CR>
tnoremap <silent> <C-s>^ <C-w>:OpenTerminal tabnew<CR>


nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap ss :<C-u>sp<CR><C-w>j
noremap sv :<C-u>vs<CR><C-w>l


"" タブ
nnoremap [TABCMD]  <nop>
nmap     <leader>t [TABCMD]

nnoremap <silent> [TABCMD]f :<c-u>tabfirst<cr>
nnoremap <silent> [TABCMD]l :<c-u>tablast<cr>
nnoremap <silent> [TABCMD]n :<c-u>tabnext<cr>
nnoremap <silent> [TABCMD]N :<c-u>tabNext<cr>
nnoremap <silent> [TABCMD]p :<c-u>tabprevious<cr>
nnoremap <silent> [TABCMD]e :<c-u>tabedit<cr>
nnoremap <silent> [TABCMD]c :<c-u>tabclose<cr>
nnoremap <silent> [TABCMD]o :<c-u>tabonly<cr>
nnoremap <silent> [TABCMD]s :<c-u>tabs<cr>



