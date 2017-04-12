call plug#begin('~/.local/share/nvim')
Plug 'Shougo/deoplete.nvim'
call plug#end()

set rtp+=$HOME/.opam/4.04.0/share/merlin/vim

let g:deoplete#enable_at_startup = 1
call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])
let g:deoplete#omni#input_patterns = {}
"let g:deoplete#omni#input_patterns.ocaml = '[.\w]+'
let g:deoplete#omni#input_patterns.ocaml = '.*'

" Uncomment below to test manual completion
let g:deoplete#disable_auto_complete = 1
imap <silent><expr><Tab> deoplete#mappings#manual_complete()
