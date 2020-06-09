# Environment variables that I want to set outside zsh as well, and which I
# only want to execute on login.  See ~/.zshenv for environment variable setup
# that runs each shell invocation.

# fzf configuration
# Base16 Dracula
# Author: Mike Barkmin (http://github.com/mikebarkmin) based on Dracula Theme (http://github.com/dracula)
_gen_fzf_default_opts() {

local color00='#282936'
local color01='#3a3c4e'
local color02='#4d4f68'
local color03='#626483'
local color04='#62d6e8'
local color05='#e9e9f4'
local color06='#f1f2f8'
local color07='#f7f7fb'
local color08='#ea51b2'
local color09='#b45bcf'
local color0A='#00f769'
local color0B='#ebff87'
local color0C='#a1efe4'
local color0D='#62d6e8'
local color0E='#b45bcf'
local color0F='#00f769'

export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color05,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts

# Keyring
if [ -n "$DESKTOP_SESSION" ];then
    export $(gnome-keyring-daemon -s)
    export SSH_AUTH_SOCK
fi

if [[ ! $DISPLAY ]]; then
  if [[ $XDG_VTNR -eq 1 || $XDG_VTNR -eq 2 ]]; then
    exec startx
  fi
fi
