export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
ZSH_THEME="robbyrussell"

plugins=(git extract gitignore history-substring-search vi-mode last-working-dir)

source $ZSH/oh-my-zsh.sh

# NB: gnome-terminal reports xterm-256color which is technically incorrect and
# behaves strangely with certain programs. Older versions of gnome-terminal set
# COLORTERM. Newer versions set VTE_VERSION
if [[ $VTE_VERSION -ge 3803 ]]; then
    # gnome-256color is equivalent to vte-256color
    export TERM=gnome-256color
fi

# if neovim is installed, use it
if hash nvim 2>/dev/null; then
	export EDITOR=nvim
else
	export EDITOR=vim
fi
alias vim=$EDITOR

# use sudo with vim
alias svim="sudo -E $EDITOR"

# use curl as wget
wget() {
	curl -L "$1" -o "$(basename $1)"
}

# auto ls
chpwd() {
    emulate -L zsh
    ls
}

# open file with default program
alias o='exo-open'

# Codi
# Usage: codi [filetype] [filename]
calc() {
  local syntax="${1:-python}"
  shift
  echo 'from math import *\nimport cmath\n\n' |\
  vim - -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax |\
	norm G" "$@"
}

# matlab repl
alias matlab='matlab -nodesktop -nosplash'

# shortcuts to edit config files
e() {
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
	vim)
	    $EDITOR $HOME/.vimrc
	    ;;
	startup)
	    $EDITOR $HOME/.config/bspwm/startup.sh
	    ;;
	env)
		$EDITOR $HOME/.profile
		;;
	ssh)
		$EDITOR $HOME/.ssh/config
		;;
	*)
	    echo "$1: invalid option"
	    return 1
	    ;;
    esac
}

# search command history
bindkey -M vicmd "j" history-substring-search-down
bindkey -M vicmd "k" history-substring-search-up
setopt HIST_IGNORE_ALL_DUPS

export CUAUV_SOFTWARE="$HOME/code/auv/"
alias cs='cd $CUAUV_SOFTWARE'

# OPAM configuration
. /home/alex/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
