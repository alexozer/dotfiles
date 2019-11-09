# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.oh-my-zsh

HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE=true
plugins=(
  git
  pip
  command-not-found
  extract
  gitignore
  history-substring-search
  vi-mode
  last-working-dir
)

source "$ZSH"/oh-my-zsh.sh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# Search command history
bindkey -M vicmd "j" history-substring-search-down
bindkey -M vicmd "k" history-substring-search-up
setopt HIST_IGNORE_ALL_DUPS

# if neovim is installed, use it
if hash nvim 2>/dev/null; then
	export EDITOR=nvim
else
	export EDITOR=vim
fi

export HYPHEN_INSENSITIVE="true"
export COMPLETION_WAITING_DOTS="true"
export KEYTIMEOUT=1 # Don't pause much when entering normal mode
export CUAUV_SOFTWARE="$HOME/code/auv/"
export SDL_GAMECONTROLLERCONFIG="03000000790000004618000010010000,mayflash limited GameCube Controller Adapter,a:a3,b:b0,x:b2,y:b3,guide:b9,leftstick:a4,leftx:a0,lefty:a1,rightx:a5,righty:a2,lefttrigger:b4,righttrigger:b5,platform:Linux,"

alias vim=$EDITOR # Vim always points to whichever vim version is installed
alias svim="sudo -E $EDITOR" # Use sudo with vim
alias o='exo-open' # Open file with default program
alias matlab='matlab -nodesktop -nosplash' # Matlab repl
alias f=lnch
alias youtube-dl='youtube-dl --restrict-filenames'
alias cn='cd ~/doc/Dropbox/notes'
alias bm='ln -s "$(realpath .)" ~/"$(basename "$(realpath .)")"'
alias ck='cd ~/doc/projects/keyboard/qmk_firmware/keyboards/kbdfans/kbd75/keymaps/alexozer'

function pgen() {
  # Don't push if I just type 'pgen' for some reason
  pass generate "$@" && \
  echo 'Pushing changes to password store' && \
  pass git push
}

function pins() {
  pass insert "$@" && \
  echo 'Pushing changes to password store' && \
  pass git push
}

function oue() {
  ~/ro/UnrealEngine/Engine/Binaries/Linux/UE4Editor "$(realpath "$1")" -opengl4
}

alias oro='oue ~/ro/UnrealMKB/UnrealMKB/UnrealMKB.uproject'

# Auto ls
function chpwd {
  ls --color=always
}

# # Copying to clipboard didn't seem to be working
# function gist {
#   /usr/bin/gist -p "$@" | tee >(xsel -b)
# }
#
# function gis() {
#   gist -a -f "$1" < "$1"
# }

# Shortcuts to edit config files
function e {
case "$1" in
  keys)
    $EDITOR $HOME/.config/sxhkd/sxhkdrc
    ;;
  zsh)
    $EDITOR "$HOME/.zshrc"
    source "$HOME/.zshrc"
    ;;
  zshenv)
    $EDITOR "$HOME/.zshenv"
    ;;
  bspwm)
    $EDITOR $HOME/.config/bspwm/bspwmrc
    ;;
  i3)
    $EDITOR $HOME/.i3/config
    ;;
  vim)
    $EDITOR $HOME/.vimrc
    ;;
  startup)
    $EDITOR $HOME/.config/bspwm/startup.sh
    ;;
  env)
    $EDITOR $HOME/.zprofile
    ;;
  ssh)
    $EDITOR $HOME/.ssh/config
    ;;
  bar)
    $EDITOR $HOME/.config/polybar/config
    ;;
  *)
    echo "$1: invalid option"
    return 1
    ;;
esac
}

function cs {
  ~/cuauv/workspaces/worktrees/master/docker/auv-docker.py cdw "${1:-master}"
}

function auv-pull() {
  pushd
  cd ~/cuauv/workspaces/worktrees/master
  docker pull wds68/cuauv:master
  popd
}

# Calculator with vim, codi, and python
function calc {
  local syntax="${1:-python}"
  echo 'from math import *\nimport cmath\n\n' |\
    vim - -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax |\
    ALEDisable |\
    norm G" "$@"
  }

# Move contents of directory into current directory and delete original directory
function undir() {
  if [[ -z "$1" ]]; then
    echo "Usage: $0 [dir]"
    return 1
  fi

  if [[ ! -d "$1" ]]; then
    echo "Directory '$1' not found"
    return 1
  fi

  tmpRoot=~/.cache/undir
  mkdir -p "$tmpRoot"
  tmpDir="$(mktemp -d -p "$tmpRoot")"

  mv "$1"/*(D) "$tmpDir"
  rm -rf "$1"
  mv -i "$tmpDir"/*(D) .

  rm -rf "$tmpDir"
}

# Move contents of directory into new subdirectory
function redir() {
  if [[ -z "$1" ]]; then
    echo "Usage: $0 [dir]"
    return 1
  fi

  tmpRoot=~/.cache/undir
  mkdir -p "$tmpRoot"
  tmpDir="$(mktemp -d -p "$tmpRoot")"

  mv ./*(D) "$tmpDir"
  mv "$tmpDir" "$1"
}

# Store a system configuration file in dotfiles
function syskeep() {
  d=~/.dotfiles/system$(dirname "$1")
  mkdir -p "$d"
  cp "$1" "$d"/
}

function vbuild() {
  iverilog -g2012 -o "$1" "$1".v && ./"$1"
}

# OPAM configuration
. /home/alex/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
