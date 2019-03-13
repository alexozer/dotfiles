" Alex Ozer

"
" Plugins
"

" Plug
call plug#begin('~/.local/share/nvim/plugged')

" Colors
Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'yuttie/hydrangea-vim'
Plug 'liuchengxu/space-vim-dark'

" Tools
Plug 'junegunn/vim-plug'
Plug 'sheerun/vim-polyglot'
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
Plug 'tomtom/tcomment_vim'

" Maybe wanted in the future
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
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"  Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go'}
"  Plug 'zchee/deoplete-jedi', {'for': 'python'}
"  Plug 'zchee/deoplete-clang', {'for': 'cpp'}
"endif
"Plug 'klen/python-mode', {'for': 'python'}
"Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"Plug 'airblade/vim-gitgutter'
"Plug 'xolox/vim-misc' | Pl?g 'xolox/vim-session'
"Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
"Plug 'vimwiki/vimwiki'

call plug#end()

"
" Options
"

filetype plugin indent on

" Spaces
set tabstop=4            " Number of visual spaces per TAB
set softtabstop=4        " Number of spaces in tab when editing
set shiftwidth=4         " Number of spaces to use for autoindent
set expandtab            " Tabs are space
set autoindent
set copyindent           " Copy indent from the previous line

" UI
set termguicolors        " Enable true-color colorscheme support
set wildmenu             " Visual autocomplete for command menu
set cursorline	         " Highlight current line
set mouse=a              " Enable selecting with mouse
set splitbelow           " Open horizontal splits below current split
set splitright           " Open vertical splits to the right of current split
set hidden               " Okay to background modified buffers
set laststatus=2         " Window will always have a status line
set scrolloff=4	         " Leave lines visible at top and bottom of buffer
set noshowmode           " Annoying mode display, the cursor shows which mode we're in
set ttimeoutlen=0        " Respond to escape immediately

" Search and Substitute
set ignorecase           " Case-insensitive
set smartcase            " Override ignorecase if search includes capital letters
set nohlsearch           " Don't highlight search after search is completed
set gdefault             " When using :s command, replace all instances on line by default
set inccommand=nosplit   " Show substitutions as they are typed

" Clipboard
set clipboard=unnamedplus

" Swap/backup/undo
set noswapfile      " Disable concurrent editing warning, Vim warns when saving a modified file anyway
set undofile        " Enable persistent undo
let g:netrw_home='~/.local/share/nvim'  " Don't store history in vim config dir

" Load colorscheme
syntax on           " Enable syntax processing
set background=dark
colorscheme space-vim-dark
hi Comment guifg=#5C6370 ctermfg=59

"
" Mappings
"

" Loader
let mapleader = ","
let maplocalleader = "\\"

" Make Y behave like D and C, instead of like yy
nnoremap Y y$	

" Much better use of H and L
noremap H ^
noremap L $

" Allow using ; to access command mode in normal and visual mode
noremap ; :
noremap : ;

" Move by visual-line by default
noremap j gj
noremap k gk

" Splits: use g prefix instead of <C-w>
nnoremap gh <C-w>h
nnoremap gl <C-w>l
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gH <C-w>H
nnoremap gL <C-w>L
nnoremap gJ <C-w>J
nnoremap gK <C-w>K

" Easier tab manipulation / navigation
nnoremap <silent> <leader><tab> :tabnew<cr>
nnoremap <silent> <leader><s-tab> :tabc<cr>
nnoremap <silent> <tab> :tabn<cr>
nnoremap <silent> <s-tab> :tabp<cr>

nnoremap <leader><leader> :e#<cr> " Open last file

" Control-Backspace deletes last work in insert mode
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Edit/source vimrc
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Make word before cursor upper-case
inoremap <c-u> <esc>bgUwgi

"
" Autocmd
"

" Jump to last cursor position in file
function! SetCursorPosition()
  if &filetype !~ 'svn\|commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$") |
      execute 'normal! g`"zvzz' |
    endif
  end
endfunction

augroup group
  autocmd!
  autocmd BufReadPost * call SetCursorPosition()
  autocmd FileType tex setlocal nocursorline  " Slows down Vim a lot
  autocmd FileType ocaml setlocal tabstop=2 shiftwidth=2
augroup END

"
" Plugin Config
"

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
      \ 'colorscheme': 'one',
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ }

" tcomment

let g:tcomment_mapleader1=''
noremap <C-_> :TComment<cr>

" goyo

nnoremap <leader>g :Goyo<cr>

" vim:shiftwidth=2
