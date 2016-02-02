export ZSH=/home/alex/.oh-my-zsh
export TERM="xterm-256color"
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git command-not-found extract gitignore history-substring-search vi-mode)

source $ZSH/oh-my-zsh.sh

# if neovim is installed, use it
if hash nvim 2>/dev/null; then
	alias vim=nvim
	export EDITOR=nvim
else
	export EDITOR=vim
fi

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

# shortcuts to edit config files
e() {
    case "$1" in
	keys)
	    vim $HOME/.config/sxhkd/sxhkdrc
	    ;;
	zsh)
	    vim "$HOME/.zshrc"
	    source "$HOME/.zshrc"
	    ;;
	zshenv)
	    vim "$HOME/.zshenv"
	    ;;
	bspwm)
	    vim $HOME/.config/bspwm/bspwmrc
	    ;;
	vim)
	    vim $HOME/.vimrc
	    ;;
	startup)
	    vim $HOME/.config/bspwm/startup.sh
	    ;;
	env)
		vim $HOME/.profile
		;;
	ssh)
		vim $HOME/.ssh/config
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

hw() {
	hwCache="$HOME/.hw-cache"
	baseCmd() {
		gcalcli --calendar=Homework --color_date=white $@
	}

	syncHw() {
		baseCmd calw 5 > "$hwCache"
	}

	if [ -z "$*" ]; then
		# make sure cache exists and is up-to-date
		if [ ! -f "$hwCache" ]; then
			syncHw
		else
			modDate="$(stat -c %y "$hwCache" | cut -d' ' -f1)"
			currDate="$(date +%Y-%m-%d)"
		 	if [ "$modDate" != "$currDate" ]; then
				syncHw
			fi
		fi

		cat "$hwCache"
		return
	fi

	firstArg="$1"
	shift
	case "$firstArg" in
	add)
		baseCmd quick "$*"
		;;
	rm)
		baseCmd delete "$*"
		;;
	edit)
		baseCmd edit "$*"
		;;
	sync)
		echo -n "Syncing..."
		syncHw
		echo " done."
		cat "$hwCache"
		return
		;;
	*)
		echo "Invalid command: $firstArg"
		return
		;;
	esac

	syncHw
	cat "$hwCache"
}
