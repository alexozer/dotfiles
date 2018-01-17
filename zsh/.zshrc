source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle extract
antigen bundle gitignore
antigen bundle history-substring-search
antigen bundle vi-mode
antigen bundle last-working-dir
antigen theme robbyrussell

antigen apply

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

alias vim=$EDITOR # Vim always points to whichever vim version is installed
alias svim="sudo -E $EDITOR" # Use sudo with vim
alias o='exo-open' # Open file with default program
alias matlab='matlab -nodesktop -nosplash' # Matlab repl
alias cs='cd $CUAUV_SOFTWARE'

# Auto ls
function chpwd {
	ls --color=always
}

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
	bar)
		$EDITOR $HOME/.config/polybar/config
		;;
	*)
	    echo "$1: invalid option"
	    return 1
	    ;;
    esac
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

	mv "$1"/*(D) .
	rm -rf "$1"
}

# OPAM configuration
. ~/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
