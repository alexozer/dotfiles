export ZSH=/home/alex/.oh-my-zsh
export TERM="xterm-256color"
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

source /usr/share/doc/pkgfile/command-not-found.zsh

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

# python console calculator
alias calc='python3 -ic "from math import *; import cmath"'

# matlab repl
alias matlab='matlab -nodesktop -nosplash'

# auv
alias build='ninja -C $CUAUV_SOFTWARE'
alias cs='cd $CUAUV_SOFTWARE'

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

auv() {
	if [[ -z "$1" ]]; then
		echo "Usage: auv [start|stop]"
	elif [[ "$1" = "start" ]]; then
		xhost +
		sudo systemctl start lxc@cuauv
	elif [[ "$1" = "stop" ]]; then
		xhost -
		sudo systemctl stop lxc@cuauv
	else
		echo "Invalid option"
		return 1
	fi
}

# cuauv aliases
alias t="trogdor"
alias c="auv-control-helm"
alias s="auv-shm-editor"
alias auv-mr="auv-mission-runner"
alias auv-pt="auv-pooltest"
alias shm="auv-shm-cli"

# OPAM configuration
. /home/alex/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
