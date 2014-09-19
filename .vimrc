" Alex Ozer

" Colors {{{
syntax enable			" enable syntax processing
colorscheme pencil
set bg=light
" }}}
" Spaces {{{
set tabstop=4			" number of visual spaces per TAB
set softtabstop=4		" number of spaces in tab when editing
set modelines=1			" enable modelines
" }}}
" UI {{{
set cursorline			" highlight current line
filetype indent on		" load filetype-specific indent files
set wildmenu			" visual autocomplete for command menu
set lazyredraw			" redraw only when we need to (not during macros)
" }}}
" Searching {{{
set incsearch			" search as characters are entered
" }}}
" Folding {{{
set foldenable			" enable folding
set foldnestmax=2		" max nested folds
nnoremap <space> za		" space open/closes folds
set foldmethod=syntax	" fold based on syntax
" }}}
" Leader {{{
let mapleader=","		" leader is comma

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>		" vim
nnoremap <leader>ez :vsp ~/.zshrc<CR>		" zsh
nnoremap <leader>sv :source $MYVIMRC<CR>	" source vimrc
" }}}
" Backups {{{
set backup				" enable backup
set backupdir=~/.vim/tmp/backup// " backups

set undofile
set undodir=~/.vim/tmp/undo//     " undo files

set noswapfile				" disable swap files
" }}}

" vim:foldmethod=marker:foldlevel=0
