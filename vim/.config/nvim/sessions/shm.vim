" ~/.dotfiles/vim/.config/nvim/sessions/shm.vim:
" Vim session script.
" Created by session.vim 2.13.1 on 26 January 2016 at 01:00:25.
" Open this file in Vim and run :source % to restore your session.

let &makeprg = 'make'
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'PaperColor' | colorscheme PaperColor | endif
call setqflist([{'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'libshm/templates/dynamic.cpp', 'text': 'remote: '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'libshm/templates/dynamic.cpp', 'text': 'remote: Create pull request for serial:        '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'libshm/templates/dynamic.cpp', 'text': 'remote:   https://bitbucket.cuauv.org/projects/SOF/repos/software/compare/commits?sourceBranch=refs/heads/serial        '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'libshm/templates/dynamic.cpp', 'text': 'remote: '}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'libshm/templates/dynamic.cpp', 'text': 'To ssh://git@bitbucket.cuauv.org:7999/sof/software.git'}, {'lnum': 0, 'col': 0, 'valid': 1, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'libshm/templates/dynamic.cpp', 'text': '   c02415e..83c25f6  serial -> serial'}])
let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/code/auv
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +49 libshm/templates/dynamic.cpp
badd +136 libshm/templates/dynamic.h
badd +114 libshm/c/dynamic.cpp
badd +28 serial/seriald/main.cpp
badd +53 libshm/c/dynamic.h
argglobal
silent! argdel *
set stal=2
edit libshm/templates/dynamic.cpp
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd t
set winheight=1 winwidth=1
exe '1resize ' . ((&lines * 66 + 40) / 80)
exe 'vert 1resize ' . ((&columns * 119 + 137) / 274)
exe '2resize ' . ((&lines * 66 + 40) / 80)
exe 'vert 2resize ' . ((&columns * 119 + 137) / 274)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 15 - ((14 * winheight(0) + 33) / 66)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
15
normal! 0
wincmd w
argglobal
edit libshm/templates/dynamic.h
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 29 - ((28 * winheight(0) + 33) / 66)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
29
normal! 013|
wincmd w
exe '1resize ' . ((&lines * 66 + 40) / 80)
exe 'vert 1resize ' . ((&columns * 119 + 137) / 274)
exe '2resize ' . ((&lines * 66 + 40) / 80)
exe 'vert 2resize ' . ((&columns * 119 + 137) / 274)
tabedit libshm/c/dynamic.cpp
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
wincmd _ | wincmd |
split
1wincmd k
wincmd w
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 119 + 137) / 274)
exe '2resize ' . ((&lines * 32 + 40) / 80)
exe 'vert 2resize ' . ((&columns * 154 + 137) / 274)
exe '3resize ' . ((&lines * 44 + 40) / 80)
exe 'vert 3resize ' . ((&columns * 154 + 137) / 274)
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 24 - ((23 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
24
normal! 032|
wincmd w
argglobal
edit libshm/c/dynamic.h
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 13 - ((12 * winheight(0) + 16) / 32)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
13
normal! 0
wincmd w
argglobal
edit serial/seriald/main.cpp
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
silent! normal! zE
let s:l = 15 - ((14 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
15
normal! 0
wincmd w
3wincmd w
exe 'vert 1resize ' . ((&columns * 119 + 137) / 274)
exe '2resize ' . ((&lines * 32 + 40) / 80)
exe 'vert 2resize ' . ((&columns * 154 + 137) / 274)
exe '3resize ' . ((&lines * 44 + 40) / 80)
exe 'vert 3resize ' . ((&columns * 154 + 137) / 274)
tabnext 2
set stal=1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
"   silent exe 'bwipe ' . s:wipebuf
endif
" unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOc
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save

" Support for special windows like quick-fix and plug-in windows.
" Everything down here is generated by vim-session (not supported
" by :mksession out of the box).

3wincmd w
tabnext 2
if exists('s:wipebuf')
  if empty(bufname(s:wipebuf))
if !getbufvar(s:wipebuf, '&modified')
  let s:wipebuflines = getbufline(s:wipebuf, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:wipebuf
  endif
endif
  endif
endif
doautoall SessionLoadPost
unlet SessionLoad
" vim: ft=vim ro nowrap smc=128
