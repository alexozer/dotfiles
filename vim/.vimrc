" Alex Ozer

set nocompatible

" Plug {{{ 
call plug#begin('~/.vim/plugged')

" colors
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'whatyouhide/vim-gotham'
Plug 'reedes/vim-colors-pencil'

Plug 'junegunn/vim-plug'
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
"Plug 'honza/vim-snippets'
Plug 'marijnh/tern_for_vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'tpope/vim-fugitive'
Plug 'tikhomirov/vim-glsl'
Plug 'carlson-erik/wolfpack'
Plug 'jdonaldson/vaxe'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
"Plug 'Raimondi/delimitMate'
Plug 'fatih/molokai'
Plug 'croaky/vim-colors-github'
Plug 'mattn/webapi-vim' " dependency of gist-vim
Plug 'mattn/gist-vim'
Plug 'tpope/vim-sleuth'
Plug 'sudar/vim-arduino-syntax'
Plug 'jscappini/material.vim'
Plug 'klen/python-mode'
Plug 'baskerville/vim-sxhkdrc'

call plug#end()
" }}}
" Leader {{{
let mapleader=","		" leader is comma
" }}}
" Spaces {{{
filetype plugin indent on

set tabstop=4			" number of visual spaces per TAB
set shiftwidth=4        " no seriously, four spaces per tab
" }}}
" UI {{{
set relativenumber		" show line numbers relative to current
set ruler " always show bottom bar
if has('gui_running')
	set cursorline			" highlight current line
endif
set wildmenu			" visual autocomplete for command menu
set lazyredraw			" redraw only when we need to (not during macros)

autocmd ColorScheme * 
			\ highlight VertSplit guibg=background |
			\ highlight SignColumn guibg=background

colorscheme PaperColor

" gvim-specific options
if has('gui_running')
	autocmd GUIEnter * set vb t_vb= " turn off the ridiculous visual and audio bells
	set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
	set guioptions=cMg " console dialogs, do not show menu and toolbar
	set guiheadroom=0
else
	set mouse=a
endif

set bg=dark
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

set guitablabel=%t
" }}}
" Buffers, Splits, Tabs {{{
"set splitbelow " Open horizontal splits below current split
"set splitright " Open vertical splits to the right of current split

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
nnoremap L $
vnoremap L $
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

autocmd FileType cpp,arduino setlocal makeprg=make\ -j5
autocmd Filetype cpp,arduino nnoremap <silent> <leader>b :wa<cr>:make!<cr>
autocmd Filetype cpp,arduino nnoremap <silent> <leader>r :wa<cr>:silent! make!<cr>:!./%:r<cr>
autocmd Filetype cpp,arduino nnoremap <silent> <leader>u :wa<cr>:!make upload<cr>
" }}}
" Misc {{{ 
" edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<cr>		" vim
nnoremap <leader>sv :source $MYVIMRC<cr>	" source vimrc

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

au FileType go nnoremap  <silent> <leader>r :wa<cr>:GoRename<cr>
au FileType go nnoremap  <silent> <leader>b :wa<cr>:GoBuild<cr>
au FileType go nnoremap  <silent> <leader>t :wa<cr>:GoTest<cr>

au FileType go nnoremap <Leader>d <Plug>(go-doc)

" Ctrl-P
" improve search performance
let g:ctrlp_use_caching = 0
set grepprg=ag\ --nogroup\ --nocolor
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" YouCompleteMe
set completeopt-=preview			" don't open a preview window
set shortmess+=c				" don't show completion status messages
let g:ycm_extra_conf_globlist = ['~/code/*'] " load project-specific .ycm_extra_conf.py without asking
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py" " settings for C/C++

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
nnoremap <silent> <leader>sS :SaveSession!<cr>
nnoremap <silent> <leader>sd :DeleteSession<cr>
nnoremap <silent> <leader>sD :DeleteSession!<cr>
nnoremap <silent> <leader>sr :RestartVim<cr>
nnoremap <silent> <leader>sR :RestartVim!<cr>

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
nnoremap <f4> :TagbarToggle<cr>
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
nnoremap <f3> :NERDTreeToggle<cr>
let NERDTreeHijackNetrw=1

" delimitMate
"let delimitMate_expand_cr=1
" }}}

" vim:foldlevelstart=0:foldmethod=marker:foldlevel=0
