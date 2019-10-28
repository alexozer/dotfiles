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
Plug 'liuchengxu/space-vim-dark' " Older theme
Plug 'liuchengxu/space-vim-theme' " Newer theme
Plug 'reedes/vim-colors-pencil'

" Tools
Plug 'junegunn/vim-plug'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'metakirby5/codi.vim'
Plug 'reedes/vim-pencil'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/goyo.vim'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf.vim'
Plug 'alok/notational-fzf-vim'
Plug 'vim-scripts/vim-auto-save'
Plug 'AndrewRadev/sideways.vim'
Plug 'godlygeek/tabular' " Automatic table formatting for vim-markdown
Plug 'gabrielelana/vim-markdown'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'

" Maybe wanted in the future
"Plug 'tpope/vim-fugitive'
"Plug 'gabrielelana/vim-markdown'
"Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
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
set number

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
colorscheme space_vim_theme
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
" nnoremap <silent> <leader><tab> :tabnew<cr>
" nnoremap <silent> <leader><s-tab> :tabc<cr>
" nnoremap <silent> <tab> :tabn<cr>
" nnoremap <silent> <s-tab> :tabp<cr>

nnoremap <silent> <leader><leader> :e#<cr> " Open last file

" Control-Backspace deletes last work in insert mode
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" Vimrc-related bindings
nnoremap <silent> <leader>ve :e $MYVIMRC<cr>
nnoremap <silent> <leader>vs :source $MYVIMRC<cr>
nnoremap <silent> <leader>vi :PlugInstall<cr>

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
  autocmd FileType gitcommit let g:auto_save = 0
  autocmd VimResized * wincmd = " Balance windows when Vim resized
augroup END

"
" Plugin Config
"

" nerdtree
nnoremap <silent> <leader>3 :NERDTreeToggle<cr>

" fzf.vim

" List files fast, and ignore stuff in .gitignore if in git repo
let $FZF_DEFAULT_COMMAND = 'rg --files'

nnoremap <silent> <leader><space> :Files<cr>
nnoremap <silent> <leader>s :Files ~/doc/Dropbox/notes<cr>
nnoremap <silent> <leader>b :Buffers<cr>

" Enter notes directory so I can create, rename, move files
nnoremap <silent> <leader>d :cd ~/doc/Dropbox/notes<cr>

" notational-fzf-vim
let g:nv_search_paths = ['~/doc/Dropbox/notes']
nnoremap <silent> <leader>r :NV<cr>

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
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ }

" tcomment
let g:tcomment_mapleader1=''
noremap <silent> <C-_> :TComment<cr>

" goyo
nnoremap <silent> <leader>g :Goyo<cr>

" vim-auto-save
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode
" set updatetime=1000

" sideways.vim
nnoremap <silent> <c-h> :SidewaysLeft<cr>
nnoremap <silent> <c-l> :SidewaysRight<cr>

" vim-markdown
let g:markdown_enable_spell_checking = 0

" coc.nvim

" if hidden is not set, TextEdit might fail.
" set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
" set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ale
highlight clear ALEErrorSign
highlight clear ALEWarningSign
let g:ale_set_highlights = 0
