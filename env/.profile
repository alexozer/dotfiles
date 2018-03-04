# environment variables

export GOPATH1="$HOME/build/go"
export GOPATH2="$HOME/code/go"
export GOPATH="$GOPATH1:$GOPATH2"
export NPM_PACKAGES="$HOME/.npm-packages"

export PATH="$PATH:\
$HOME/bin:\
$GOPATH1/bin:\
$GOPATH2/bin:\
$HOME/code/auv/link-stage:\
$HOME/.gem/ruby/2.4.0/bin:\
$HOME/.cargo/bin:\
$HOME/.npm-packages/bin:\
$HOME/.local/bin"

export _JAVA_AWT_WM_NONREPARENTING=1 # fix java guis
export MATLAB_JAVA="/usr/lib/jvm/java-8-openjdk/jre"

export QSYS_ROOTDIR="/home/alex/build/aur/tmp/yaourt-tmp-alex/aur-quartus-lite/pkg/quartus-lite//opt/altera/quartus/sopc_builder/bin"

export ALTERAOCLSDKROOT="/opt/altera/hld"

# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

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
