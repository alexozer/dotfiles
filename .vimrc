" Alex Ozer

" Spaces {{{
set tabstop=4			" number of visual spaces per TAB
set softtabstop=4		" number of spaces in tab when editing
set modelines=1			" enable modelines
" }}}
" UI {{{
set cursorline			" highlight current line
set wildmenu			" visual autocomplete for command menu
set lazyredraw			" redraw only when we need to (not during macros)

" gvim-specific options
if has('gui_running')
	set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 13
	set guioptions=cMg " console dialogs, do not show menu and toolbar
	set guiheadroom=0
endif

" Use ; instead of : for Command-line-mode
nnoremap ; :
nnoremap : ;

set scrolloff=5			" leave lines visible at top and bottom of buffer
" }}}
" {{{ Buffers, Splits, Tabs
" splits: use g prefix instead of <C-w>
nnoremap gh <C-w>h
nnoremap gl <C-w>l
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gH <C-w>H
nnoremap gL <C-w>L
nnoremap gJ <C-w>J
nnoremap gK <C-w>K

set hidden		" okay to background modified buffers
" }}}
" Searching {{{
set incsearch			" search as characters are entered
set ignorecase			" case-insensitive
set smartcase			" override ignorecase if search includes capital letters
" }}}
" Folding {{{
set foldenable			" enable folding
set foldnestmax=2		" max nested folds
nnoremap <space> za		" space open/closes folds
set foldmethod=syntax	" fold based on syntax
" }}}
" {{{ Movement
nnoremap Y y$	" make Y behave like D and C, instead of like yy
" }}}
" Leader {{{
let mapleader=","		" leader is comma

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>		" vim
nnoremap <leader>ez :vsp ~/.zshrc<CR>		" zsh
nnoremap <leader>sv :source $MYVIMRC<CR>	" source vimrc
" }}}
" Backups {{{
set backup							" enable backup
set backupdir=~/.vim/tmp/backup// " backups

set undofile
set undodir=~/.vim/tmp/undo//     " undo files

set noswapfile				" disable swap files
" }}}
" {{{ Autogroups
augroup configgroup
		autocmd!
		" jump to last position in file on open
		autocmd BufReadPost *
					\ if line("'\"") > 1 && line("'\"") <= line("$") |
					\   exe "normal! g`\"" |
					\ endif
augroup END

" }}}
" {{{ Misc
set clipboard=unnamedplus			" use system-wide clipboard
" }}}
" {{{ Plugins
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle' " let Vundle manage Vundle

" Colorscheme
Plugin 'reedes/vim-colors-pencil'
colorscheme pencil
set bg=light
syntax enable			" enable syntax processing

" Airline
Plugin 'vim-airline'
let g:airline_theme="pencil"

filetype plugin indent on		" load filetype-specific files
" }}}

" vim:foldmethod=marker:foldlevel=0
