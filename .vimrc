" Alex Ozer

set nocompatible
" Plug {{{ 
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-plug'
Plug 'altercation/vim-colors-solarized'
Plug 'whatyouhide/vim-gotham'
Plug 'reedes/vim-colors-pencil'
Plug 'vim-airline'
Plug 'fatih/vim-go'
Plug 'Valloric/YouCompleteMe'
Plug 'kien/ctrlp.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'		" dependency of vim-session
Plug 'bling/vim-bufferline'		" show buffer list in status bar
Plug 'moll/vim-bbye'				" when buffer closed, don't close window
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
"Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'marijnh/tern_for_vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'tpope/vim-fugitive'
Plug 'tikhomirov/vim-glsl'
Plug 'carlson-erik/wolfpack'

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

" gvim-specific options
if has('gui_running')
	autocmd GUIEnter * set vb t_vb= " turn off the ridiculous visual and audio bells
	set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
	set guioptions=cMg " console dialogs, do not show menu and toolbar
	set guiheadroom=0

	colorscheme solarized
else
	colorscheme default
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

nnoremap <silent> <leader>= :call NormalizeWidths()<cr>
" Netrw {{{
let g:netrw_list_hide='\(^\|\s\s\)\zs\.\S\+,^DS_Store$'
let g:netrw_hide=1              " hide hidden files
let g:netrw_dirhistmax=100      " keep more history
let g:netrw_altfile=1           " last edited file '#'
let g:netrw_liststyle=0         " thin
let g:netrw_altv=1              " open files on right
let g:netrw_preview=1           " open previews vertically
let g:netrw_use_errorwindow=0   " suppress error window

fun! VexToggle(dir)
  if exists("t:vex_buf_nr")
    call VexClose()
  else
    call VexOpen(a:dir)
  endif
endf

fun! VexOpen(dir)
  let g:netrw_browse_split=4    " open files in previous window
  let g:netrw_banner=0          " no banner
  let vex_width = 27

  exe "Vexplore " . a:dir
  let t:vex_buf_nr = bufnr("%")
  wincmd H

  call VexSize(vex_width)
endf

fun! VexClose()
  let cur_win_nr = winnr()
  let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr )

  1wincmd w
  close
  unlet t:vex_buf_nr

  exe (target_nr - 1) . "wincmd w"
  call NormalizeWidths()
endf

fun! VexSize(vex_width)
  exe "vertical resize" . a:vex_width
  set winfixwidth
  call NormalizeWidths()
endf

fun! NormalizeWidths()
  let eadir_pref = &eadirection
  set eadirection=hor
  set equalalways! equalalways!
  let &eadirection = eadir_pref
endf

noremap <silent> <leader><space> :call VexToggle(getcwd())<cr>
noremap <silent> <leader>` :call VexToggle("")<cr>
" }}}
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
nnoremap <silent> <tab> :bnext<cr>
nnoremap <silent> <S-tab> :bprev<cr>

" easier tab navigation
nnoremap <silent> <backspace> :tabnext<cr>
nnoremap <silent> <S-backspace> :tabprevious<cr>

set hidden		" okay to background modified buffers
" }}}
" Searching {{{
set incsearch			" search as characters are entered
set ignorecase			" case-insensitive
set smartcase			" override ignorecase if search includes capital letters

set gdefault			" when using :s command, replace all instances on line by default
" }}}
" Folding {{{
set foldenable			" enable folding
set foldlevelstart=99	" open all folds on start
set foldnestmax=1		" max nested folds
nnoremap <space> za		" space open/closes folds
set foldmethod=syntax	" fold based on syntax
" }}}
" Movement {{{ 
nnoremap Y y$	" make Y behave like D and C, instead of like yy

" easier than ^ and g_ and I never use the default behavior
nnoremap H ^
nnoremap L g_
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
if has('gui_running')
	let g:airline_theme="solarized"
else
	let g:airline_theme="dark"

	" reset status bar quickly
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		autocmd InsertEnter * set timeoutlen=0
		autocmd InsertLeave * set timeoutlen=1000
	augroup END
endif

set laststatus=2		" show airline even when only one window is open
set noshowmode			" hide the default mode text ( -- INSERT -- )
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#enabled=0

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
nnoremap <S-Space> :CtrlP<cr>
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
let g:bufferline_echo = 0			" don't print buffer command
let g:bufferline_show_bufnr = 0		" don't enumerate buffers

" vim-bbye
nnoremap <silent> <leader>q :Bdelete<cr>

" syntastic
let g:syntastic_go_checkers=["go"]

" vim-javascript-syntax
au FileType javascript call JavaScriptFold()

" }}}

" vim:foldlevelstart=0:foldmethod=marker:foldlevel=0
