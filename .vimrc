""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sections:                                                                  "
"   01. General ................. General Vim behavior                       "
"   02. Events .................. General autocmd events                     "
"   03. Theme/Colors ............ Colors, fonts, etc.                        "
"   04. Vim UI .................. User interface behavior                    "
"   05. Text Formatting/Layout .. Text, tab, indentation related             "
"   06. Behavior ................ Omni-complete, etc...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 01. General                                                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible         " get rid of Vi compatibility mode. SET FIRST!
execute pathogen#infect()                                     

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

set history=50		" keep 50 lines of command line history

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 02. Events                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" In Makefiles DO NOT use spaces instead of tabs
autocmd FileType make setlocal noexpandtab
" In Ruby files, use 2 spaces instead of 4 for tabs
autocmd FileType ruby setlocal sw=2 ts=2 sts=2
" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" Also don't do it when the mark is in the first line, that is the default
" position when opening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 03. Theme/Colors                                                           "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=16
syntax enable
" A dark bg actually means same as termcolors
set background=dark
colorscheme solarized
nnoremap <F5> :silent !solarize flip<CR>:redraw!<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 04. Vim UI                                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set relativenumber        " show relative line numbers
"set cul                   " highlight current line
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
"set showmatch
set showcmd               " display incomplete commands
set hidden				  " Okay to background buffers when modified

" In many terminal emulators the mouse works just fine, thus enable it.
"if has('mouse')
  "set mouse=a
"endif

" GVim-specific settings
set guioptions+=PegitrL
set guioptions-=mT
set guifont=GohuFont\ 10
set guiheadroom=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 05. Text Formatting/Layout                                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"filetype off
"filetype plugin indent off
"set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set smarttab              " use tabs at the start of a line, spaces elsewhere
"set nowrap                " don't wrap text
" Don't use Ex mode, use Q for formatting
map Q gq
" Make Y behave like D and C, instead of like yy
noremap Y y$

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 06. Behavior                                                                  " 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set ofu=syntaxcomplete#Complete
"let g:EclimCompletionMethod = 'omnifunc'

"" Supertab settings, supertab + eclim == java win
 " Choose the type of completion dynamically
let g:SuperTabDefaultCompletionType = "context"
 " Auto-select the longest completion
let g:SuperTabLongestHighlight = 1
 "Does as it says...
let g:SuperTabClosePreviewOnPopupClose = 1
let g:EasyMotion_leader_key = '<Space>'

let mapleader = ","
let maplocalleader = "\\"

nnoremap <silent> <leader>r :call system("urxvt&")<cr>
" ,i imports whatever is needed for current line
""nnoremap <silent> <leader>ji :JavaImport<cr>
" ,d opens javadoc for statement in browser
""nnoremap <silent> <leader>jd :JavaDocSearch -x declarations<cr>
" ,<enter> searches context for statement
""nnoremap <silent> <leader><cr> :JavaSearchContext<cr>
" ,jv validates current java file
""nnoremap <silent> <leader>jv :Validate<cr>
" ,jc shows corrections for the current line of java
""nnoremap <silent> <leader>jc :JavaCorrect<cr>
" ,jr runs the Java program
""nnoremap <silent> <leader>jr :Java<cr>

