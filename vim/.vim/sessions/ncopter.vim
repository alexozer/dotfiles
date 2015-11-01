" ~/.dotfiles/.vim/sessions/ncopter.vim:
" Vim session script.
" Created by session.vim 2.12 on 26 July 2015 at 16:54:55.
" Open this file in Vim and run :source % to restore your session.

set guioptions=cMg
silent! set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'light'
	set background=light
endif
if !exists('g:colors_name') || g:colors_name != 'solarized' | colorscheme solarized | endif
call setqflist([{'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '-------------------------'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': 'Arduino.mk Configuration:'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [AUTODETECTED]       CURRENT_OS = LINUX '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [USER]               ARDUINO_DIR = /home/alex/build/arduino-1.0.6 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [USER]               ARDMK_DIR = /home/alex/code/arduino/ncopter/Arduino-Makefile '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [AUTODETECTED]       ARDUINO_VERSION = 106 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [DEFAULT]            ARCHITECTURE =  '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [DEFAULT]            VENDOR = arduino '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [AUTODETECTED]       ARDUINO_PREFERENCES_PATH = /home/alex/.arduino/preferences.txt '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [AUTODETECTED]       ARDUINO_SKETCHBOOK = /home/alex/code/arduino (from arduino preferences file)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [USER]               AVR_TOOLS_DIR = /usr '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [COMPUTED]           ARDUINO_LIB_PATH = /home/alex/build/arduino-1.0.6/libraries (from ARDUINO_DIR)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [COMPUTED]           ARDUINO_VAR_PATH = /home/alex/build/arduino-1.0.6/hardware/arduino//variants (from ARDUINO_DIR)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [COMPUTED]           BOARDS_TXT = /home/alex/build/arduino-1.0.6/hardware/arduino//boards.txt (from ARDUINO_DIR)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [USER]               USER_LIB_PATH = /home/alex/code/arduino/ncopter/lib '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [DEFAULT]            PRE_BUILD_HOOK = pre-build-hook.sh '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [USER]               BOARD_TAG = nano328 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [COMPUTED]           CORE = arduino (from build.core)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [COMPUTED]           VARIANT = eightanaloginputs (from build.variant)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [USER]               OBJDIR = /home/alex/code/arduino/ncopter/bin/rpm/nano328 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [COMPUTED]           ARDUINO_CORE_PATH = /home/alex/build/arduino-1.0.6/hardware/arduino//cores/arduino (from ARDUINO_DIR, BOARD_TAG and boards.txt)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [USER]               MONITOR_BAUDRATE = 115200 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [DEFAULT]            OPTIMIZATION_LEVEL = s '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [DEFAULT]            MCU_FLAG_NAME = mmcu '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [USER]               CFLAGS_STD = -std=gnu11 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [USER]               CXXFLAGS_STD = -std=gnu++11 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [COMPUTED]           DEVICE_PATH = /dev/ttyUSB* (from MONITOR_PORT)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [DEFAULT]            FORCE_MONITOR_PORT =  '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [AUTODETECTED]       Size utility: AVR-aware for enhanced output'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '-'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '-                      SYSTEM_LIBS ='}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [SYSTEM]               Servo'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '-'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [COMPUTED]           BOOTLOADER_PARENT = /home/alex/build/arduino-1.0.6/hardware/arduino//bootloaders (from ARDUINO_DIR)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [COMPUTED]           ARDMK_VERSION = 1.5 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '- [COMPUTED]           CC_VERSION = 4.9.2 (avr-gcc)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '-------------------------'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': 'mkdir -p /home/alex/code/arduino/ncopter/bin/rpm/nano328'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '/usr/bin/avr-g++ -x c++ -include Arduino.h -MMD -c -mmcu=atmega328p -DF_CPU=16000000L -DARDUINO=106  -D__PROG_TYPES_COMPAT__ -I/home/alex/build/arduino-1.0.6/hardware/arduino//cores/arduino -I/home/alex/build/arduino-1.0.6/hardware/arduino//variants/eightanaloginputs    -I/home/alex/build/arduino-1.0.6/libraries/Servo   -Wall -ffunction-sections -fdata-sections -Os -pedantic -Wall -Wextra -fno-exceptions -std=gnu++11 rpm.ino -o /home/alex/code/arduino/ncopter/bin/rpm/nano328/rpm.ino.o'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '/usr/bin/avr-gcc -mmcu=atmega328p -Wl,--gc-sections -Os -o /home/alex/code/arduino/ncopter/bin/rpm/nano328/rpm.elf /home/alex/code/arduino/ncopter/bin/rpm/nano328/rpm.ino.o /home/alex/code/arduino/ncopter/bin/rpm/nano328/libcore.a  -lc -lm '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '/usr/bin/avr-objcopy -j .eeprom --set-section-flags=.eeprom=''alloc,load'' \'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '	--change-section-lma .eeprom=0 -O ihex /home/alex/code/arduino/ncopter/bin/rpm/nano328/rpm.elf /home/alex/code/arduino/ncopter/bin/rpm/nano328/rpm.eep'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '/usr/bin/avr-objcopy -O ihex -R .eeprom /home/alex/code/arduino/ncopter/bin/rpm/nano328/rpm.elf /home/alex/code/arduino/ncopter/bin/rpm/nano328/rpm.hex'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '/usr/bin/avr-objcopy: --change-section-lma .eeprom=0x0000000000000000 never used'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': ''}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '/usr/bin/avr-size --mcu=atmega328p -C --format=avr /home/alex/code/arduino/ncopter/bin/rpm/nano328/rpm.elf'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': 'AVR Memory Usage'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '----------------'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': 'Device: atmega328p'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': ''}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': 'Program:    3598 bytes (11.0% Full)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '(.text + .data + .bootloader)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': ''}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': 'Data:        242 bytes (11.8% Full)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': '(.data + .bss + .noinit)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': ''}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': '/home/alex/code/arduino/ncopter/test/motor/test.ino', 'text': ''}])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/code/arduino/ncopter/test/rpm
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +23 ~/code/arduino/ncopter/test/controller/test.ino
badd +163 ~/.vimrc
badd +23 ~/code/arduino/ncopter/test/receiver/test.ino
badd +28 ~/code/arduino/ncopter/src/controller/tests/joystick-test.ino
badd +1 ~/code/arduino/ncopter/src/controller/tests/receiver-test.ino
badd +19 ~/code/arduino/ncopter/lib/VirtualWire/examples/transmitter/transmitter.pde
badd +10 ~/code/arduino/ncopter/src/controller/transmitter.h
badd +38 ~/code/arduino/ncopter/src/controller/transmitter.cpp
badd +8 ~/code/arduino/ncopter/.ycm_extra_conf.py
badd +1 ~/code/arduino/ncopter/lib/VirtualWire/VirtualWire.h
badd +11 ~/code/arduino/ncopter/src/center/receiver.h
badd +50 ~/code/arduino/ncopter/src/center/receiver.cpp
badd +2 ~/code/arduino/ncopter/lib/VirtualWire/examples/receiver/receiver.pde
badd +32 ~/code/arduino/ncopter/src/controller/Makefile
badd +1 ~/code/arduino/Makefile-template
badd +61 ~/code/arduino/ncopter/src/center/Makefile
badd +10 ~/code/arduino/ncopter/src/center/main.cpp
badd +1 \'/home/alex/code/arduino/ncopter/src/controller/main.ino\'
badd +4 ~/code/arduino/ncopter/src/controller/main.ino
badd +1 \'/home/alex/code/arduino/ncopter/test/controller/test.ino\'
badd +5 ~/code/arduino/ncopter/test/center/test.ino
badd +3 ~/code/arduino/ncopter/test/motor/test.ino
badd +3 rpm.ino
argglobal
silent! argdel *
edit rpm.ino
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 207 + 119) / 239)
argglobal
enew
" file NERD_tree_1
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal nofen
wincmd w
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 30 - ((29 * winheight(0) + 32) / 65)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
30
normal! 020|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 207 + 119) / 239)
tabnext 1
if exists('s:wipebuf')
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

1wincmd w
tabnext 1
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
NERDTree ~/code/arduino/ncopter
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 65|vert 1resize 31|2resize 65|vert 2resize 207|
2wincmd w
tabnext 1
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
