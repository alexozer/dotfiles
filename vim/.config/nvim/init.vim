" Alex Ozer

if !has('nvim')
	set nocompatible
endif

" Plug {{{ 
call plug#begin('~/.vim/plugged')

" colors
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'

" languages
Plug 'fatih/vim-go'
Plug 'jelera/vim-javascript-syntax'
Plug 'marijnh/tern_for_vim'
Plug 'baskerville/vim-sxhkdrc'
Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown'
Plug 'klen/python-mode'
Plug 'sudar/vim-arduino-syntax'

" tools
Plug 'junegunn/vim-plug'
Plug 'Valloric/YouCompleteMe', { 'do': 'python2 install.py --clang-completer --gocode-completer' }
Plug 'xolox/vim-misc' | Plug 'xolox/vim-session'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'bling/vim-airline'
Plug 'mattn/webapi-vim' | Plug 'mattn/gist-vim'
Plug 'junegunn/fzf.vim' | Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" maybe wanted in the future
"Plug 'bling/vim-bufferline' " show buffer list in status bar
"Plug 'moll/vim-bbye' " when buffer closed, don't close window
"Plug 'SirVer/ultisnips'
"Plug 'honza/vim-snippets'
"Plug 'Raimondi/delimitMate'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'itchyny/lightline.vim'

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
if has('nvim')
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

set timeoutlen=1000
set ttimeoutlen=0

set relativenumber		" show line numbers relative to current
set ruler " always show bottom bar
set laststatus=2 " always show status bar
set wildmenu			" visual autocomplete for command menu
set lazyredraw			" redraw only when we need to (not during macros)
set cursorline			" highlight current line
set mouse=a

"autocmd ColorScheme * 
"\ highlight VertSplit guibg=background |
"\ highlight SignColumn guibg=background

colorscheme PaperColor

set bg=dark
call togglebg#map("<F5>")

syntax enable			" enable syntax processing

" Use ; instead of : for Command-line-mode
nnoremap ; :
vnoremap ; :
nnoremap : ;
vnoremap : ;

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

" split below and right
set splitbelow
set splitright

set hidden		" okay to background modified buffers
" }}}
" Searching {{{
set incsearch			" search as characters are entered
set ignorecase			" case-insensitive
set smartcase			" override ignorecase if search includes capital letters
set nohlsearch

set gdefault			" when using :s command, replace all instances on line by default
" }}}
" Folding {{{
set nofoldenable
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
nnoremap <leader>ev :e $MYVIMRC<cr>		" vim
nnoremap <leader>sv :source $MYVIMRC<cr>	" source vimrc

set clipboard=unnamedplus
" }}}
" Plugin Config {{{
" vim-go {{{
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
" }}}
" YouCompleteMe {{{
set completeopt-=preview			" don't open a preview window
set shortmess+=c				" don't show completion status messages
let g:ycm_extra_conf_globlist = ['~/code/*'] " load project-specific .ycm_extra_conf.py without asking
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py" " settings for C/C++
" }}}
" vim-session {{{
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
" }}}
" vim-javascript-syntax {{{
au FileType javascript call JavaScriptFold()
" }}}
" nerdtree {{{
nnoremap <f3> :NERDTreeToggle<cr>
" }}}
" airline {{{
" reset status bar quickly
if !has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		autocmd InsertEnter * set timeoutlen=0
		autocmd InsertLeave * set timeoutlen=1000
	augroup END
endif

set noshowmode			" hide the default mode text ( -- INSERT -- )
"let g:airline_left_sep=''
"let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled=0
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
" }}}
" syntastic {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" }}}
" }}}

" vim:foldenable:foldlevelstart=0:foldmethod=marker:foldlevel=0
