" Alex Ozer

if !has('nvim')
	set nocompatible
endif

" Plug
if has('nvim')
	call plug#begin('~/.local/share/nvim/plugged')
else
	call plug#begin('~/.vim/plugged')
endif

" colors
Plug 'NLKNguyen/papercolor-theme'
Plug 'liuchengxu/space-vim-dark'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'yuttie/hydrangea-vim'
Plug 'liuchengxu/space-vim-dark'

" tools
Plug 'junegunn/vim-plug'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tomtom/tcomment_vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'metakirby5/codi.vim'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/goyo.vim'

" maybe wanted in the future
"Plug 'bling/vim-bufferline' " show buffer list in status bar
"Plug 'moll/vim-bbye' " when buffer closed, don't close window
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'Raimondi/delimitMate'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --clang-completer --gocode-completer' }
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"Plug 'rust-lang/rust.vim'
"Plug 'arakashic/chromatica.nvim' " didn't like colors, flickers
"Plug 'dkarter/bullets.vim'
"Plug 'vim-pandoc/vim-pandoc'
"Plug 'vim-pandoc/vim-pandoc-syntax'
"Plug 'scrooloose/syntastic', {'for': 'ocaml'}
"Plug 'neomake/neomake'
"if has('nvim')
"	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"	Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'}
"	Plug 'zchee/deoplete-jedi', {'for': 'python'}
"	Plug 'zchee/deoplete-clang', {'for': 'cpp'}
"endif
"Plug 'klen/python-mode', {'for': 'python'}
"Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"Plug 'airblade/vim-gitgutter'
"Plug 'xolox/vim-misc' | Pl?g 'xolox/vim-session'
"Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
" Plug 'vimwiki/vimwiki'

call plug#end()

" Leader
let mapleader=","
let maplocalleader="\\"

" Spaces
filetype plugin indent on

set tabstop=4			" number of visual spaces per TAB
set shiftwidth=4        " no seriously, four spaces per tab
set nojoinspaces

" UI
set termguicolors
set timeoutlen=1000
set ttimeoutlen=0

"set relativenumber		" show line numbers relative to current
set wildmenu			" visual autocomplete for command menu
set lazyredraw			" redraw only when we need to (not during macros)
set cursorline			" highlight current line
set mouse=a
set nofoldenable

set background=dark
colorscheme dracula
hi Comment cterm=italic

syntax enable			" enable syntax processing

" Use ; instead of : for Command-line-mode
noremap ; :
noremap : ;

set scrolloff=4			" leave lines visible at top and bottom of buffer

set noshowmatch			" don't show matching brackets by flickering

set guitablabel=%t

" splits: use g prefix instead of <C-w>
nnoremap gh <C-w>h
nnoremap gl <C-w>l
nnoremap gj <C-w>j
nnoremap gk <C-w>k

nnoremap gH <C-w>H
nnoremap gL <C-w>L
nnoremap gJ <C-w>J
nnoremap gK <C-w>K

" easier tab manipulation / navigation
nnoremap <silent> <leader><tab> :tabnew<cr>
nnoremap <silent> <leader><s-tab> :tabc<cr>
nnoremap <silent> <tab> :tabn<cr>
nnoremap <silent> <s-tab> :tabp<cr>

" easier to escape neovim terminal
if has('nvim')
	tnoremap <esc> <c-\><c-n>
endif

" Buffers, Splits, Tabs
set splitbelow " Open horizontal splits below current split
set splitright " Open vertical splits to the right of current split
set hidden		 " okay to background modified buffers

nnoremap <leader><leader> :e#<cr> " open last file

" Searching
set incsearch			" search as characters are entered
set ignorecase		" case-insensitive
set smartcase			" override ignorecase if search includes capital letters
set nohlsearch

set gdefault			" when using :s command, replace all instances on line by default

" Movement
" make Y behave like D and C, instead of like yy
nnoremap Y y$	

" easier than ^ and $ and I never use the default behavior.
" some plugins like to remap $ and 0 and I'd like to use their remappings,
" so I use ?map instead of ?noremap
map 0 ^
map H 0
map L $

set noswapfile
set undofile " Enable persistent undo
set undodir=~/.vim/tmp/undo//     " undo files

" Autocmd

" jump to last cursor position in file
function! SetCursorPosition()
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$") |
      execute 'normal! g`"zvzz' |
    endif
  end
endfunction

augroup restore_cursor
	autocmd!
	autocmd BufReadPost * call SetCursorPosition()
augroup END

augroup latex
	autocmd!
	autocmd FileType tex setlocal nocursorline
augroup END

augroup ocaml
	autocmd!
	autocmd FileType ocaml setlocal tabstop=2
	autocmd FileType ocaml setlocal shiftwidth=2
augroup END

augroup verilog
	autocmd!
	autocmd FileType verilog setlocal ft=systemverilog shiftwidth=2
augroup END

" Misc
" edit/source vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

set clipboard=unnamedplus

" Make word before cursor upper-case
inoremap <c-u> <esc>bgUwgi

" Control-Backspace deletes last work in insert mode
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Plugin Config

" nerdtree
nnoremap <leader>3 :NERDTreeToggle<cr>

" ctrlp
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif
let g:ctrlp_map = '<leader><space>'
let g:ctrlp_working_path_mode=''

" pencil
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,text,tex call pencil#init({'wrap': 'soft'})
augroup END

let g:pencil#autoformat = 1
let g:pencil#conceallevel = 0

" ale
let g:ale_lint_on_text_changed="never"

" lightline
let g:lightline = {
      \ 'colorscheme': 'Dracula',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ }
set noshowmode

" vim:tabstop=2
