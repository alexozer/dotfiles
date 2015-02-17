" Alex Ozer

set nocompatible
" Plug {{{ 
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'altercation/vim-colors-solarized'
Plug 'whatyouhide/vim-gotham'
Plug 'reedes/vim-colors-pencil'
"Plug 'vim-airline'
Plug 'fatih/vim-go'
Plug 'Valloric/YouCompleteMe'
Plug 'kien/ctrlp.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'		" dependency of vim-session
"Plug 'bling/vim-bufferline'		" show buffer list in status bar
"Plug 'moll/vim-bbye'				" when buffer closed, don't close window
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'marijnh/tern_for_vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'tpope/vim-fugitive'
Plug 'tikhomirov/vim-glsl'
Plug 'carlson-erik/wolfpack'
Plug 'jdonaldson/vaxe'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'

call plug#end()
" }}}
" Leader {{{
let mapleader=","		" leader is comma

" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<cr>		" vim
nnoremap <leader>ez :vsp ~/.zshrc<cr>		" zsh
nnoremap <leader>sv :source $MYVIMRC<cr>	" source vimrc
" }}}
" Spaces {{{
filetype plugin indent on

set tabstop=4			" number of visual spaces per TAB
set shiftwidth=4        " no seriously, four spaces per tab
" }}}
" UI {{{
set relativenumber		" show line numbers relative to current
if has('gui_running')
	set cursorline			" highlight current line
endif
set wildmenu			" visual autocomplete for command menu
set lazyredraw			" redraw only when we need to (not during macros)

autocmd ColorScheme * 
			\ highlight VertSplit guibg=background |
			\ highlight SignColumn guibg=background

colorscheme solarized

" gvim-specific options
if has('gui_running')
	autocmd GUIEnter * set vb t_vb= " turn off the ridiculous visual and audio bells
	set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
	set guioptions=cMg " console dialogs, do not show menu and toolbar
	set guiheadroom=0

else
	colorscheme delek
	set mouse=a
endif
set bg=light

call togglebg#map("<F5>")

syntax enable			" enable syntax processing

" Use ; instead of : for Command-line-mode
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap ; :

set scrolloff=5			" leave lines visible at top and bottom of buffer

set noshowmatch			" don't show matching brackets by flickering

set fillchars=diff:⣿,vert:│

nnoremap <silent> <leader>= :call NormalizeWidths()<cr>
" }}}
" Buffers, Splits, Tabs {{{
" splits: use g prefix instead of <C-w>
nnoremap gh <C-w>h
nnoremap gl <C-w>l
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gH <C-w>H
nnoremap gL <C-w>L
nnoremap gJ <C-w>J
nnoremap gK <C-w>K

" easier buffer navigation
"nnoremap <silent> <tab> :bnext<cr>
"nnoremap <silent> <S-tab> :bprev<cr>

" easier tab navigation
"nnoremap <silent> <backspace> :tabnext<cr>
"nnoremap <silent> <S-backspace> :tabprevious<cr>

set hidden		" okay to background modified buffers
" }}}
" Searching {{{
set incsearch			" search as characters are entered
set ignorecase			" case-insensitive
set smartcase			" override ignorecase if search includes capital letters

set gdefault			" when using :s command, replace all instances on line by default
" }}}
" Folding {{{
nnoremap <space> za		" space open/closes folds
" }}}
" Movement {{{ 
nnoremap Y y$	" make Y behave like D and C, instead of like yy

" easier than ^ and g_ and I never use the default behavior
nnoremap H ^
vnoremap H ^
nnoremap L g_
vnoremap L g_
" }}}
" Backups {{{
set backup							" enable backup
set backupdir=~/.vim/tmp/backup// " backups

set undofile
set undodir=~/.vim/tmp/undo//     " undo files

set noswapfile				" disable swap files
" }}}
" Autocmd {{{ 
" jump to last position in file on open
autocmd BufReadPost *
			\ if line("'\"") > 1 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif

autocmd FileType php setlocal makeprg=zca\ %<.php
autocmd FileType php setlocal errorformat=%f(line\ %l):\ %m
" }}}
" Misc {{{ 
" this just seems to work best
set clipboard=unnamedplus
" }}}
" Plugin Config {{{
" Airline
"if has('gui_running')
	"let g:airline_theme="solarized"
"else
	"let g:airline_theme="dark"

	"" reset status bar quickly
	"set ttimeoutlen=10
	"augroup FastEscape
		"autocmd!
		"autocmd InsertEnter * set timeoutlen=0
		"autocmd InsertLeave * set timeoutlen=1000
	"augroup END
"endif

"set laststatus=2		" show airline even when only one window is open
"set noshowmode			" hide the default mode text ( -- INSERT -- )
"let g:airline_left_sep=''
"let g:airline_right_sep=''
"let g:airline#extensions#whitespace#enabled=0

" vim-go
let g:go_fmt_fail_silently = 1		" don't give an error if formatting fails
let g:go_highlight_functions = 1
let g:go_fmt_command = 'goimports'

au FileType go nnoremap gd <Plug>(go-def)
au FileType go nnoremap <Leader>s <Plug>(go-def-split)
au FileType go nnoremap <Leader>v <Plug>(go-def-vertical)
au FileType go nnoremap <Leader>T <Plug>(go-def-tab)

au FileType go nnoremap <Leader>i <Plug>(go-info)

au FileType go nnoremap  <silent> <leader>r :wa<cr>:GoRun %<cr>
au FileType go nnoremap  <silent> <leader>b :wa<cr>:GoBuild<cr>
au FileType go nnoremap  <silent> <leader>t :wa<cr>:GoTest<cr>

au FileType go nnoremap <Leader>d <Plug>(go-doc)

" YouCompleteMe
set completeopt-=preview			" don't open a preview window
set shortmess+=c					" don't show completion status messages

" ctrlp.vim
let g:ctrlp_map = '<s-space>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_follow_symlinks=1
let g:ctrlp_show_hidden=1

" vim-session
let g:session_autoload="no" 		" don't autoload a session when Vim starts
let g:session_autosave="yes"		" auto-save session when Vim is closed

nnoremap <silent> <leader>so :OpenSession<cr>
nnoremap <silent> <leader>sO :OpenSession!<cr>
nnoremap <silent> <leader>ss :SaveSession<cr>
nnoremap <silent> <leader>sd :DeleteSession<cr>

" vim-bufferline
"let g:bufferline_echo = 0			" don't print buffer command
"let g:bufferline_show_bufnr = 0		" don't enumerate buffers

" vim-bbye
"nnoremap <silent> <leader>q :Bdelete<cr>

" syntastic
let g:syntastic_go_checkers=["go"]

" vim-javascript-syntax
au FileType javascript call JavaScriptFold()

" tagbar
nnoremap <silent> <leader>t :TagbarToggle<cr>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" nerdtree
" See http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/ 
nnoremap <silent> <leader><space> :NERDTreeToggle<cr>
let NERDTreeHijackNetrw=1
" }}}

" vim:foldlevelstart=0:foldmethod=marker:foldlevel=0
