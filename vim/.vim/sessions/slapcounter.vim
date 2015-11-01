" ~/.dotfiles/.vim/sessions/slapcounter.vim:
" Vim session script.
" Created by session.vim 2.13 on 20 September 2015 at 18:16:25.
" Open this file in Vim and run :source % to restore your session.

set guioptions=cMg
silent! set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 11
if exists('g:syntax_on') != 1 | syntax on | endif
if exists('g:did_load_filetypes') != 1 | filetype on | endif
if exists('g:did_load_ftplugin') != 1 | filetype plugin on | endif
if exists('g:did_indent_on') != 1 | filetype indent on | endif
if &background != 'dark'
	set background=dark
endif
if !exists('g:colors_name') || g:colors_name != 'solarized' | colorscheme solarized | endif
call setqflist([{'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '-------------------------'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': 'Arduino.mk Configuration:'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [AUTODETECTED]       CURRENT_OS = LINUX '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               ARDUINO_DIR = /home/alex/build/arduino-1.0.6 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               ARDMK_DIR = /home/alex/code/arduino/slapcounter/Arduino-Makefile '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [AUTODETECTED]       ARDUINO_VERSION = 106 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               ARCHITECTURE = arm '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               VENDOR = teensy '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [AUTODETECTED]       ARDUINO_PREFERENCES_PATH = /home/alex/.arduino/preferences.txt '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [AUTODETECTED]       ARDUINO_SKETCHBOOK = /home/alex/code/arduino (from arduino preferences file)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               AVR_TOOLS_DIR = /home/alex/build/arduino-1.0.6/hardware/tools/arm '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [COMPUTED]           ARDUINO_LIB_PATH = /home/alex/build/arduino-1.0.6/libraries (from ARDUINO_DIR)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [COMPUTED]           ARDUINO_VAR_PATH = /home/alex/build/arduino-1.0.6/hardware/teensy/arm/variants (from ARDUINO_DIR)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               BOARDS_TXT = /home/alex/build/arduino-1.0.6/hardware/teensy/boards.txt '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               USER_LIB_PATH = /home/alex/code/arduino/slapcounter/lib '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [DEFAULT]            PRE_BUILD_HOOK = pre-build-hook.sh '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               BOARD_TAG = teensy31 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [COMPUTED]           CORE = teensy3 (from build.core)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [COMPUTED]           VARIANT =  (from build.variant)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               OBJDIR = /home/alex/code/arduino/slapcounter/bin/src/teensy31 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               ARDUINO_CORE_PATH = /home/alex/build/arduino-1.0.6/hardware/teensy/cores/teensy3 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '-                      No .pde or .ino files found. If you are compiling .c or .cpp files then you need to explicitly include Arduino header files'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               MONITOR_BAUDRATE = 115200 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [DEFAULT]            OPTIMIZATION_LEVEL = s '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               MCU_FLAG_NAME = mcpu '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               CFLAGS_STD = -std=gnu11 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [USER]               CXXFLAGS_STD = -std=gnu++11 -std=gnu++0x '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [COMPUTED]           DEVICE_PATH = /dev/ttyACM0 (from MONITOR_PORT)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [DEFAULT]            FORCE_MONITOR_PORT =  '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [AUTODETECTED]       Size utility: Basic (not AVR-aware)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '-'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '-                      SYSTEM_LIBS ='}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [SYSTEM]               EEPROM'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '-'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [COMPUTED]           BOOTLOADER_PARENT = /home/alex/build/arduino-1.0.6/hardware/teensy/arm/bootloaders (from ARDUINO_DIR)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [COMPUTED]           ARDMK_VERSION = 1.5 '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '- [COMPUTED]           CC_VERSION = 4.8.4 (arm-none-eabi-gcc)'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '-------------------------'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': 'mkdir -p /home/alex/code/arduino/slapcounter/bin/src/teensy31'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '/home/alex/build/arduino-1.0.6/hardware/tools/arm/bin/arm-none-eabi-g++ -MMD -c -DLAYOUT_US_ENGLISH -DUSB_SERIAL -mthumb -nostdlib -D__MK20DX256__ -DTEENSYDUINO=124 -mcpu=cortex-m4 -DF_CPU=96000000 -DARDUINO=106 -DARDUINO_ARCH_ARM -D__PROG_TYPES_COMPAT__ -I/home/alex/build/arduino-1.0.6/hardware/teensy/cores/teensy3 -I/home/alex/build/arduino-1.0.6/hardware/teensy/arm/variants/    -I/home/alex/build/arduino-1.0.6/libraries/EEPROM    -I/home/alex/code/arduino/slapcounter/lib/SmartMatrix   -I/home/alex/code/arduino/slapcounter/lib/Bounce2 -Wall -ffunction-sections -fdata-sections -Os -pedantic -Wall -Wextra -fno-rtti -felide-constructors -fno-exceptions -std=gnu++11 -std=gnu++0x mand.cpp -o /home/alex/code/arduino/slapcounter/bin/src/teensy31/mand.cpp.o'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '/home/alex/build/arduino-1.0.6/hardware/tools/arm/bin/arm-none-eabi-gcc -mthumb --specs=nano.specs -larm_cortexM4l_math -T/home/alex/build/arduino-1.0.6/hardware/teensy/cores/teensy3/mk20dx256.ld -mcpu=cortex-m4 -Wl,--gc-sections -Os -o /home/alex/code/arduino/slapcounter/bin/src/teensy31/src.elf /home/alex/code/arduino/slapcounter/bin/src/teensy31/buttons.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy31/slapcounter.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy31/matrix.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy31/storage.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy31/cuauv.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy31/battery.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy31/session.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy31/scheduler.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy31/mand.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy31/bluetooth.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy3'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '1/main.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy31/test.cpp.o /home/alex/code/arduino/slapcounter/bin/src/teensy31/libcore.a  -lc -lm '}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '/home/alex/build/arduino-1.0.6/hardware/tools/arm/bin/arm-none-eabi-objcopy -j .eeprom --set-section-flags=.eeprom=''alloc,load'' \'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '	--change-section-lma .eeprom=0 -O ihex /home/alex/code/arduino/slapcounter/bin/src/teensy31/src.elf /home/alex/code/arduino/slapcounter/bin/src/teensy31/src.eep'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '/home/alex/build/arduino-1.0.6/hardware/tools/arm/bin/arm-none-eabi-objcopy: --change-section-lma .eeprom=0x0000000000000000 never used'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '/home/alex/build/arduino-1.0.6/hardware/tools/arm/bin/arm-none-eabi-objcopy -O ihex -R .eeprom /home/alex/code/arduino/slapcounter/bin/src/teensy31/src.elf /home/alex/code/arduino/slapcounter/bin/src/teensy31/src.hex'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': ''}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '/home/alex/build/arduino-1.0.6/hardware/tools/arm/bin/arm-none-eabi-size /home/alex/code/arduino/slapcounter/bin/src/teensy31/src.hex'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '   text	   data	    bss	    dec	    hex	filename'}, {'lnum': 0, 'col': 0, 'valid': 0, 'vcol': 0, 'nr': -1, 'type': '', 'pattern': '', 'filename': 'main.cpp', 'text': '      0	  25800	      0	  25800	   64c8	/home/alex/code/arduino/slapcounter/bin/src/teensy31/src.hex'}])
let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/code/arduino/slapcounter/src
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +778 ~/code/arduino/slapcounter/lib/SmartMatrix/MatrixGraphics.cpp
badd +39 ~/code/arduino/slapcounter/lib/SmartMatrix/SmartMatrix.cpp
badd +46 ~/code/arduino/slapcounter/lib/SmartMatrix/MatrixFont.cpp
badd +296 ~/.vimrc
badd +6 ~/code/arduino/slapcounter/Makefile-Linux.mk
badd +3 ~/blinky.cpp
badd +6 ~/code/arduino/slapcounter/.ycm_extra_conf.py
badd +153 ~/code/arduino/slapcounter/lib/SmartMatrix/SmartMatrix.h
badd +1 \'/home/alex/code/arduino/slapcounter/pins.txt\'
badd +1 ~/code/arduino/slapcounter/pins.txt
badd +122 ~/code/arduino/slapcounter/lib/SmartMatrix/examples/FeatureDemo/FeatureDemo.ino
badd +1 ~/code/arduino/slapcounter/test/README.md
badd +1 \'/home/alex/code/arduino/slapcounter/test/main.cpp\'
badd +6 Makefile
badd +1 display.h
badd +10 component.h
badd +1 drawing.h
badd +1 ~/code/arduino/slapcounter/test/main.cpp
badd +11 ~/code/arduino/slapcounter/test/mand.cpp
badd +41 scheduler.h
badd +43 scheduler.cpp
badd +1 display.cpp
badd +8 slapcounter.cpp
badd +1 slapcounter.h
badd +17 task.cpp
badd +1539 ~/code/arduino/slapcounter/lib/SmartMatrix/Font_apple4x6_256.c
badd +44 bmfont2c.py
badd +9 ~/code/arduino/slapcounter/.gitignore
badd +1 task.h
badd +5 ~/code/arduino/slapcounter/Makefile-OSX.mk
badd +60 ~/code/arduino/slapcounter/README.md
badd +1 ~/code/arduino/slapcounter/.git/refs/heads/master
badd +1 ~/code/arduino/slapcounter/.editorconfig
badd +16 bluetooth.h
badd +22 battery.h
badd +46 battery.cpp
badd +7 bluetooth.cpp
badd +12 color.h
badd +72 ~/code/arduino/libraries/SmartMatrix/SmartMatrix.h
badd +23 session.cpp
badd +19 session.h
badd +5 storage.h
badd +32 storage.cpp
badd +6 ~/code/arduino/slapcounter/.gitmodules
badd +1 ~/code/arduino/slapcounter/lib/SmartMatrix/Font_apple5x7_256.c
badd +280 ~/code/arduino/slapcounter/lib/SmartMatrix/MatrixFontCommon.h
badd +9 ~/code/arduino/slapcounter/test/stuff/main.cpp
badd +1 ~/code/arduino/slapcounter/test/matrix/main.ino
badd +1 ~/code/arduino/slapcounter/test/pins/main.ino
badd +1 \'/home/alex/code/arduino/slapcounter/test/buttons/buttons.cpp\'
badd +8 ~/code/arduino/slapcounter/test/buttons/buttons.cpp
badd +1 \'/home/alex/code/arduino/slapcounter/src/main.cpp\'
badd +15 main.cpp
badd +4 test.h
badd +116 test.cpp
badd +21 ~/code/arduino/slapcounter/lib/Bounce2/Bounce2.h
badd +4 ~/code/arduino/slapcounter/lib/Test/Test.h
badd +1 \'/home/alex/code/arduino/slapcounter/src/buttons.cpp\'
badd +3 buttons.cpp
badd +1 buttons.h
badd +11 matrix.h
badd +2 matrix.cpp
badd +1 ~/code/arduino/slapcounter/lib/SmartMatrix
badd +15 cuauv.h
badd +81 cuauv.cpp
badd +11 mand.h
badd +19 mand.cpp
argglobal
silent! argdel *
set stal=2
edit test.cpp
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
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
let s:l = 8 - ((7 * winheight(0) + 32) / 65)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
8
normal! 0
tabedit mand.cpp
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
wincmd w
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
exe 'vert 1resize ' . ((&columns * 31 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 103 + 119) / 239)
exe 'vert 3resize ' . ((&columns * 103 + 119) / 239)
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
let s:l = 59 - ((34 * winheight(0) + 32) / 64)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
59
normal! 017|
wincmd w
argglobal
edit mand.h
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 27 - ((26 * winheight(0) + 32) / 64)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
27
normal! 018|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 31 + 119) / 239)
exe 'vert 2resize ' . ((&columns * 103 + 119) / 239)
exe 'vert 3resize ' . ((&columns * 103 + 119) / 239)
tabnext 2
set stal=1
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
tabnext 2
let s:bufnr_save = bufnr("%")
let s:cwd_save = getcwd()
NERDTree ~/code/arduino/slapcounter/src
if !getbufvar(s:bufnr_save, '&modified')
  let s:wipebuflines = getbufline(s:bufnr_save, 1, '$')
  if len(s:wipebuflines) <= 1 && empty(get(s:wipebuflines, 0, ''))
    silent execute 'bwipeout' s:bufnr_save
  endif
endif
execute "cd" fnameescape(s:cwd_save)
1resize 64|vert 1resize 31|2resize 64|vert 2resize 103|3resize 64|vert 3resize 103|
2wincmd w
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
