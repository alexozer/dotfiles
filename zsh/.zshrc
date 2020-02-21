# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=~/.oh-my-zsh

HYPHEN_INSENSITIVE=true
COMPLETION_WAITING_DOTS="true"
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

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh
source /etc/profile.d/autojump.zsh

# if neovim is installed, use it
if hash nvim 2>/dev/null; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

alias vim=$EDITOR # Vim always points to whichever vim version is installed
alias svim="sudo -E $EDITOR" # Use sudo with vim
alias o='exo-open' # Open file with default program
alias matlab='matlab -nodesktop -nosplash' # Matlab repl
alias f=lnch
alias youtube-dl='youtube-dl --restrict-filenames'
alias cn='cd ~/doc/Dropbox/notes'
alias ck='cd ~/doc/projects/keyboard/qmk_firmware/keyboards/kbdfans/kbd75/keymaps/alexozer'
alias cdol='cd ~/.local/share/dolphin-emu/GC/USA'
alias makej='make -j$(nproc)'

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
  if [[ -z "$1" ]]; then
    echo "Please provide a project file"
  else
    ~/doc/projects/rolledout/UnrealEngine/Engine/Binaries/Linux/UE4Editor "$(realpath "$1")" -opengl4
  fi
}

alias oro='oue ~/doc/projects/rolledout/UnrealMKB/UnrealMKB/UnrealMKB.uproject'
alias rro='oro -game'

alias makedme='makej && sudo setcap cap_sys_ptrace=eip Dolphin-memory-engine && ./Dolphin-memory-engine'

# Bookmark a dir in my home directory
function bm() {
  link_name="${2:-"$(basename "$(realpath "$1")")"}"
  ln -s "$(realpath "$1")" ~/"$link_name"
}

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
  env)
    $EDITOR "$HOME/.zshenv"
    ;;
  startupenv)
    $EDITOR "$HOME/.zprofile"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
