set shell=/bin/bash

set nocompatible              " be iMproved, required
set hidden
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

"core plugins
Bundle 'kien/ctrlp.vim'

"most used
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'ervandew/supertab'

"<leader><leader>w
Bundle 'sjl/gundo.vim'
Bundle 'bling/vim-airline'
Bundle 'vim-scripts/tComment'
Bundle 'tpope/vim-surround'
"Bundle 'msanders/snipmate.vim'
"^^ doesnt work at the same time as supertab.
Bundle 'tpope/vim-abolish'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/nerdcommenter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mjbrownie/pythoncomplete.vim'
Bundle 'ehamberg/vim-cute-python'
"rarely used


filetype plugin indent on     " required
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles

"Sets how many lines of history VIM has to remember
set history=700
set nocp

let mapleader = "'"
let g:mapleader = "'"

set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

" How many tenths of a second to blink when matching brackets
set mat=2

" shortcut to open new buffer/tab with .vimrc
map <leader>; :e ~/.vimrc<cr>
map <leader>: :newtab ~/.vimrc<cr>

"indent lines custom
let g:indent_guides_guide_size = 1

"disable arrow keys in insert mode
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" control-Q to quit
nnoremap Q <nop>
nnoremap <C-q> :q<cr>

" select pasted
nnoremap gp '[v']

" space, backsace, and enter enters insert mode
nnoremap <space> a
nnoremap <BS> i<BS>
nnoremap <CR> i<CR><Esc>

" no more s
" noremap s <nop>
" noremap c <nop>

" 'a' saves
nnoremap a :w!<cr>

" control-d enters normal mode
nnoremap <C-d> <Esc>
vnoremap <C-d> <Esc>gV
onoremap <C-d> <Esc>
inoremap <C-d> <Esc>`^

" 'w enters nerdtree
nnoremap <leader>w :NERDTree<CR>

" 'e enters gundo
nnoremap <leader>e :GundoToggle<CR>

" 'r enters Tlist
nnoremap <leader>r :TlistToggle<CR>

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" redraw window so that search terms are centered
nnoremap n nzz
nnoremap N Nzz

set lines=45 " Show 45 lines instead of default 24
set columns=90 " Show 90 columns

"Always show current position
set ruler

" Makes search act like search in modern browsers
set incsearch

"Ignore case when searching
set ignorecase

" When searchin try to be smart about cases 
set smartcase

 " Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"Rainbow parenthesis toggle
nnoremap <leader>( :RainbowParenthesesToggle<cr>
nnoremap <leader>{ :RainbowParenthesesLoadBraces<cr>
nnoremap <leader>[ :RainbowParenthesesLoadSquare<cr>
nnoremap <leader>< :RainbowParenthesesLoadChevrons<cr>


" Enable syntax highlighting
syntax enable

colorscheme desert
set background=dark

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" tab works
nnoremap <tab> i<tab>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>d :tabn<cr>
map <leader>s :tabp<cr>
map <leader>f :tablast<cr>
map <leader>a :tabfirst<cr>

"list buffers
map <leader>l :ls<cr>

" this turns buffers into tabs
map <leader>tb :tab ball<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>t :tabedit <c-r>=expand("%:p:h")<cr>/

" rotate buffers
map <leader>b :bn<cr>

" new buffer with file
map <leader>n :e <c-r>=expand("%:p:h")<cr>/

" close buffer
map <leader>c :bd<cr>

"switch split screen focus
map <leader>z <c-w><c-w>

"close screen section
map <leader>x <c-w><c-q>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" Remap VIM 0 to first non-blank character
map 0 ^
map 9 $
" Delete trailing white space on save, useful for Python and CoffeeScript ;)
   func! DeleteTrailingWS()
       exe "normal mz"
       %s/\s\+$//ge
       exe "normal `z"
       endfunc
       autocmd BufWrite *.py :call DeleteTrailingWS()
       autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Always show the status line
set laststatus=2

" Returns true if paste mode is enabled
 function! HasPaste()
     if &paste
             return 'PASTE MODE  '
                 en
                     return ''
                     endfunction
                     
" Format the status line
 set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


